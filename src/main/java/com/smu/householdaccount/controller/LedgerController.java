package com.smu.householdaccount.controller;

import com.smu.householdaccount.dto.ledger.LedgerSummaryDto;
import com.smu.householdaccount.entity.LedgerEntry;
import com.smu.householdaccount.service.LedgerService;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/ledger")
public class LedgerController {

    private final LedgerService ledgerService;

    public LedgerController(LedgerService ledgerService) {
        this.ledgerService = ledgerService;
    }

    /**
     * 환율 받아오는 API
     * 현재 원화만 받아오게 설정됨
     * @return
     */
    @GetMapping("/exchangeRate")
    public ResponseEntity<?> getExchangeRate(){
        Double res = ledgerService.getExchangeRate();
        return ResponseEntity.ok(res);
    }

    /**
     * 사용자의 계좌 내역을 받아오는 API(전체 내역)
     * @return
     */
    @GetMapping("/request/userLedger/all")
    public ResponseEntity<?> getAllLedger(){
        ledgerService.getLedgerAll();
        return ResponseEntity.ok("test");
    }

    /**
     * 사용자의 계좌 내역을 받아오는 API(일부 내역)
     * @return
     */
    @GetMapping("/request/userLedger/month")
    public ResponseEntity<?> getMonthlyGroupLedger(
            @RequestParam("year") int start_year,
            @RequestParam("month") int start_month
            ){
        return ResponseEntity.ok(ledgerService.getMonthLedger(start_year, start_month));
    }

    /**
     * 1개월치 차트를 그리기 위한 데이터 요청 API
     * @param start_year
     * @param start_month
     * @return
     */
    @GetMapping("/chart")
    public ResponseEntity<?> getMonthlyChart(
            @RequestParam("year") int start_year,
            @RequestParam("month") int start_month
    ) {
        LedgerSummaryDto dto = ledgerService.getMonthlyChart(start_year, start_month);
        return ResponseEntity.ok(
                dto
        );
    }
    // ===================================================================
    //  [NEW API] 캘린더 UI 전용 JSON 데이터 반환 엔드포인트
    //  - /ledger/calendar URL을 사용하여 캘린더 데이터만 반환합니다.
    // ===================================================================

    /**
     * 캘린더 UI에 표시할 월별 일자별 수입/지출 소계 데이터를 JSON으로 반환합니다.
     * (FullCalendar의 events source로 사용됩니다.)
     */
    @GetMapping("/calendar")
    public ResponseEntity<List<LedgerSummaryDto.DailySummary>> getCalendarEvents(
            @RequestParam int year,
            @RequestParam int month
    ) {
        // Service에서 계산된 List<DailySummary>를 반환합니다.
        // 이 데이터는 캘린더에서 수입(위) / 지출(아래)를 표시하는 데 사용됩니다.
        List<LedgerSummaryDto.DailySummary> dailyStats = ledgerService.getCalendarDailyStats(year, month);
        return ResponseEntity.ok(dailyStats);
    }
    @GetMapping("")
    public String home(){
        return "household/blank";
    }


    /**
     * [API] DataTables용 JSON 데이터 반환
     * URL: /ledger/api/entries?year=2025&month=10
     */
    @GetMapping("/api/entries")
    @ResponseBody // JSON으로 반환
    public ResponseEntity<List<LedgerEntry>> getLedgerEntries(
            @RequestParam int year,
            @RequestParam int month
    ) {
        List<LedgerEntry> entries = (List<LedgerEntry>) ledgerService.getMonthLedger(year, month);
        return ResponseEntity.ok(entries);
    }
}
