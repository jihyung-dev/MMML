package com.smu.householdaccount.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smu.householdaccount.dto.payment.CreateOrderReq;
import com.smu.householdaccount.entity.OrderItem;
import com.smu.householdaccount.entity.OrderMain;
import com.smu.householdaccount.repository.HotdealOptionRepository;
import com.smu.householdaccount.repository.OrderItemRepository;
import com.smu.householdaccount.repository.OrderMainRepository;
import com.smu.householdaccount.web.SafeHttpClient;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@Service
public class OrderMainService{
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

    private final OrderMainRepository orderMainRepository;

    public OrderMainService(OrderMainRepository orderMainRepository) {
        this.orderMainRepository = orderMainRepository;
    }

    /**
     * 주문 내역 추가, 결제 이전에 테이블에 추가.
     * @param req
     * @return
     */
    public OrderMain createOrder(CreateOrderReq req){
        String merchantUid = "order-" + UUID.randomUUID();

        OrderMain order = new OrderMain();
        order.setMerchantUid(merchantUid);
        order.setTotalAmount(100000L);
        order.setOrderStatus("READY");
        //order.setBuyer(req.getBuyerId());
        return orderMainRepository.save(order);
    }

    /**
     * 주문 상태 변경(CANCELLED)
     * @param merchantUid
     */
    public void cancelOrder(String merchantUid){
        OrderMain orderMain = orderMainRepository.findByMerchantUid(merchantUid).orElseThrow(
                () -> new RuntimeException("주문 없음")
        );
        orderMain.setOrderStatus("CANCELLED");
        orderMainRepository.save(orderMain);
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

    public void cancelOrdered(String merchantUid){
        String token = getAccessToken();

        // 취소 요청 body
        Map<String, Object> body = new HashMap<>();
        body.put("merchant_uid", merchantUid);
        body.put("reason", "사용자 요청 취소"); // 나중에 취소 사유 넣어도 무방
        String jsonBody = "";
        try {
            jsonBody = objectMapper.writeValueAsString(body);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("JSON 변환 실패", e);
        }

        // 헤더 구성
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", token);
        headers.setContentType(MediaType.APPLICATION_JSON);

        // 취소 요청
        String url = host + "/payments/cancel";

        Map response = safeHttpClient.post(url, headers, jsonBody, Map.class);

        if(response == null){
            throw new RuntimeException("결제 취소 실패 : 응답 없음");
        }
    }
    public List<OrderMain> findByBuyerId(String buyerId) {
        return orderMainRepository.findByBuyerId(buyerId);
    }

    public OrderMain findById(Long orderId) {
        return orderMainRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("주문을 찾을 수 없습니다."));
    }
}
