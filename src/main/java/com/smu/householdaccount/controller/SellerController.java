package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.entity.Seller;
import com.smu.householdaccount.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/seller")   // 🔥 여기 1줄만 바꿈
public class SellerController {

    private final MemberService memberService;
    @GetMapping
    public String sellerHome(
            //@SessionAttribute("sellerBizNo") String bizNo,
            @SessionAttribute(value = "sellerUser",required = false) Seller seller,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        if(seller == null){
            redirectAttributes.addFlashAttribute("error","판매자로 로그인 해야합니다.");
            return "redirect:/seller/login";
        }
        model.addAttribute("seller", seller);
        return "seller/home";
    }


    @GetMapping("/login")
    public String sellerLoginForm() {
        return "auth/seller-login";
    }

    @PostMapping("/login")
    public String sellerLogin(
            @RequestParam String memberId,
            @RequestParam String password,
            @RequestParam String bizNo,
            HttpSession session,
            Model model) {

        try {
            Seller seller = memberService.sellerLogin(memberId, password, bizNo);
            session.removeAttribute("loginUser");
            session.setAttribute("sellerUser", seller);
            session.setAttribute("sellerBizNo", seller.getBizNo());
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "auth/seller-login";
        }
        return "redirect:/seller";
    }
    @GetMapping("/seller/order")
    public String order(){
        return "seller/orders";
    }

}
