package com.smu.householdaccount.controller.account;

import com.smu.householdaccount.entity.account.LedgerEntry;
import com.smu.householdaccount.service.common.EmailService;
import com.smu.householdaccount.service.account.ExcelService;
import com.smu.householdaccount.service.account.LedgerService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
            @RequestParam int month,
            @SessionAttribute(name = "loginUserId", required = false) String memberId
            ){

        // chart API와 동일한 DTO 조회
        List<LedgerEntry> summary = ledgerService.getYearDataToExcel(year, month, memberId);

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
            @RequestParam String email,
            @SessionAttribute(name = "loginUserId", required = false) String memberId
    ) {
        try {
            // chart API와 동일한 DTO 조회
            List<LedgerEntry> summary = ledgerService.getYearDataToExcel(year, month, memberId);

            byte[] excelFile = excelService.buildMonthlyLedgerExcel(summary, year, month);

            emailService.sendExcelFile(
                    email,
                    year + "년 " + " 가계부 내역",
                    "첨부된 엑셀 파일을 확인해 주세요.",
                    excelFile
            );

            return ResponseEntity.ok("메일 전송 완료!");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("메일 전송 실패: " + e.getMessage());
        }
    }
}
