package com.smu.householdaccount.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.householdaccount.dto.ledger.*;
import com.smu.householdaccount.dto.ledger.LedgerSummaryDto.*;
import com.smu.householdaccount.entity.BudgetGroup;
import com.smu.householdaccount.entity.LedgerEntry;
import com.smu.householdaccount.repository.BudgetGroupRepository;
import com.smu.householdaccount.repository.LedgerRepository;
import com.smu.householdaccount.util.Log;
import com.smu.householdaccount.util.Utility;
import com.smu.householdaccount.web.SafeHttpClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.time.YearMonth;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class LedgerService {
    @Value("${exchangerate.api-host}")
    private String host;

    private final LedgerRepository ledgerRepository;
    private final BudgetGroupRepository budgetGroupRepository;

    private final SafeHttpClient http;
    private final ObjectMapper mapper;

    public LedgerService(LedgerRepository ledgerRepository, BudgetGroupRepository budgetGroupRepository, SafeHttpClient http, ObjectMapper mapper) {
        this.ledgerRepository = ledgerRepository;
        this.budgetGroupRepository = budgetGroupRepository;
        this.http = http;
        this.mapper = mapper;
    }

    public Double getExchangeRate(){
        String url = host + "/latest?from=USD&to=KRW";
        HttpHeaders headers = new HttpHeaders();
        String response = http.get(url, headers, String.class);

        JsonNode json = null;
        try {
            json = mapper.readTree(response);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        return json.get("rates").get("KRW").asDouble();
    }

    /**
     * 사용자의 모든 거래 내역
     */
    public List<LedgerEntry> getLedgerAll(){
        BudgetGroup group = budgetGroupRepository.findById(1l).orElseThrow();
        LocalDateTime start = LocalDateTime.of(2025, 8, 1,0,0,0);
        LocalDateTime end   = LocalDateTime.of(2025, 8, 31,0,0,0);
        Log.d("데이터 확인", group.toString());
        Log.d("그룹 : " , ledgerRepository.findByGroupAndDateRange(group, start, end).toString());
        return null;
    }

    /**
     * 월별 사용자의 거래 내역
     */
    public LedgerSummaryDto getMonthLedger(int year, int month, int period){
        BudgetGroup group = budgetGroupRepository.findById(1l).orElseThrow(); // 수정 필요.하드코딩
        LocalDateTime date = LocalDateTime.of(year, month, 1,0,0,0);
        // 기준이 되는 달의 1일
        LocalDate targetMonth = LocalDate.of(year, month, 1);

        // 3개월 전 1일
        LocalDateTime startDate = targetMonth.minusMonths(period).withDayOfMonth(1).atStartOfDay();

        // 기준달의 마지막날
        LocalDateTime endDate = targetMonth.withDayOfMonth(targetMonth.lengthOfMonth()).atStartOfDay();
        List<LedgerEntry> entries = ledgerRepository.findByGroupAndDateRange(group, startDate, endDate);
        return getLedgerSummary(entries);
    }

    public List<MonthlyLedgerDto> get6MonthLedger(int year, int month, int period){
        BudgetGroup group = budgetGroupRepository.findById(1l).orElseThrow(); // 수정 필요.하드코딩
        LocalDateTime date = LocalDateTime.of(year, month, 1,0,0,0);
        // 기준이 되는 달의 1일
        LocalDate targetMonth = LocalDate.of(year, month, 1);

        // n개월 전 1일
        LocalDateTime startDate = targetMonth.minusMonths(period).withDayOfMonth(1).atStartOfDay();

        // 기준달의 마지막날
        LocalDateTime endDate = targetMonth.withDayOfMonth(targetMonth.lengthOfMonth()).atStartOfDay();
        List<LedgerEntry> entries = ledgerRepository.findByGroupAndDateRange(group, startDate, endDate);
        return getMonthlySummary(entries);
    }

    public LedgerSummaryDto getMonthlyChart(int year, int month) {
        BudgetGroup group = budgetGroupRepository.findById(1l).orElseThrow(); // 수정 필요.하드코딩
        LocalDateTime date_start = LocalDateTime.of(year, month, 1,0,0,0);
        LocalDateTime date_end = LocalDateTime.of(year, month, Utility.endOfMonth(year, month),0,0,0);
        List<LedgerEntry> entries = ledgerRepository.findByGroupAndDateRange(group, date_start, date_end);

        return getLedgerSummary(entries);
    }

    /**
     * 1년치 데이터(1월 ~ 현재)
     * @param year
     * @param month
     * @return
     */
    public List<LedgerEntry> getYearDataToExcel(int year, int month) {
        BudgetGroup group = budgetGroupRepository.findById(1l).orElseThrow(); // 수정 필요.하드코딩
        LocalDateTime date_start = LocalDateTime.of(year, 1, 1,0,0,0);
        LocalDateTime date_end = LocalDateTime.of(year, month, Utility.endOfMonth(year, month),0,0,0);

        List<LedgerEntry> entries = ledgerRepository.findByGroupAndDateRange(group, date_start, date_end);

        return entries;
    }



    public LedgerSummaryDto getLedgerSummary(List<LedgerEntry> entries){
        BigDecimal totalExpense = BigDecimal.ZERO;
        BigDecimal totalIncome = BigDecimal.ZERO;

        Map<String, BigDecimal> categoryMap = new HashMap<>();
        Map<LocalDateTime, DailySummary> dailyMap  = new HashMap<>();

        for(LedgerEntry entry : entries){
            LocalDateTime date = entry.getOccurredAt();
            dailyMap.putIfAbsent(date, LedgerSummaryDto.DailySummary.builder()
                    .date(date)
                    .expense(BigDecimal.ZERO)
                    .income(BigDecimal.ZERO).build());
            // 전체 지출 더하기
            if(entry.getEntryType().equals("EXPENSE")){
                totalExpense = totalExpense.add(entry.getEntryAmount());

                // 카테고리
                String category = entry.getCategory().getCategoryName();
                // map에 없으면 새로 생성해서 더하기
                categoryMap.put(category, categoryMap.getOrDefault(category, BigDecimal.ZERO).add(entry.getEntryAmount()));
                // 데일리
                dailyMap.get(date).setExpense(dailyMap.get(date).getExpense().add(entry.getEntryAmount()));
            } else if(entry.getEntryType().equals("INCOME")){
                totalIncome = totalIncome.add(entry.getEntryAmount());

                dailyMap.get(date).setIncome(dailyMap.get(date).getIncome().add(entry.getEntryAmount()));
            }
        }
        return LedgerSummaryDto.builder()
                .totalExpense(totalExpense)
                .totalIncome(totalIncome)
                .categories(
                        categoryMap.entrySet().stream()
                                .map(e -> LedgerSummaryDto.CategorySummary.builder()
                                        .categoryName(e.getKey())
                                        .amount(e.getValue())
                                        .build()).toList()
                )
                .daily(
                        dailyMap.values().stream()
                                .sorted(Comparator.comparing(LedgerSummaryDto.DailySummary::getDate))
                                .toList()
                )
                .build();
    }

    public List<MonthlyLedgerDto> getMonthlySummary(List<LedgerEntry> entries) {

        // month → list<entry> 매핑
        Map<YearMonth, List<LedgerEntry>> monthMap = new HashMap<>();

        for (LedgerEntry entry : entries) {
            LocalDateTime date = entry.getOccurredAt();
            YearMonth ym = YearMonth.from(date);

            monthMap.computeIfAbsent(ym, k -> new ArrayList<>()).add(entry);
        }

        // 그룹핑된 month별로 getLedgerSummary를 호출
        List<MonthlyLedgerDto> result = new ArrayList<>();

        monthMap.entrySet().stream()
                .sorted(Map.Entry.comparingByKey()) // 오래된 월부터 정렬
                .forEach(entry -> {
                    YearMonth ym = entry.getKey();
                    List<LedgerEntry> monthEntries = entry.getValue();

                    LedgerSummaryDto monthSummary = getLedgerSummary(monthEntries);

                    result.add(MonthlyLedgerDto.builder()
                            .month(ym.toString()) // "2025-10"
                            .summary(monthSummary)
                            .build());
                });

        return result;
    }

// ========================================================
// [New] 대시보드 데이터 처리 (기존 로직 영향 없음)
// ========================================================
    public LedgerSummaryDto getDashboardDataNew(int year, int month) {
        // 1. 날짜 및 그룹 설정
        LocalDateTime start = LocalDateTime.of(year, month, 1, 0, 0, 0);
        LocalDateTime end = start.plusMonths(1).minusSeconds(1);
        BudgetGroup myGroup = budgetGroupRepository.findById(1L).orElseThrow(); // 임시 그룹 ID 1

        // 2. 카테고리별 합계
        List<CategorySumDto> catSums = ledgerRepository.findCategorySumNew(myGroup, start, end);

        List<LedgerSummaryDto.CategorySummary> categories = catSums.stream()
                .map(dto -> LedgerSummaryDto.CategorySummary.builder()
                        .categoryName(dto.getCategoryName())
                        .amount(dto.getTotalAmount())
                        .build())
                .collect(Collectors.toList());

        // 3. 일별 합계
        List<DailySumDto> daySums = ledgerRepository.findDailySumNew(myGroup, start, end);

        // 4. 일별 데이터 정리 (Map 사용)
        Map<LocalDate, LedgerSummaryDto.DailySummary> dailyMap = new HashMap<>();
        BigDecimal totalIncome = BigDecimal.ZERO;
        BigDecimal totalExpense = BigDecimal.ZERO;

        for (DailySumDto dto : daySums) {
            dailyMap.putIfAbsent(dto.getDate(), LedgerSummaryDto.DailySummary.builder()
                    .date(dto.getDate().atStartOfDay())
                    .income(BigDecimal.ZERO)
                    .expense(BigDecimal.ZERO)
                    .build());

            LedgerSummaryDto.DailySummary summary = dailyMap.get(dto.getDate());
            if ("INCOME".equals(dto.getEntryType())) {
                summary.setIncome(dto.getTotalAmount());
                totalIncome = totalIncome.add(dto.getTotalAmount());
            } else if ("EXPENSE".equals(dto.getEntryType())) {
                summary.setExpense(dto.getTotalAmount());
                totalExpense = totalExpense.add(dto.getTotalAmount());
            }
        }

        // 5. 날짜순 정렬
        List<LedgerSummaryDto.DailySummary> dailyList = dailyMap.values().stream()
                .sorted(Comparator.comparing(LedgerSummaryDto.DailySummary::getDate))
                .collect(Collectors.toList());

        // 6. 결과 반환
        return LedgerSummaryDto.builder()
                .categories(categories)
                .daily(dailyList)
                .totalIncome(totalIncome)
                .totalExpense(totalExpense)
                .build();
    }

    // [수정] DataTables용 상세 내역 조회 (DTO로 변환 반환)
    @Transactional(readOnly = true)
    public List<LedgerDetailDto> getTransactionList(Long groupId, int year, int month) {
        // 1. 그룹 및 날짜 조회
        BudgetGroup group = budgetGroupRepository.findById(groupId)
                .orElseThrow(() -> new IllegalArgumentException("Group not found"));

        LocalDateTime start = LocalDateTime.of(year, month, 1, 0, 0, 0);
        LocalDateTime end = start.plusMonths(1).minusSeconds(1);

        // 2. DB 조회
        List<LedgerEntry> entries = ledgerRepository.findByGroupAndDateRange(group, start, end);

        // 3. 엔티티 -> DTO 변환 (여기서 필요한 정보만 쏙쏙 뽑습니다)
        return entries.stream()
                .map(entry -> LedgerDetailDto.builder()
                        .id(entry.getId())
                        .occurredAt(entry.getOccurredAt())
                        .entryType(entry.getEntryType())
                        // ★ 여기가 핵심! 카테고리 객체에서 이름만 꺼내서 문자열로 담음
                        .categoryName(entry.getCategory().getCategoryName())
                        .memo(entry.getMemo())
                        .placeOfUse(entry.getPlaceOfUse())
                        .payType(entry.getPayType())
                        .entryAmount(entry.getEntryAmount())
                        .build())
                .collect(java.util.stream.Collectors.toList());
    }
}
