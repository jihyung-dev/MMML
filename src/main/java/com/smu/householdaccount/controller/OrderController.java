package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.entity.OrderMain;
import com.smu.householdaccount.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hotdeal")
public class OrderController {

    private final OrderService orderService;

    @PostMapping("/order/create")
    public String order(@RequestParam Long itemId,
                        @RequestParam(name = "optionId", required = false) List<String> optionIdsRaw,
                        @RequestParam(name = "qty", required = false) List<Integer> qtys,
                        Model model,
                        @SessionAttribute(name = "loginUser", required = false) Member loginUser) {

        // 1) 로그인 체크
        if (loginUser == null) {
            return "redirect:/login";
        }
        String buyerId = loginUser.getMemberId();

        // 2) 옵션/수량 검사
        if (optionIdsRaw == null || optionIdsRaw.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "선택된 옵션이 없습니다.");
        }

        // qtys 가 전달되지 않았다면 기본 수량 1
        int firstQty = 1;
        if (qtys != null && !qtys.isEmpty()) {
            firstQty = qtys.get(0);
            if (firstQty < 1) firstQty = 1;
        }

        // 3) optionId 처리 — 프론트에서 "11,22" 같은 콤마 묶음을 보낼 수 있음.
        String rawFirst = optionIdsRaw.get(0);
        Long firstOptionId;
        try {
            if (rawFirst == null || rawFirst.isBlank()) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "optionId가 비어있음");
            }
            if (rawFirst.contains(",")) {
                String[] parts = rawFirst.split(",");
                String candidate = parts[parts.length - 1].trim(); // 정책: 마지막 값 사용
                firstOptionId = Long.parseLong(candidate);
            } else {
                firstOptionId = Long.parseLong(rawFirst.trim());
            }
        } catch (NumberFormatException ex) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                    "optionId 형식 오류. 숫자형 optionId(또는 개별 optionId 리스트)를 전송하세요.");
        }

        // 4) 실제 주문 생성
        OrderMain order = orderService.createHotdealOrder(buyerId, itemId, firstOptionId, firstQty);

        // 5) 모델에 값 넣고 결제 페이지로 이동
        model.addAttribute("order", order);
        model.addAttribute("orderId", order.getId());
        model.addAttribute("merchantUid", order.getMerchantUid());
        model.addAttribute("amount", order.getTotalAmount());

        return "hotdeal/payment_page";
    }
}

