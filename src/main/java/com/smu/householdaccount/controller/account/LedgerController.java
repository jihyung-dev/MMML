package com.smu.householdaccount.controller.account;

import com.smu.householdaccount.dto.ledger.LedgerSummaryDto;
import com.smu.householdaccount.dto.python.ClassifyTransactionResponse;
import com.smu.householdaccount.entity.account.BudgetGroup;
import com.smu.householdaccount.entity.account.GroupMember;
import com.smu.householdaccount.entity.account.GroupProperty;
import com.smu.householdaccount.repository.account.GroupMemberRepository;
import com.smu.householdaccount.repository.account.GroupPropertyRepository;
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
import org.springframework.ui.Model;

import java.util.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/ledger")
public class LedgerController {

    private final LedgerService ledgerService;
    private final AIService aiService;
    private final RedisService redisService;

    private final GroupMemberRepository groupMemberRepository;
    private final GroupPropertyRepository groupPropertyRepository; // [추가] 속성 조회용

    /**
     * 환율 받아오는 API
     * 현재 원화만 받아오게 설정됨
     * @return
     */
    @GetMapping("/api/exchangeRate")
    public ResponseEntity<?> getExchangeRate(){
        Double res = ledgerService.getExchangeRate();
        return ResponseEntity.ok(res);
    }

    /**
     * 사용자의 계좌 내역을 받아오는 API(전체 내역)
     * @return
     */
    @GetMapping("/api/request/userLedger/all")
    public ResponseEntity<?> getAllLedger(
            @SessionAttribute(name="loginUserId") String memberId,
            @RequestParam(required = false) Long group_Id
    ){
        ledgerService.getLedgerAll(memberId, group_Id);
        return ResponseEntity.ok("test");
    }

    /**
     * 사용자의 계좌 내역을 받아오는 API(일부 내역)
     * @return
     */
    @GetMapping("/api/request/userLedger/month")
    public ResponseEntity<?> getMonthlyGroupLedger(
            @RequestParam("year") int start_year,
            @RequestParam("month") int start_month,
            @RequestParam("period") int period,
            @SessionAttribute(name="loginUserId") String memberId,
            @RequestParam(required = false) Long group_Id
            ){
        return ResponseEntity.ok(ledgerService.getMonthLedger(start_year, start_month, period, memberId, group_Id));
    }

    /**
     * 사용자의 계좌 내역을 받아오는 API(6개월)
     * @return
     */
    @GetMapping("/api/request/userLedger/6month")
    public ResponseEntity<?> getMonthlyLedgerList(
            @RequestParam("year") int start_year,
            @RequestParam("month") int start_month,
            @RequestParam("period") int period,
            @SessionAttribute(name="loginUserId") String memberId,
            @RequestParam(required = false) Long group_Id
    ){
        return ResponseEntity.ok(ledgerService.get6MonthLedger(start_year, start_month, period, memberId, group_Id));
    }

    /**
     * 1개월치 차트를 그리기 위한 데이터 요청 API
     * @param start_year
     * @param start_month
     * @return
     */
    @GetMapping("/api/chart")
    public ResponseEntity<?> getMonthlyChart(
            @RequestParam("year") int start_year,
            @RequestParam("month") int start_month,
            @SessionAttribute(name="loginUserId") String memberId,
            @RequestParam(required = false) Long group_Id
    ) {
        LedgerSummaryDto dto = ledgerService.getMonthlyChart(start_year, start_month, memberId, group_Id);
        return ResponseEntity.ok(
                dto
        );
    }
    // ===================================================================
    //  [NEW API] 캘린더 UI 전용 JSON 데이터 반환 엔드포인트
    //  - /ledger/calendar URL을 사용하여 캘린더 데이터만 반환합니다.
    // ===================================================================
    @GetMapping("") // ✅ 반드시 추가해야 합니다!
    public String home(
            @RequestParam(required = false) Long groupId,
            Model model,
            @SessionAttribute(name = "loginUserId", required = false) String memberId // 세션에서 ID 가져오기
    ) {
        // [수정] 가짜 데이터(mockGroups) 삭제하고 진짜 DB 조회
        List<Map<String, Object>> myGroups = new ArrayList<>();

        if (memberId != null) {
            // 내가 속한 그룹 리스트 조회
            List<GroupMember> groupMembers = groupMemberRepository.findByMember_MemberId(memberId);

            for (GroupMember gm : groupMembers) {
//                // 수정 전
//                // 개인 가계부(P)는 제외하고 모임(G)만 사이드바에 표시 (선택 사항)
//                // 만약 모두 표시하려면 if문 제거
//                if (gm.getGroup().getGroupMembers().size() > 0) {

                    //수정 후
                // [수정] 그룹의 속성(Type)을 확인하여 'P'(개인) 타입은 목록에서 제외
                // (Repository에 findByGroup 메서드가 필요합니다. 아래 참고)
                BudgetGroup group = gm.getGroup();

                GroupProperty prop = groupPropertyRepository.findByGroup(group).orElse(null);

                // 'P' 타입이 아니거나, 속성이 없는 경우(혹시 모를 예외)에만 목록에 추가
                if (prop != null && prop.getGroupType() == 'P') {
                    continue; // 개인 가계부는 패스 (이미 상단 '나의 가계부' 버튼이 있으므로)
                }
                    Map<String, Object> map = new HashMap<>();
                    map.put("groupId", gm.getGroup().getId());
                    map.put("groupName", gm.getGroup().getGroupName());
                    myGroups.add(map);
                }
            }


        model.addAttribute("myGroups", myGroups);
        model.addAttribute("currentGroupId", groupId);

        return "household/ledger_home"; // 파일 위치에 맞게 수정 (예: "household/ledger_home")
    }

    /**
     * 실제로는 금융 API를 호출해야 하지만, json호출 하는것으로 대체
     * 호출 후 python 서버에 전송
     * @return
     */
    @PostMapping("/api/loadData")
    public ResponseEntity<?> getLedgerData(
            HttpSession session,
            @RequestParam(required = false) Long groupId
    ){
        String memberId = (String) session.getAttribute("loginUserId");
        ClassifyTransactionResponse res  = ledgerService.getLedgerTransaction(memberId, null, groupId);

        if(res != null)
            redisService.setGroupId(memberId, groupId);
        return ResponseEntity.ok(res);
    }

    @PostMapping("/api/import/excel")
    @ResponseBody
    public Map<String, Object> previewExcel(
            @RequestParam("file") MultipartFile file
    ) {
        return ledgerService.previewExcel(file);// 화면에 노출되는 샘플은 3행만 노출
    }

    @PostMapping("/api/import/analyze")
    public ResponseEntity<?> analyzeExcel(
             HttpSession session,
             @RequestBody Map<String, Object> previewJson,
             @RequestParam(required = false) Long group_Id
    ) {
        Map<String, Object> result = aiService.analyze(previewJson);

        // 🚨 실패 응답 처리
        if ("error".equals(result.get("status"))) {
            return ResponseEntity.badRequest().body(result);
        }

        String memberId = (String) session.getAttribute("loginUserId");
        ClassifyTransactionResponse res  = ledgerService.handleExcelClassification(memberId, result, group_Id);

        if(res != null)
            redisService.setGroupId(memberId, group_Id);

        // 🔥 정상 응답이면 그대로 전달
        return ResponseEntity.ok(res);
    }

    @GetMapping("/api/request/group_id")
    @ResponseBody
    public Map<String, Object> getGroupId(
            HttpSession session,
            @RequestParam(required = false) Long group_Id
    ) {
        String memberId = (String) session.getAttribute("loginUserId");

        // Redis 조회
        Optional<Long> groupIdOpt = redisService.getGroupIdByMemberId(memberId, group_Id);

        Map<String, Object> res = new HashMap<>();

        // ★ [핵심] 그룹 ID가 없어도 hasGroup을 true로 줘서 화면은 뜨게 만듭니다.
        // (왜냐? Service에서 resolveGroup이 알아서 찾아줄 거니까요!)
        res.put("hasGroup", true);
        res.put("groupId", groupIdOpt.orElse(null));

        return res;
    }
}
