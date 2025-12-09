package com.smu.householdaccount.controller.account;

import com.smu.householdaccount.dto.ledger.LedgerSummaryDto;
import com.smu.householdaccount.dto.python.ClassifyTransactionResponse;
import com.smu.householdaccount.service.ai.AIService;
import com.smu.householdaccount.service.account.LedgerService;
import com.smu.householdaccount.service.common.RedisService;
import com.smu.householdaccount.util.Log;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/ledger")
public class LedgerController {

    private final LedgerService ledgerService;
    private final AIService aiService;
    private final RedisService redisService;

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
    public ResponseEntity<?> getAllLedger(
            @SessionAttribute(name="loginUserId") String memberId
    ){
        ledgerService.getLedgerAll(memberId);
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
            @RequestParam("period") int period,
            @SessionAttribute(name="loginUserId") String memberId
            ){
        return ResponseEntity.ok(ledgerService.getMonthLedger(start_year, start_month, period, memberId));
    }

    /**
     * 사용자의 계좌 내역을 받아오는 API(6개월)
     * @return
     */
    @GetMapping("/request/userLedger/6month")
    public ResponseEntity<?> getMonthlyLedgerList(
            @RequestParam("year") int start_year,
            @RequestParam("month") int start_month,
            @RequestParam("period") int period,
            @SessionAttribute(name="loginUserId") String memberId
    ){
        return ResponseEntity.ok(ledgerService.get6MonthLedger(start_year, start_month, period, memberId));
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
            @RequestParam("month") int start_month,
            @SessionAttribute(name="loginUserId") String memberId
    ) {
        LedgerSummaryDto dto = ledgerService.getMonthlyChart(start_year, start_month, memberId);
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

    /**
     * 실제로는 금융 API를 호출해야 하지만, json호출 하는것으로 대체
     * 호출 후 python 서버에 전송
     * @return
     */
    @PostMapping("/loadData")
    public ResponseEntity<?> getLedgerData(
            HttpSession session
    ){
        String memberId = (String) session.getAttribute("loginUserId");
        ClassifyTransactionResponse res  = ledgerService.getLedgerTransaction(memberId, null);

        if(res != null)
            redisService.setGroupId(memberId);
        return ResponseEntity.ok(res);
    }

    @GetMapping("/test")
    public ResponseEntity<?> test(@SessionAttribute(name="loginUserId") String user) {
        System.out.println(user);
        return ResponseEntity.ok(user);
    }

    @PostMapping("/import/excel")
    @ResponseBody
    public Map<String, Object> previewExcel(
            @RequestParam("file") MultipartFile file
    ) {
        return ledgerService.previewExcel(file);// 화면에 노출되는 샘플은 3행만 노출
    }

    @PostMapping("/import/analyze")
    public ResponseEntity<?> analyzeExcel(
             HttpSession session,
            @RequestBody Map<String, Object> previewJson
    ) {
        Map<String, Object> result = aiService.analyze(previewJson);

        // 🚨 실패 응답 처리
        if ("error".equals(result.get("status"))) {
            return ResponseEntity.badRequest().body(result);
        }

        String memberId = (String) session.getAttribute("loginUserId");
        ClassifyTransactionResponse res  = ledgerService.handleExcelClassification(memberId, result);

        if(res != null)
            redisService.setGroupId(memberId);

        // 🔥 정상 응답이면 그대로 전달
        return ResponseEntity.ok(res);
    }

    @GetMapping("/request/group_id")
    @ResponseBody
    public Map<String, Object> getGroupId(HttpSession session) {
        String memberId = (String) session.getAttribute("loginUserId");

        Optional<Long> groupIdOpt =
                redisService.getGroupIdByMemberId(memberId);

        Map<String, Object> res = new HashMap<>();
        res.put("hasGroup", groupIdOpt.isPresent());
        res.put("groupId", groupIdOpt.orElse(null));

        return res;
    }
}
