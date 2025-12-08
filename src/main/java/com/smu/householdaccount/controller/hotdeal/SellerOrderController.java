package com.smu.householdaccount.controller.hotdeal;

import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.entity.hotdeal.Seller;
import com.smu.householdaccount.service.hotdeal.SellerService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/seller/order")
@AllArgsConstructor(onConstructor_ = @Autowired)
public class SellerOrderController {
    private final SellerService sellerService;

    @GetMapping
    public String List(
            Model model,
            @PageableDefault(page = 0, size = 10, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable,
            @SessionAttribute("loginUser") Member loginUser
            ){
        Seller seller = loginUser.getSeller();
        Page<OrderMain> orderMainPage = sellerService.getOrderMainBySeller(seller.getId(), pageable);
        model.addAttribute("orderMainPage", orderMainPage);
        model.addAttribute("orderMains", orderMainPage.getContent());
        return "seller/orders";
    }
}
