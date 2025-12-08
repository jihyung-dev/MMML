package com.smu.householdaccount.controller.account;

import com.smu.householdaccount.dto.ledger.LedgerDetailDto;
import com.smu.householdaccount.dto.ledger.LedgerSaveRequest;
import com.smu.householdaccount.dto.ledger.LedgerSummaryDto;
import com.smu.householdaccount.service.account.LedgerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 캘린더 및 차트 데이터 등 JSON API 요청을 전담하는 컨트롤러입니다.
 * @RestController를 사용하여 모든 메서드가 JSON을 반환하도록 보장합니다.
 */
@RestController
@RequestMapping("/api/ledger")
@RequiredArgsConstructor
public class LedgerApiController {

    private final LedgerService ledgerService;
    // [New] 대시보드(차트+캘린더) 데이터 통합 API
    @GetMapping("/dashboard-data")
    public ResponseEntity<LedgerSummaryDto> getDashboardData(
            @RequestParam("year") int year,
            @RequestParam("month") int month
    ) {
        return ResponseEntity.ok(ledgerService.getDashboardDataNew(year, month));
    }
    // [수정] DataTables용 상세 내역 리스트 API
    @GetMapping("/transaction-list")
    public ResponseEntity<List<LedgerDetailDto>> getTransactionList(
            @RequestParam int year,
            @RequestParam int month
    ) {
// 서비스 메서드 호출 (이름 바꿨으니 맞춰주세요)
        return ResponseEntity.ok(ledgerService.getTransactionList(1L, year, month));
    }
    // [New] 단건 등록 API
    @PostMapping("/entry")
    public ResponseEntity<String> addLedgerEntry(
            @RequestBody LedgerSaveRequest requestDto,
            @SessionAttribute(name = "loginUserId", required = false) String memberId
    ) {
        if (memberId == null) memberId = "testuser"; // 테스트용

        ledgerService.addSingleEntry(requestDto, memberId);

        return ResponseEntity.ok("Saved successfully");
    }

    // 1. 일별 상세 리스트 조회
    @GetMapping("/daily-list")
    public ResponseEntity<List<LedgerDetailDto>> getDailyList(
            @RequestParam String date,
            @SessionAttribute(name = "loginUserId", required = false) String memberId
    ) {
        if (memberId == null) memberId = "testuser";
        return ResponseEntity.ok(ledgerService.getDailyTransactionList(memberId, date));
    }

    // 2. 수정 API
    @PutMapping("/entry/{id}")
    public ResponseEntity<String> updateEntry(
            @PathVariable Long id,
            @RequestBody LedgerSaveRequest req,
            @SessionAttribute(name = "loginUserId", required = false) String memberId
    ) {
        if (memberId == null) memberId = "testuser";
        ledgerService.updateEntry(id, req, memberId);
        return ResponseEntity.ok("Updated");
    }

    // 3. 삭제 API
    @DeleteMapping("/entry/{id}")
    public ResponseEntity<String> deleteEntry(
            @PathVariable Long id,
            @SessionAttribute(name = "loginUserId", required = false) String memberId
    ) {
        if (memberId == null) memberId = "testuser";
        ledgerService.deleteEntry(id, memberId);
        return ResponseEntity.ok("Deleted");
    }

}