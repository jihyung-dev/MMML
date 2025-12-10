package com.smu.householdaccount.controller.hotdeal;

import com.smu.householdaccount.dto.HotdealOrderBean;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.repository.hotdeal.OrderMainRepository;
import com.smu.householdaccount.service.hotdeal.OrderService;
import jakarta.servlet.http.HttpSession;
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
    public String order(//@RequestParam Long itemId,
                        //@RequestParam(name = "optionId", required = false) List<String> optionIdsRaw,
                        //@RequestParam(name = "qty", required = false) List<Integer> qtys,
                        //└─ HotdealOrderBean이 처리함. 중복제거

                        @ModelAttribute HotdealOrderBean hotdealOrderBean,
                        Model model,
                        @SessionAttribute(name = "loginUser", required = false) Member loginUser) {

        System.out.println(hotdealOrderBean);
        // 1) 로그인 체크
        if (loginUser == null) {
            return "redirect:/login";
        }
        //String buyerId = loginUser.getMemberId();
        hotdealOrderBean.setBuyerId(loginUser.getMemberId());

        // 2) 옵션/수량 검사
        if (hotdealOrderBean.getOptionId().isEmpty() || hotdealOrderBean.getQuantity().isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "주문 상품 목록이 비어있습니다. 옵션을 선택해주세요.");
        }

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

    @GetMapping("/payment")
    public String paymentPage(@RequestParam("merchantUid") String merchantUid, Model model, HttpSession session) {
        OrderMain order = orderService.getOrderWithItems(merchantUid);
        model.addAttribute("order", order);
        // 기존에 넣던 다른 속성들도 그대로 유지
        return "hotdeal/payment_page";
    }

}

