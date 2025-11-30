package com.smu.householdaccount.controller;

import com.smu.householdaccount.dto.ledger.LedgerSummaryDto;
import com.smu.householdaccount.entity.LedgerEntry;
import com.smu.householdaccount.service.EmailService;
import com.smu.householdaccount.service.ExcelService;
import com.smu.householdaccount.service.LedgerService;
import com.smu.householdaccount.util.Log;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/excel")
public class ExcelExportController {

    private final ExcelService excelService;
    private final LedgerService ledgerService;
    private final EmailService emailService;

    public ExcelExportController(ExcelService excelService, LedgerService ledgerService, EmailService emailService) {
        this.excelService = excelService;
        this.ledgerService = ledgerService;
        this.emailService = emailService;
    }

    @GetMapping("/export")
    public ResponseEntity<?> export(
            @RequestParam int year,
            @RequestParam int month
            ){

        // chart API와 동일한 DTO 조회
        List<LedgerEntry> summary = ledgerService.getMonthlyToExcel(year, month);

        byte[] file = excelService.buildMonthlyLedgerExcel(summary, year, month);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=ledger.xlsx")
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(file);
    }

    @GetMapping("/export/mail")
    public ResponseEntity<?> exportAndSendMail(
            @RequestParam int year,
            @RequestParam int month,
            @RequestParam String email
    ) {
        try {
            // chart API와 동일한 DTO 조회
            List<LedgerEntry> summary = ledgerService.getMonthlyToExcel(year, month);

            byte[] excelFile = excelService.buildMonthlyLedgerExcel(summary, year, month);

            emailService.sendExcelFile(
                    email,
                    year + "년 " + month + "월 가계부 내역",
                    "첨부된 엑셀 파일을 확인해 주세요.",
                    excelFile
            );

            return ResponseEntity.ok("메일 전송 완료!");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("메일 전송 실패: " + e.getMessage());
        }
    }
}
