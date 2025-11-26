package com.smu.householdaccount.controller;

import com.smu.householdaccount.service.LedgerService;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
            @Param("start_year") int start_year,
            @Param("start_month") int start_month,
            @Param("end_year") int end_year,
            @Param("end_month") int end_month
            ){
        ledgerService.getMonthLedger(start_year, start_month, end_year, end_month);
        return ResponseEntity.ok("success");
    }
}
