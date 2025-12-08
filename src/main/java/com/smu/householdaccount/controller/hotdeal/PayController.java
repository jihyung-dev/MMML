package com.smu.householdaccount.controller.hotdeal;

import com.smu.householdaccount.dto.payment.VerificationResult;
import com.smu.householdaccount.service.hotdeal.OrderMainService;
import com.smu.householdaccount.service.hotdeal.PortOneVerifyService;
import com.smu.householdaccount.util.Log;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller()
@RequestMapping("/payment")
public class PayController {
    private final PortOneVerifyService verifyService;
    private final OrderMainService orderService;

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
            VerificationResult result = verifyService.verificationResult(impUid);
            orderService.cancelOrdered(result.getMerchantUid());
            return ResponseEntity.ok("");
        }catch (Exception e){
            Log.e("Payment", e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
