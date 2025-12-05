package com.smu.householdaccount.controller;

import com.smu.householdaccount.dto.payment.CreateOrderReq;
import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.entity.OrderMain;
import com.smu.householdaccount.service.OrderMainService;
import com.smu.householdaccount.util.Log;
import jakarta.servlet.http.HttpSession;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderMainController {
    private final OrderMainService orderMainService;

    public OrderMainController(OrderMainService orderMainService) {
        this.orderMainService = orderMainService;
    }

    /**
     * 결제 시작 전에 결제 창이 열리기전에 동작.
     * @param req
     * @return
     */
    @PostMapping("/create")
    public ResponseEntity<?> createOrder(@RequestBody CreateOrderReq req){
        OrderMain order = orderMainService.createOrder(req);
        return ResponseEntity.ok(order);
    }

    /**
     * 결제 완료 전에 결제 창 닫아서 취소 된 경우
     * @param merchantUid
     * @return
     */
    @PostMapping("/cancel")
    public ResponseEntity<?> cancelOrder(String merchantUid){
        orderMainService.cancelOrder(merchantUid);
        return ResponseEntity.ok("cancelled");
    }

    @PostMapping("/cancel/payment")
    public ResponseEntity<?> cancelPayment(@RequestParam("merchant_uid") String merchantUid){
        try{
            orderMainService.cancelOrdered(merchantUid);
            Log.d("[결과 확인]", "정상적으로 취소 되었습니다.");
            return ResponseEntity.ok("cancelled");
        }catch (Exception e){
            Log.e("Cancel", e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
