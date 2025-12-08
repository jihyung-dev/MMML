package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.entity.OrderMain;
import com.smu.householdaccount.service.OrderMainService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/mypage/orders")
public class MyOrderController {

    private final OrderMainService orderMainService;

    // 🔥 생성자에 서비스 넣기
    public MyOrderController(OrderMainService orderMainService) {
        this.orderMainService = orderMainService;
    }

    // URL: /mypage/orders
    @GetMapping
    public String myOrderList(HttpSession session, Model model) {

        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }

        List<OrderMain> orders = orderMainService.findByBuyerId(loginUser.getMemberId());
        model.addAttribute("orders", orders);

        return "user/orders";
    }
    @GetMapping("/detail/{orderId}")
    public String orderDetail(@PathVariable Long orderId, Model model, HttpSession session) {

        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }

        OrderMain order = orderMainService.findById(orderId);

        // 로그인한 사용자의 주문인지 체크
        if (!order.getBuyerId().equals(loginUser.getMemberId())) {
            return "redirect:/mypage/orders";
        }

        model.addAttribute("order", order);
        model.addAttribute("items", order.getOrderItems());

        return "user/order_detail";
    }
}