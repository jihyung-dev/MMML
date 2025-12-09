package com.smu.householdaccount.controller.hotdeal;

import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.service.hotdeal.PaymentService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RestController
@RequestMapping("/api/payment")
public class PaymentController {

    private final PaymentService paymentService;

    /**
     * 💰 [핵심] 결제창에서 '취소' 버튼을 눌렀을 때, 클라이언트가 리다이렉트되는 엔드포인트입니다.
     * 이니시스가 실패(취소) 정보를 쿼리 파라미터로 담아 클라이언트를 이 URL로 보냅니다.
     * * @param merchantUid 주문 고유 번호
     * @return 클라이언트에게 전달할 응답 (예: 실패 페이지로 리다이렉트 지시)
     */
    @GetMapping("/failure/callback")
    public ResponseEntity<String> paymentFailureCallback(@RequestParam("merchant_uid") String merchantUid) {

        try {
            // 1. 주문 ID 조회 (OrderMainRepository에서 merchantUid로 OrderMain 찾기)
            OrderMain order = paymentService.findOrderByMerchantUid(merchantUid);

            if (order == null) {
                // 이미 취소되었거나 잘못된 주문 ID인 경우
                return ResponseEntity.ok("Order not found or already processed.");
            }

            // 2. 서비스 레이어의 취소 로직 호출
            // 클라이언트 취소는 '사용자 취소'로 명시적으로 상태 변경
            // order.getId()를 사용하여 엔티티의 PK를 전달합니다.
            paymentService.cancelOrderAfterFailure(order.getId(), "User canceled payment on PG window");

            // 3. 클라이언트에게 결제 취소 결과를 알리는 응답을 반환
            // (프론트엔드 URL로 리다이렉트하여 "결제 취소되었습니다" 화면을 보여줄 수 있습니다.)
            return ResponseEntity.status(HttpStatus.SEE_OTHER)
                    .header("Location", "/payment/canceled?orderId=" + order.getId())
                    .body("Payment Canceled.");

        } catch (EntityNotFoundException e) {
            return ResponseEntity.badRequest().body("Invalid merchant UID.");
        }

    }
}

/*public PaymentController(PaymentService paymentService) {
        this.paymentService = paymentService;
    }*/

    /*
     * 프론트에서 imp_uid, merchant_uid, amount, orderId(optional) 를 보냄
     * DTO 없이 Map으로 받음(팀플 스타일).
    @PostMapping("/verify")
    public ResponseEntity<Map<String, Object>> verifyPayment(@RequestBody Map<String, Object> body) {
        String impUid = (String) body.get("imp_uid");
        String merchantUid = (String) body.get("merchant_uid");
        BigDecimal amount = new BigDecimal(String.valueOf(body.get("amount")));
        Long orderId = null;
        if (body.get("orderId") != null) {
            orderId = Long.valueOf(String.valueOf(body.get("orderId")));
        }

        boolean ok = paymentService.verifyAndRecord(merchantUid, impUid, amount, orderId);
        if (ok) {
            return ResponseEntity.ok(Map.of("ok", true));
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("ok", false, "msg", "verification failed"));
        }
    }

     */