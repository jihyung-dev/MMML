package com.smu.householdaccount.controller;

import com.smu.householdaccount.dto.HotdealOrderBean;
import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.entity.OrderMain;
import com.smu.householdaccount.repository.OrderMainRepository;
import com.smu.householdaccount.service.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RequestMapping("/hotdeal")
public class OrderController {

    private final OrderService orderService;
    private final OrderMainRepository orderMainRepository;

    @PostMapping("/order/create")
    public String order(@RequestParam Long itemId,
                        @RequestParam(name = "optionId", required = false) List<String> optionIdsRaw,
                        @RequestParam(name = "qty", required = false) List<Integer> qtys,
                        @ModelAttribute HotdealOrderBean hotdealOrderBean,
                        Model model,
                        @SessionAttribute(name = "loginUser", required = false) Member loginUser) {

        System.out.println(hotdealOrderBean);
        // 1) 로그인 체크
        if (loginUser == null) {
            return "redirect:/login";
        }
        String buyerId = loginUser.getMemberId();

        // 2) 옵션/수량 검사
        if (hotdealOrderBean.getOptionId() == null && hotdealOrderBean.getQuantity() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "선택된 옵션이 없습니다.");
        }

        hotdealOrderBean.setBuyerId(loginUser.getMemberId());
        // 4) 실제 주문 생성
        OrderMain order = orderService.createHotdealOrder(hotdealOrderBean);

        OrderMain orderWithItems = orderMainRepository.findWithItemsById(order.getId())
                .orElse(order);

        // 5) 모델에 값 넣고 결제 페이지로 이동
        model.addAttribute("order", order);
        model.addAttribute("orderId", order.getId());
        model.addAttribute("merchantUid", order.getMerchantUid());
        model.addAttribute("amount", order.getTotalAmount());

        return "hotdeal/payment_page";
    }

    @GetMapping("/order/cancel_pending")
    @ResponseBody //JSON 응답 받으려고
    public ResponseEntity<Map<String, Object>> cancelPendingOrder(@RequestParam("merchant_uid") String merchantUid) {
        try {
            // OrderService를 호출하여 주문 상태를 PENDING -> CANCELED로 변경하고 재고 복구
            orderService.cancelPendingOrder(merchantUid);
            return ResponseEntity.ok(Map.of("ok", true, "msg", "주문 취소 및 재고 복구 완료"));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("ok", false, "msg", "서버 오류: " + e.getMessage()));
        }
    }


}

