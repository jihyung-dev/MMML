package com.smu.householdaccount.controller.hotdeal;

import com.smu.householdaccount.dto.payment.VerificationResult;
import com.smu.householdaccount.dto.payment.VerifyPaymentBean;
import com.smu.householdaccount.service.hotdeal.OrderMainService;
import com.smu.householdaccount.service.hotdeal.PaymentService;
import com.smu.householdaccount.service.hotdeal.PortOneVerifyService;
import com.smu.householdaccount.util.Log;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Map;

@Controller()
@RequestMapping("/payment")
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class PayController {
    private final PortOneVerifyService verifyService;
    private final OrderMainService orderService;
    private final PaymentService paymentService;

    public PayController(PortOneVerifyService verifyService, OrderMainService orderService) {
        this.verifyService = verifyService;
        this.orderService = orderService;
    }

    @GetMapping("/")
    public String testpay(){
        return "/payment/test_pay";
    }

    /**
     * 결제 확인 API
     * @param impUid
     * @return
     */
    @GetMapping("/verify")
    public ResponseEntity<?> verifyPayment(@RequestParam("imp_uid") String impUid){
        try{
            System.out.println(impUid);
            VerificationResult result = verifyService.verificationResult(impUid);
            orderService.cancelOrdered(result.getMerchantUid());
            return ResponseEntity.ok("");
        }catch (Exception e){
            Log.e("Payment", e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
    /*
     * 프론트에서 imp_uid, merchant_uid, amount, orderId(optional) 를 보냄
     * DTO 없이 Map으로 받음(팀플 스타일).
     */

    @PostMapping("/verify")
    public ResponseEntity<Map<String, Object>> verifyPayment(@RequestBody VerifyPaymentBean body) {

        boolean ok = paymentService.verifyAndRecord(body);
        if (ok) {
            return ResponseEntity.ok(Map.of("ok", true));
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("ok", false, "msg", "verification failed"));
        }
    }
}
