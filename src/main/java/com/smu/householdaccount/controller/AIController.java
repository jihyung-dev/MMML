package com.smu.householdaccount.controller;

import com.smu.householdaccount.dto.CategoryUpdateReq;
import com.smu.householdaccount.dto.TransActionBulkReq;
import com.smu.householdaccount.dto.python.ClassifyTransactionResponse;
import com.smu.householdaccount.dto.python.FineTuneResponse;
import com.smu.householdaccount.dto.python.FineTuneStatusResponse;
import com.smu.householdaccount.dto.python.UpdateCategoryResponse;
import com.smu.householdaccount.service.AIService;
import com.smu.householdaccount.util.Log;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller()
@RequestMapping("/ai")
public class AIController {
    private final AIService aiService;

    public AIController(AIService aiService) {
        this.aiService = aiService;
    }

    @GetMapping("/") 
    @ResponseBody
    public String aiTest() throws Exception{
        aiService.getAuthUrl();
        return "success";
    }

    /**
     *
     * @param transActions
     * @return
     */
    @PostMapping("/update-category")
    public ResponseEntity<?> updateCategory(@RequestBody TransActionBulkReq transActions) {

        UpdateCategoryResponse res = aiService.requestCategoryUpdate(transActions);

        // 1) Python 서버 자체 통신 실패
        if (res == null) {
            Log.e("AIService", "AI 서버 응답 없음(null)");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("AI 서버 오류");
        }

        // 2) status = fail (완전 실패)
        if ("fail".equalsIgnoreCase(res.getStatus())) {
            Log.e("AIService", "카테고리 업데이트 완전 실패");
            if (res.getFailedItems() != null) {
                Log.e("AIService", "Fail details: " + res.getFailedItems().toString());
            }
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(res);
        }

        // 3) status = partial (일부 실패)
        if ("partial".equalsIgnoreCase(res.getStatus())) {
            Log.w("AIService", "일부 카테고리 저장 실패: " + res.getFailed());
            if (res.getFailedItems() != null) {
                Log.w("AIService", "FailedItems: " + res.getFailedItems());
            }
        }

        // 4) success
        Log.success("AIService", "카테고리 업데이트 성공 (" + res.getCount() + "건)");
        return ResponseEntity.ok(res);
    }

    /**
     * 유저 거래 내역을 파이썬 서버에서 카테고리 분류해줌
     * @param req
     * @return
     */
    @PostMapping("/classify-transaction")
    public ResponseEntity<?> requestClassifyTransaction(@RequestBody TransActionBulkReq req) {

        ClassifyTransactionResponse res = aiService.requestClassifyBulk(req);

        // 1) Python 서버 자체 통신 실패(null)
        if (res == null) {
            Log.e("AIService", "AI 서버 응답 없음(null)");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("AI 서버 오류");
        }

        // 2) status = fail (요청 전체 실패)
        if ("fail".equalsIgnoreCase(res.getStatus())) {
            Log.e("AIService", "거래 분류 전체 실패");

            if (res.getFailedItems() != null) {
                Log.e("AIService", "Fail details: " + res.getFailedItems());
            }

            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(res);
        }

        // 3) status = partial (일부 실패)
        if ("partial".equalsIgnoreCase(res.getStatus())) {
            Log.w("AIService", "일부 거래 분류 실패: " + res.getFailed());

            if (res.getFailedItems() != null) {
                Log.w("AIService", "FailedItems: " + res.getFailedItems());
            }
        }

        // 4) status = success
        Log.success("AIService", "거래 분류 성공 (" + res.getCount() + "건)");

        return ResponseEntity.ok(res);
    }

    @PostMapping("/fine-tune")
    public ResponseEntity<?> requestFineTuneStart() {
        FineTuneResponse res = aiService.requestFineTune();

        if(res == null){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("AI 서버 응답 없음");
        }

        return ResponseEntity.ok(res);
    }

    @GetMapping("/fine-tune/status")
    public ResponseEntity<?> fineTuneStatus() {

        FineTuneStatusResponse res = aiService.requestFineTuneStatus();

        if (res == null) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("AI 서버 응답 없음");
        }

        return ResponseEntity.ok(res);
    }
}

