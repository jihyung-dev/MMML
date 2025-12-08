package com.smu.householdaccount.controller;

import com.smu.householdaccount.service.PaymentService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.Map;

/*@RestController
@RequestMapping("/payment")
public class PaymentController {

    private final PaymentService paymentService;

    public PaymentController(PaymentService paymentService) {
        this.paymentService = paymentService;
    }*/

    /**
     * 프론트에서 imp_uid, merchant_uid, amount, orderId(optional) 를 보냄
     * DTO 없이 Map으로 받음(팀플 스타일).
     */
/*    @PostMapping("/verify")
    public ResponseEntity<Map<String, Object>> verifyPayment(@RequestBody Map<String, Object> body) {
        String impUid = (String) body.get("imp_uid");
        String merchantUid = (String) body.get("merchant_uid");
        BigDecimal amount = new BigDecimal(String.valueOf(body.get("amount")));
        Long orderId = null;
        if (body.get("orderId") != null) {
            orderId = Long.valueOf(String.valueOf(body.get("orderId")));
        }

//        boolean ok = paymentService.verifyAndRecord(merchantUid, impUid, amount, orderId);
//        if (ok) {
//            return ResponseEntity.ok(Map.of("ok", true));
//        } else {
//            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("ok", false, "msg", "verification failed"));
//        }
//    }
}*/
