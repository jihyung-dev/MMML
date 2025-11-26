package com.smu.householdaccount.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.householdaccount.dto.payment.VerificationResult;
import com.smu.householdaccount.entity.OrderMain;
import com.smu.householdaccount.repository.OrderMainRepository;
import com.smu.householdaccount.repository.PaymentTransactionRepository;
import com.smu.householdaccount.util.Log;
import com.smu.householdaccount.web.SafeHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Service
public class PortOneVerifyService {
    @Value("${portone.api-key}")
    private String apiKey;

    @Value("${portone.api-secret}")
    private String apiSecret;

    @Value("${portone.api-host}")
    private String host;

    @Autowired
    SafeHttpClient safeHttpClient;

    @Autowired
    private ObjectMapper objectMapper;

    private final OrderMainRepository orderRepo;
    private final PaymentTransactionRepository paymentRepo;

    public PortOneVerifyService(OrderMainRepository orderRepo, PaymentTransactionRepository paymentRepo) {
        this.orderRepo = orderRepo;
        this.paymentRepo = paymentRepo;
    }

    // 토큰 발급
    private String getAccessToken() {
        String url = host + "/users/getToken";

        Map<String, String> body = new HashMap<>();
        body.put("imp_key", apiKey);
        body.put("imp_secret", apiSecret);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        String jsonBody = "";
        try {
            jsonBody = objectMapper.writeValueAsString(body);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("JSON 변환 실패", e);
        }

        Map<String, Object> result = safeHttpClient.post(url, headers, jsonBody, Map.class);

        Map<String, Object> responseData = (Map<String, Object>) result.get("response");
        if (responseData == null) {
            throw new RuntimeException("토큰 발급 실패: response 필드 없음");
        }

        return (String) responseData.get("access_token");
    }

    // 실제 결제내역 조회 및 검증
    public VerificationResult verificationResult(String impUid) throws Exception{
        String accessToken = getAccessToken();
        String url = "https://api.iamport.kr/payments/" + impUid;

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", accessToken);

        // GET 요청 (safeHttpClient 사용)
        Map<String, Object> paymentResponse =
                safeHttpClient.get(url, headers, Map.class);

        if (paymentResponse == null) {
            throw new RuntimeException("결제 조회 실패");
        }

        // PortOne 응답 내부의 response 객체 가져오기
        Map<String, Object> response =
                (Map<String, Object>) paymentResponse.get("response");

        String status = (String) response.get("status");
        Integer amount = (Integer) response.get("amount");
        String merchantUid = (String) response.get("merchant_uid");

        // DB 검증, merchant_uid, amount 체크
//        OrderMain order = orderRepo.findByMerchantUid(merchantUid)
//                .orElseThrow(() -> new RuntimeException("주문 없음"));

//        if(order.getTotalAmount().compareTo(BigDecimal.valueOf(amount)) != 0) throw new Exception("금액 불일치");
        //if (!merchantUid.equals(order.getMerchantUid())) throw new Exception("주문번호 불일치");
        if (!"paid".equals(status)) throw new Exception("결제 미완료");

        Log.d("결과 확인", status + " " + amount + " " + merchantUid);
        if (!Objects.equals(amount, 1020)) {
            return new VerificationResult(false, impUid, merchantUid, amount, status, "금액 불일치!");
        }

        return new VerificationResult(true, impUid, merchantUid, amount, status, "결제 정상");
    }
}
