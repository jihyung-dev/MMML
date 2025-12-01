package com.smu.householdaccount.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.householdaccount.dto.ledger.LedgerSummaryDto;
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

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public LedgerSummaryDto getMonthLedger(int year, int month){
        BudgetGroup group = budgetGroupRepository.findById(1l).orElseThrow(); // 수정 필요.하드코딩
        LocalDateTime date = LocalDateTime.of(year, month, 1,0,0,0);
        // 기준이 되는 달의 1일
        LocalDate targetMonth = LocalDate.of(year, month, 1);

        // 3개월 전 1일
        LocalDateTime startDate = targetMonth.minusMonths(3).withDayOfMonth(1).atStartOfDay();

        // 기준달의 마지막날
        LocalDateTime endDate = targetMonth.withDayOfMonth(targetMonth.lengthOfMonth()).atStartOfDay();
        List<LedgerEntry> entries = ledgerRepository.findByGroupAndDateRange(group, startDate, endDate);
        return getLedgerSummary(entries);
    }

    public LedgerSummaryDto getMonthlyChart(int year, int month) {
        BudgetGroup group = budgetGroupRepository.findById(1l).orElseThrow(); // 수정 필요.하드코딩
        LocalDateTime date_start = LocalDateTime.of(year, month, 1,0,0,0);
        LocalDateTime date_end = LocalDateTime.of(year, month, Utility.endOfMonth(year, month),0,0,0);
        List<LedgerEntry> entries = ledgerRepository.findByGroupAndDateRange(group, date_start, date_end);

        return getLedgerSummary(entries);
    }

    public List<LedgerEntry> getMonthlyToExcel(int year, int month) {
        BudgetGroup group = budgetGroupRepository.findById(1l).orElseThrow(); // 수정 필요.하드코딩
        LocalDateTime date_start = LocalDateTime.of(year, month, 1,0,0,0);
        LocalDateTime date_end = LocalDateTime.of(year, month, Utility.endOfMonth(year, month),0,0,0);
        List<LedgerEntry> entries = ledgerRepository.findByGroupAndDateRange(group, date_start, date_end);

        return entries;
    }

    public List<DailySummary> getCalendarDailyStats(int year, int month) {
        LedgerSummaryDto summary = getMonthlyChart(year, month);

        // 캘린더가 요구하는 DailySummary 리스트만 반환
        return summary.getDaily();
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
}
