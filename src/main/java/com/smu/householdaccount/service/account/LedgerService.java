package com.smu.householdaccount.service.account;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.householdaccount.dto.ledger.*;
import com.smu.householdaccount.dto.ledger.LedgerSummaryDto.*;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.smu.householdaccount.dto.CategoryUpdateReq;
import com.smu.householdaccount.dto.TransActionBulkReq;
import com.smu.householdaccount.dto.ledger.LedgerSummaryDto;
import com.smu.householdaccount.dto.ledger.MonthlyLedgerDto;
import com.smu.householdaccount.dto.python.ClassifyTransactionResponse;
import com.smu.householdaccount.dto.python.TransactionResult;
import com.smu.householdaccount.entity.account.BudgetGroup;
import com.smu.householdaccount.entity.account.Category;
import com.smu.householdaccount.entity.account.LedgerEntry;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.repository.account.BudgetGroupRepository;
import com.smu.householdaccount.repository.account.CategoryRepository;
import com.smu.householdaccount.repository.account.LedgerRepository;
import com.smu.householdaccount.repository.common.MemberRepository;
import com.smu.householdaccount.util.Log;
import com.smu.householdaccount.util.Utility;
import com.smu.householdaccount.web.SafeHttpClient;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.math.BigDecimal;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.time.YearMonth;
import java.util.*;

import java.util.function.Function;

import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class LedgerService {
    @Value("${exchangerate.api-host}")
    private String host;

    @Value("${render.render-host}")
    private String renderHost;

    private final LedgerRepository ledgerRepository;
    private final BudgetGroupRepository budgetGroupRepository;
    private final CategoryRepository categoryRepository;
    private final MemberRepository memberRepository;
    private final RedisService redisService;

    private final LedgerSaveService ledgerSaveService;

    private final SafeHttpClient http;
    private final ObjectMapper mapper;


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
    public List<LedgerEntry> getLedgerAll(String memberId){
        Long groupId = redisService.getGroupIdByMemberId(memberId).orElse(null);
        BudgetGroup group = budgetGroupRepository.findById(groupId).orElseThrow();
        LocalDateTime start = LocalDateTime.of(2025, 8, 1,0,0,0);
        LocalDateTime end   = LocalDateTime.of(2025, 8, 31,0,0,0);
        Log.d("데이터 확인", group.toString());
        Log.d("그룹 : " , ledgerRepository.findByGroupAndDateRange(group, start, end).toString());
        return null;
    }

    /**
     * 월별 사용자의 거래 내역
     */
    public LedgerSummaryDto getMonthLedger(int year, int month, int period, String memberId){
        Long groupId = redisService.getGroupIdByMemberId(memberId).orElse(null);
        BudgetGroup group = budgetGroupRepository.findById(groupId).orElseThrow(); // 수정 필요.하드코딩
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

    public List<MonthlyLedgerDto> get6MonthLedger(int year, int month, int period, String memberId){
        Long groupId = redisService.getGroupIdByMemberId(memberId).orElse(null);
        BudgetGroup group = budgetGroupRepository.findById(groupId).orElseThrow(); // 수정 필요.하드코딩
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

    public LedgerSummaryDto getMonthlyChart(int year, int month, String memberId) {
        Long groupId = redisService.getGroupIdByMemberId(memberId).orElse(null);
        BudgetGroup group = budgetGroupRepository.findById(groupId).orElseThrow(); // 수정 필요.하드코딩
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
    public List<LedgerEntry> getYearDataToExcel(int year, int month, String memberId) {
        Long groupId = redisService.getGroupIdByMemberId(memberId).orElse(null);
        BudgetGroup group = budgetGroupRepository.findById(groupId).orElseThrow(); // 수정 필요.하드코딩
        LocalDateTime date_start = LocalDateTime.of(year, 1, 1, 0, 0, 0);
        LocalDateTime date_end = LocalDateTime.of(year, month, Utility.endOfMonth(year, month), 0, 0, 0);

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
    public LedgerSummaryDto getDashboardDataNew(int year, int month, String memberId) {
        Long groupId = redisService.getGroupIdByMemberId(memberId).orElse(null);
        // 1. 날짜 및 그룹 설정
        LocalDateTime start = LocalDateTime.of(year, month, 1, 0, 0, 0);
        LocalDateTime end = start.plusMonths(1).minusSeconds(1);
        BudgetGroup myGroup = budgetGroupRepository.findById(groupId).orElseThrow();

        // 2. 카테고리별 합계
        List<CategorySumDto> catSums = ledgerRepository.findCategorySumNew(myGroup, start, end);

        List<LedgerSummaryDto.CategorySummary> categories = catSums.stream()
                .map(dto -> LedgerSummaryDto.CategorySummary.builder()
                        .categoryName(dto.getCategoryName())
                        .amount(dto.getTotalAmount())
                        .build())
                .collect(Collectors.toList());

        // 3. 일별 합계 (Repository에서 COUNT도 같이 가져왔다고 가정)
        List<DailySumDto> daySums = ledgerRepository.findDailySumNew(myGroup, start, end);

        // 4. 일별 데이터 정리 (Map 사용)
        Map<LocalDate, LedgerSummaryDto.DailySummary> dailyMap = new HashMap<>();
        BigDecimal totalIncome = BigDecimal.ZERO;
        BigDecimal totalExpense = BigDecimal.ZERO;

        for (DailySumDto dto : daySums) {
            // [기존 코드 유지] 초기값 설정
            dailyMap.putIfAbsent(dto.getDate(), LedgerSummaryDto.DailySummary.builder()
                    .date(dto.getDate().atStartOfDay())
                    .income(BigDecimal.ZERO)
                    .expense(BigDecimal.ZERO)
                    .incomeCount(0L)  // 초기화
                    .expenseCount(0L) // 초기화
                    .build());

            LedgerSummaryDto.DailySummary summary = dailyMap.get(dto.getDate());

            // [★ 핵심 수정 ★] 건수(TxnCount)를 DTO에 담는 코드 추가!
            if ("INCOME".equals(dto.getEntryType())) {
                summary.setIncome(dto.getTotalAmount());
                summary.setIncomeCount(dto.getTxnCount()); // <--- 이 줄을 꼭 추가하세요!
                totalIncome = totalIncome.add(dto.getTotalAmount());
            } else if ("EXPENSE".equals(dto.getEntryType())) {
                summary.setExpense(dto.getTotalAmount());
                summary.setExpenseCount(dto.getTxnCount()); // <--- 이 줄을 꼭 추가하세요!
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

    /**
     *
     */
    public ClassifyTransactionResponse getLedgerTransaction(
            String memberId,
            List<CategoryUpdateReq> externalTransactions // Excel 결과가 있으면 여기에 전달
    ) {
        String url = renderHost + "/ai/classify-transaction";
        Log.d("그룹 확인", ledgerRepository.findGroupIdByMemberId(memberId).toString());

        try {
            List<CategoryUpdateReq> dtoList;
            // 1) 외부 데이터(excel→python 결과) 사용
            if (externalTransactions != null && !externalTransactions.isEmpty()) {
                dtoList = externalTransactions;

            } else {
                // 2) fallback: 더미 파일 사용
                dtoList = loadDummyLedgerJson();
            }

            // 3) Python 요청 객체 생성
            TransActionBulkReq req = new TransActionBulkReq();
            req.setTransActions(dtoList);

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            String requestJson = mapper.writeValueAsString(req);
            Log.d("📤 Sending for classify: {}", requestJson);

            // 4) Python Classifier 호출
            ClassifyTransactionResponse response =
                    http.post(url, headers, requestJson, ClassifyTransactionResponse.class);

            if (response == null) {
                throw new RuntimeException("🔥 Classifier 응답이 null입니다!");
            }
            // 5) Python 결과 -> DTO merge
            mergePythonResult(dtoList, response.getResults());
            Log.d("[data] :", dtoList.toString());
            // 6) DB 저장
            ledgerSaveService.saveMergedLedger(dtoList, memberId);

            return response;

        } catch (Exception e) {
            throw new RuntimeException("Ledger Transaction 처리 중 오류", e);
        }
    }


    private BigDecimal toBigDecimal(Object obj) {
        if (obj == null) return null;

        if (obj instanceof BigDecimal bd) {
            return bd;
        }
        if (obj instanceof Number num) {
            return BigDecimal.valueOf(num.doubleValue());
        }
        return new BigDecimal(obj.toString());
    }

    // 파이썬에서 받은 카테고리와 병합
    private void mergePythonResult(
            List<CategoryUpdateReq> dtoList,
            List<TransactionResult> aiList
    ) {

        // 카테고리 이름 치환을 위한 데이터
        List<Category> categories = getCategories();
        // Map으로 카테고리 이름 매칭
        Map<String, Category> categoryMap = categories.stream()
                .collect(Collectors.toMap(
                        cat -> cat.getCategoryName().trim(),
                        Function.identity()
                ));

        for (CategoryUpdateReq dto : dtoList) {
            aiList.stream()
                    .filter(ai -> {
                        // 1) 상호명 비교 (필요하면 normalize 써도 됨)
                        boolean placeMatch = Objects.equals(ai.getPlaceOfUse(), dto.getPlaceOfUse());

                        // 2) 금액 비교 (Integer → BigDecimal 변환)
                        BigDecimal dtoAmt = dto.getEntryAmount();
                        Integer aiAmtInt = ai.getEntryAmount();
                        boolean amountMatch = false;
                        if (dtoAmt != null && aiAmtInt != null) {
                            BigDecimal aiAmt = BigDecimal.valueOf(aiAmtInt.longValue());
                            amountMatch = aiAmt.compareTo(dtoAmt) == 0;
                        }

                        // 3) 날짜 비교 (지금은 문자열 그대로)
                        boolean dateMatch = Objects.equals(ai.getOccurredAt(), dto.getOccurredAt());

                        return placeMatch && amountMatch && dateMatch;
                    })
                    .findFirst()
                    .ifPresent(ai -> dto.setCategory(ai.getCategory()));

            String categoryName = dto.getCategory().trim();
            Category category = categoryMap.get(categoryName);
            if (category == null) {
                Log.e("[카테고리 매칭 실패] 이름: {}", categoryName);
                continue;
            }
            dto.setCategory(category.getCategoryId());
        }
    }

    public List<Category> getCategories() {
        return categoryRepository.findByCategoryIdStartingWith("C");
    }

    /**
     * [New] 캘린더에서 단건 등록 (시간 포함)
     */
    @Transactional
    public void addSingleEntry(LedgerSaveRequest req, String memberId) {
        System.out.println("=== [새 내역 저장 요청] ===");
        System.out.println("Member ID: " + memberId);

        // 1. 멤버 조회
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new IllegalArgumentException("❌ 오류: DB에 '" + memberId + "' 사용자가 없습니다."));

        // 2. [수정] 그룹 조회 -> 없으면 '자동 생성' (에러 방지)
        BudgetGroup group = budgetGroupRepository.findByOwner(member)
                .orElseGet(() -> {
                    System.out.println("⚠️ 그룹이 없어 '기본 가계부' 그룹을 새로 생성합니다.");
                    BudgetGroup newGroup = new BudgetGroup();
                    newGroup.setOwner(member);
                    newGroup.setGroupName("기본 가계부"); // 기본 이름 설정
                    newGroup.setCreatedAt(LocalDateTime.now());
                    return budgetGroupRepository.save(newGroup); // 저장 후 반환
                });

        // 3. 카테고리 매칭 (기존 동일)
        Category category = categoryRepository.findByCategoryIdStartingWith("C").stream()
                .filter(c -> c.getCategoryName().trim().equals(req.getCategoryName()))
                .findFirst()
                .orElseGet(() -> {
                    // 없으면 'C0010'(기타) 조회, 그것도 없으면 아무거나 첫 번째 것 조회
                    return categoryRepository.findById("C0010")
                            .orElseGet(() -> categoryRepository.findAll().stream().findFirst()
                                    .orElseThrow(() -> new IllegalArgumentException("❌ 오류: 카테고리 데이터가 없습니다.")));
                });

        // 4. 엔티티 생성 및 저장
        LedgerEntry entry = new LedgerEntry();
        entry.setGroupId(group);
        entry.setMember(member);
        entry.setEntryType(req.getEntryType());
        entry.setEntryAmount(req.getAmount());
        entry.setOccurredAt(req.getDateTime());
        entry.setCategory(category);
        entry.setMemo(req.getMemo());
        entry.setPlaceOfUse(req.getPlace());
        entry.setPayType(req.getPayType());
        entry.setCurrency("KRW");
        entry.setCreatedAt(LocalDateTime.now());

        ledgerRepository.save(entry);
        System.out.println("=== 저장 완료 ===");
    }
    // [수정] 1. 일별 상세 내역 조회 (안전장치 추가)
    @Transactional(readOnly = true)
    public List<LedgerDetailDto> getDailyTransactionList(String memberId, String dateStr) {
        // 1. 멤버 조회 (없으면 에러 대신 빈 리스트 반환)
        Member member = memberRepository.findById(memberId).orElse(null);
        if (member == null) {
            System.out.println("⚠️ [투어용] 사용자가 없어 빈 리스트를 반환합니다. ID: " + memberId);
            return Collections.emptyList();
        }

        // 2. 그룹 조회
        BudgetGroup group = budgetGroupRepository.findByOwner(member).orElse(null);
        if (group == null) {
            return Collections.emptyList();
        }

        try {
            LocalDate date = LocalDate.parse(dateStr);
            LocalDateTime start = date.atStartOfDay();
            LocalDateTime end = date.atTime(23, 59, 59);

            List<LedgerEntry> entries = ledgerRepository.findByGroupAndDateRange(group, start, end);

            return entries.stream()
                    .map(entry -> LedgerDetailDto.builder()
                            .id(entry.getId())
                            .occurredAt(entry.getOccurredAt())
                            .entryType(entry.getEntryType())
                            .categoryName(entry.getCategory().getCategoryName())
                            .entryAmount(entry.getEntryAmount())
                            .memo(entry.getMemo())
                            .placeOfUse(entry.getPlaceOfUse())
                            .payType(entry.getPayType())
                            .build())
                    .collect(Collectors.toList());
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    // 2. 수정 (Update)
    @Transactional
    public void updateEntry(Long entryId, LedgerSaveRequest req, String memberId) {
        LedgerEntry entry = ledgerRepository.findById(entryId)
                .orElseThrow(() -> new IllegalArgumentException("내역 없음"));

        // 작성자 본인 확인
        if(!entry.getMember().getMemberId().equals(memberId)) throw new IllegalArgumentException("권한 없음");

        // 값 업데이트
        entry.setEntryAmount(req.getAmount());
        entry.setEntryType(req.getEntryType());
        entry.setOccurredAt(req.getDateTime()); //
        entry.setMemo(req.getMemo());
        entry.setPlaceOfUse(req.getPlace());
        entry.setPayType(req.getPayType());

        // 카테고리 변경 로직은 addSingleEntry와 동일하게 처리
        // ...
    }

    // 3. 삭제 (Delete)
    @Transactional
    public void deleteEntry(Long entryId, String memberId) {
        LedgerEntry entry = ledgerRepository.findById(entryId).orElseThrow();
        if(!entry.getMember().getMemberId().equals(memberId)) throw new IllegalArgumentException("권한 없음");
        ledgerRepository.delete(entry);
    }

    public Map<String, Object> previewExcel(MultipartFile file) {

        Map<String, Object> result = new HashMap<>();

        String originalName = file.getOriginalFilename().toLowerCase();

        try {
            if (originalName.endsWith(".csv")) {
                return previewCsv(file);  // 전체 CSV rows 반환
            }

            // === XLS/XLSX 처리 ===
            Workbook workbook = WorkbookFactory.create(file.getInputStream());
            Sheet sheet = workbook.getSheetAt(0);

            Row headerRow = sheet.getRow(0);

            List<String> headers = extractHeaderColumns(headerRow);
            List<List<String>> rows = extractAllRows(sheet, headers.size()); // 전체 rows

            result.put("fileName", originalName);
            result.put("fileSize", (file.getSize()/1024) + " KB");
            result.put("headers", headers);
            result.put("rows", rows); // 전체 rows!

            return result;

        } catch (Exception ex) {
            Log.e("Excel 파싱 실패, CSV 시도: {}", ex.getMessage());
            return previewCsv(file);
        }
    }

    private Map<String, Object> previewCsv(MultipartFile file) {
        Map<String, Object> result = new HashMap<>();

        try {
            String csvContent = readCsvAsUtf8(file);

            BufferedReader reader =
                    new BufferedReader(new StringReader(csvContent));

            List<String> headers = new ArrayList<>();
            List<List<String>> rows = new ArrayList<>();

            String line;
            int rowIndex = 0;

            while ((line = reader.readLine()) != null) {
                String[] cols = line.split(",");

                if (rowIndex == 0) {
                    headers.addAll(Arrays.asList(cols));
                } else {
                    rows.add(Arrays.asList(cols));
                }
                rowIndex++;
            }

            result.put("fileName", file.getOriginalFilename());
            result.put("fileSize", (file.getSize() / 1024) + " KB");
            result.put("headers", headers);
            result.put("rows", rows);

            return result;

        } catch (Exception e) {
            throw new RuntimeException("CSV 파일 분석 실패", e);
        }
    }

    /** 헤더 추출 */
    private List<String> extractHeaderColumns(Row headerRow) {
        List<String> headers = new ArrayList<>();

        for (Cell cell : headerRow) {
            String value = convertCellToString(cell);
            headers.add(value);
        }

        return headers;
    }

    private List<List<String>> extractAllRows(Sheet sheet, int colSize) {
        List<List<String>> rows = new ArrayList<>();

        int lastRow = sheet.getLastRowNum();

        for (int i = 1; i <= lastRow; i++) {
            Row row = sheet.getRow(i);
            if (row == null) break;

            List<String> rowData = new ArrayList<>();

            for (int col = 0; col < colSize; col++) {
                Cell cell = row.getCell(col);
                rowData.add(convertCellToString(cell));
            }
            rows.add(rowData);
        }

        return rows;
    }


    /** POI Cell → String 변환 유틸 */
    private String convertCellToString(Cell cell) {
        if (cell == null) return "";

        CellType type = cell.getCellType();

        switch (type) {
            case STRING:
                return cell.getStringCellValue().trim();

            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    return cell.getLocalDateTimeCellValue().toLocalDate().toString();
                }
                return String.valueOf(cell.getNumericCellValue());

            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());

            case FORMULA:
                try {
                    return cell.getStringCellValue();
                } catch (IllegalStateException e) {
                    return String.valueOf(cell.getNumericCellValue());
                }

            case BLANK:
            default:
                return "";
        }
    }

    // 파일로 불러오는 경우
    private List<CategoryUpdateReq> loadDummyLedgerJson() throws IOException {
        String path = "C:\\Users\\kosmo\\Desktop\\project\\data\\dummy\\ledger\\test_dummy.json";

        ObjectMapper snakeMapper = new ObjectMapper();
        snakeMapper.setPropertyNamingStrategy(PropertyNamingStrategies.SNAKE_CASE);

        List<Map<String, Object>> rawList =
                snakeMapper.readValue(new File(path), new TypeReference<>() {});

        return rawList.stream()
                .map(map -> {
                    CategoryUpdateReq dto = new CategoryUpdateReq();
                    dto.setEntryType((String) map.get("entry_type"));
                    dto.setPayType((String) map.get("pay_type"));
                    dto.setCardType((String) map.get("card_type"));
                    dto.setEntryAmount(toBigDecimal(map.get("entry_amount")));
                    dto.setCurrency((String) map.getOrDefault("currency", "KRW"));
                    dto.setOccurredAt((String) map.get("occurred_at"));
                    dto.setPlaceOfUse((String) map.get("place_of_use"));
                    dto.setMemo((String) map.getOrDefault("memo", null));
                    dto.setCategory(null);
                    return dto;
                })
                .toList();
    }

    public ClassifyTransactionResponse handleExcelClassification(
            String memberId,
            Map<String, Object> pythonResult
    ) {
        try {
            // 1) payload 추출
            Map<String, Object> payload =
                    (Map<String, Object>) pythonResult.get("payload");

            if (payload == null || payload.isEmpty()) {
                throw new IllegalArgumentException("payload가 없습니다.");
            }
            // 2) transActions 가져오기
            List<Map<String, Object>> transMaps =
                    (List<Map<String, Object>>) payload.get("transActions");

            if (transMaps == null || transMaps.isEmpty()) {
                throw new IllegalArgumentException("transActions 데이터가 없습니다.");
            }
            // 3) JSON Map → CategoryUpdateReq로 변환
            List<CategoryUpdateReq> transList = transMaps.stream()
                    .map(map -> mapper.convertValue(map, CategoryUpdateReq.class))
                    .toList();

            Log.i(" Excel 전처리 데이터 rows: {}", String.valueOf(transList.size()));
            // 4) 기존 로직 호출
            return getLedgerTransaction(memberId, transList);

        } catch (Exception e) {
            Log.e(" Excel 분류 처리 실패: {}", e.getMessage());
            if(memberId == null){
                throw new RuntimeException("로그인이 필요한 기능입니다.", e);
            }
            throw new RuntimeException("Excel 기반 카테고리 분류 처리 중 오류 발생", e);
        }
    }

    // 시간 변환
    private LocalDateTime normalizeDate(String input) {
        if (input == null || input.length() < 10) {
            throw new IllegalArgumentException("Invalid date format: " + input);
        }

        String dateOnly = input.substring(0, 10);
        return LocalDateTime.parse(dateOnly + "T00:00:00");
    }

    // 포맷 체크
    private String readCsvAsUtf8(MultipartFile file) throws IOException {
        byte[] raw = file.getBytes();

        // 1차: UTF-8 시도
        String utf8 = new String(raw, StandardCharsets.UTF_8);

        // 깨짐 감지 → CP949 fallback
        if (looksBroken(utf8)) {
            return new String(raw, Charset.forName("CP949"));
        }

        return utf8;
    }

    private boolean looksBroken(String text) {
        return text.contains("�")
                || text.matches(".*[ìíëêð].*");
    }

}
