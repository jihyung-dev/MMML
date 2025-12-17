package com.smu.householdaccount.controller.account;

import com.smu.householdaccount.dto.ledger.LedgerDetailDto;
import com.smu.householdaccount.dto.ledger.LedgerSaveRequest;
import com.smu.householdaccount.dto.ledger.LedgerSummaryDto;
import com.smu.householdaccount.dto.ledger.LedgerSummaryDto.DailySummary;
import com.smu.householdaccount.entity.account.LedgerEntry;
import com.smu.householdaccount.service.account.LedgerService;
import com.smu.householdaccount.service.common.RedisService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 캘린더 및 차트 데이터 등 JSON API 요청을 전담하는 컨트롤러입니다.
 * @RestController를 사용하여 모든 메서드가 JSON을 반환하도록 보장합니다.
 */
@RestController
@RequestMapping("/ledger/api")
@RequiredArgsConstructor
public class LedgerApiController {

    private final LedgerService ledgerService;
    private final RedisService redisService;
    // [New] 대시보드(차트+캘린더) 데이터 통합 API
    @GetMapping("/dashboard-data")
    public ResponseEntity<LedgerSummaryDto> getDashboardData(
            @RequestParam("year") int year,
            @RequestParam("month") int month,
            @SessionAttribute(name = "loginUserId", required = false) String memberId,
            @RequestParam(required = false) Long group_Id
    ) {
        // [수정] memberId가 없을 경우 예외 처리 (로그인이 안 된 상태)
        if (memberId == null) {
            return ResponseEntity.badRequest().build();
        }

        // [수정] group_id가 null이어도 서비스에서 알아서 '개인 가계부'를 찾도록 처리되어야 함
        // LedgerService.getDashboardDataNew 메서드 내부에서 resolveGroup 호출 확인 필요
        return ResponseEntity.ok(ledgerService.getDashboardDataNew(year, month, memberId, group_Id));
    }
    // [수정] DataTables용 상세 내역 리스트 API
    @GetMapping("/transaction-list")
    public ResponseEntity<List<LedgerDetailDto>> getTransactionList(
            @RequestParam int year,
            @RequestParam int month,
            @SessionAttribute(name = "loginUserId", required = false) String memberId,
            @RequestParam(required = false) Long group_Id
    ) {
        // 서비스 메서드 호출 (이름 바꿨으니 맞춰주세요)
        // [수정] Redis 조회 로직 제거 또는 단순화 (Service 내부 resolveGroup에서 처리함)
        //Long groupId = redisService.getGroupIdByMemberId(memberId, group_Id).orElse(null); // 일단 group_id가 null일 경우 진행 안되게 js에서 처리는 해놨는데, 여기까지 들어오면 에러 100퍼
        return ResponseEntity.ok(ledgerService.getTransactionList(memberId, group_Id, year, month));
    }
    // [New] 단건 등록 API
    @PostMapping("/entry")
    public ResponseEntity<String> addLedgerEntry(
            @RequestBody LedgerSaveRequest requestDto,
            @SessionAttribute(name = "loginUserId", required = false) String memberId,
            @RequestParam(required = false) Long groupId // [추가] 쿼리 파라미터로 받음
    ) {
        if (memberId == null) memberId = "testuser"; // 테스트용

        ledgerService.addSingleEntry(requestDto, memberId, groupId);

        return ResponseEntity.ok("Saved successfully");
    }

    // 1. 일별 상세 리스트 조회 API
    @GetMapping("/daily-list")
    public ResponseEntity<List<LedgerDetailDto>> getDailyList(
            @RequestParam String date,
            @SessionAttribute(name = "loginUserId", required = false) String memberId,
            @RequestParam(required = false) Long groupId // [추가] 파라미터 받기
    ) {
        if (memberId == null) memberId = "testuser";

        // [수정] groupId를 서비스로 전달
        return ResponseEntity.ok(ledgerService.getDailyTransactionList(memberId, date, groupId));
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