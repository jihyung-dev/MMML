package com.smu.householdaccount.controller;

import com.smu.householdaccount.dto.ledger.LedgerSummaryDto;
import com.smu.householdaccount.service.LedgerService;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
            @RequestParam("month") int start_month,
            @RequestParam("period") int period
            ){
        return ResponseEntity.ok(ledgerService.getMonthLedger(start_year, start_month, period));
    }

    /**
     * 사용자의 계좌 내역을 받아오는 API(6개월)
     * @return
     */
    @GetMapping("/request/userLedger/6month")
    public ResponseEntity<?> getMonthlyLedgerList(
            @RequestParam("year") int start_year,
            @RequestParam("month") int start_month,
            @RequestParam("period") int period
    ){
        return ResponseEntity.ok(ledgerService.get6MonthLedger(start_year, start_month, period));
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

    @GetMapping("")
    public String home(){
        return "household/blank";
    }
}
