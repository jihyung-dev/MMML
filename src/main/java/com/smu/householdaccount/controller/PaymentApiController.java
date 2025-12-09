package com.smu.householdaccount.controller;

import com.smu.householdaccount.service.hotdeal.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.Map;


@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
public class PaymentApiController {

    private final OrderService orderService;


    public ResponseEntity<Map<String, Object>> verifyPayment(@RequestBody Map<String, Object> body) {
        String impUid = (String) body.get("imp_uid");
        String merchantUid = (String) body.get("merchant_uid");

        BigDecimal amount ;
        try{
            Object amountObj = body.get("amount");
            if (amountObj instanceof Number){
                amount = new BigDecimal(((Number) amountObj).longValue());
            } else {
                amount = new BigDecimal(String.valueOf(amountObj));
            }
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("ok", false, "msg", "Invalid amount format."));
        }
        try {
            // 💡 [핵심] OrderService의 confirmPayment 호출
            // 이 메서드 내부에서 PG사 결제 기록 확인(생략 가정), DB 주문 금액 대조, 재고 차감 및 주문 상태(PAID) 변경이 일어납니다.
            boolean verified = orderService.confirmPayment(
                    merchantUid,
                    impUid,
                    // PG_TID는 현재 JS 코드에서 보내지 않으므로 null로 처리하거나, JS에서 추가해야 함.
                    (String) body.get("pg_tid"),
                    amount.longValue() // confirmPayment는 long 타입의 금액을 받습니다.
            );

            if (verified) {
                // 성공 응답 (HTTP 200)
                return ResponseEntity.ok(Map.of("ok", true, "message", "결제 검증 및 재고 차감 완료"));
            } else {
                // 검증 실패 응답 (HTTP 400 BAD_REQUEST)
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("ok", false, "msg", "결제 검증에 실패했습니다. (금액 불일치 등)"));
            }

        } catch (IllegalStateException e) {
            // 재고 부족 등의 비즈니스 로직 오류 (confirmPayment 내부에서 던져진 예외)
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("ok", false, "msg", e.getMessage()));
        } catch (Exception e) {
            // 기타 서버 오류
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("ok", false, "msg", "서버 처리 중 오류가 발생했습니다."));
        }
    }
}
