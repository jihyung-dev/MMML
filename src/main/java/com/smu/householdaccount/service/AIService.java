package com.smu.householdaccount.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.householdaccount.dto.CategoryUpdateReq;
import com.smu.householdaccount.dto.TransActionBulkReq;
import com.smu.householdaccount.dto.python.ClassifyTransactionResponse;
import com.smu.householdaccount.dto.python.FineTuneResponse;
import com.smu.householdaccount.dto.python.FineTuneStatusResponse;
import com.smu.householdaccount.dto.python.UpdateCategoryResponse;
import com.smu.householdaccount.util.Log;
import com.smu.householdaccount.web.SafeHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

@Service
public class AIService {
    @Value("${render.render-host}")
    private String renderHost;

    private final SafeHttpClient http;
    private final ObjectMapper mapper = new ObjectMapper();
    @Autowired
    SafeHttpClient safeHttpClient;

    public AIService(SafeHttpClient http) {
        this.http = http;
    }

    public void getAuthUrl() throws Exception{
        String result = safeHttpClient.get(renderHost, new HttpHeaders());
        System.out.println(result);
    }

    /**
     * 사용자가 수정한 카테고리 수집하는 메서드
     * @param req
     */
    public UpdateCategoryResponse requestCategoryUpdate(TransActionBulkReq req){
        try {
            String url = renderHost + "/ai/update-category";
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            String jsonBody = mapper.writeValueAsString(req);

            UpdateCategoryResponse response =
                    http.post(url, headers, jsonBody, UpdateCategoryResponse.class);

            return response;
        } catch (JsonProcessingException e) {
            throw new RuntimeException("requestCategoryUpdate error: " + e.getMessage());
        }
    }

    /**
     * 사용자의 금융 내역을 분류해주는 API 호출
     */
    public ClassifyTransactionResponse requestClassifyBulk(TransActionBulkReq req){
        try {
            String url = renderHost + "/ai/classify-transaction";
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            String jsonBody = mapper.writeValueAsString(req);

            ClassifyTransactionResponse response =
                    http.post(url, headers, jsonBody, ClassifyTransactionResponse.class);

            System.out.println("Python Response: " + response);

            return response;

        } catch (Exception e) {
            throw new RuntimeException("requestClassifyBulk error: " + e.getMessage());
        }
    }

    /**
     * 사용자 데이터 학습 요청
     */
    public FineTuneResponse requestFineTune() {
        try {
            String url = renderHost + "/ai/fine-tune";

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            String result = http.post(url, headers, null);
            if (result == null) {
                Log.e("Finetune", "응답 없음");
                return null;
            }

            FineTuneResponse response = mapper.readValue(result, FineTuneResponse.class);
            Log.d("Finetune", "학습 시작: " + response);

            return response;

        } catch (Exception e) {
            Log.e("Finetune error", e.getMessage());
            throw new RuntimeException("requestFineTune error: " + e.getMessage());
        }
    }

    public FineTuneStatusResponse requestFineTuneStatus() {
        try {
            String url = renderHost + "/ai/fine-tune/status";

            HttpHeaders headers = new HttpHeaders();

            String result = http.get(url, headers);
            if (result == null) {
                Log.e("FineTuneStatus", "응답 없음");
                return null;
            }

            FineTuneStatusResponse response = mapper.readValue(result, FineTuneStatusResponse.class);
            Log.d("FineTuneStatus", response.toString());

            return response;

        } catch (Exception e) {
            Log.e("FinetuneStatus error", e.getMessage());
            throw new RuntimeException("requestFineTuneStatus error: " + e.getMessage());
        }
    }

}
