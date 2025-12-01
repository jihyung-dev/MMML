package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.entity.Seller;
import com.smu.householdaccount.service.MemberService;
import com.smu.householdaccount.service.SellerService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/seller")
public class SellerController {

    private final MemberService memberService;
    private final SellerService sellerService;

    @GetMapping
    public String sellerHome(
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
        return "redirect:/hotdeal";
    }

    @GetMapping("/find-biz")
    public String findBizForm() {
        return "auth/seller-find-biz";
    }

    @PostMapping("/find-biz")
    public String findBiz(@RequestParam String memberId,
                          @RequestParam String memberName,
                          @RequestParam String phone,
                          Model model) {

        String bizNo = sellerService.findBizNo(memberId, memberName, phone);

        if (bizNo == null) {
            model.addAttribute("error", "일치하는 판매자 정보가 없습니다.");
        } else {
            model.addAttribute("bizNo", bizNo);
        }

        return "auth/seller-find-biz";
    }

    // 🔹 판매자 회원가입 폼
    @GetMapping("/join")
    public String sellerJoinForm(Model model) {
        model.addAttribute("member", new Member());
        model.addAttribute("seller", new Seller());
        return "auth/join-seller";
    }

    // 🔹 판매자 회원가입 처리
    @PostMapping("/join")
    public String sellerJoin(@ModelAttribute("member") Member member,
                             @ModelAttribute("seller") Seller seller,
                             Model model) {

        // 아이디 중복 체크
        if (memberService.existsByMemberId(member.getMemberId())) {
            model.addAttribute("error", "이미 사용 중인 아이디입니다.");
            model.addAttribute("member", member);
            model.addAttribute("seller", seller);
            return "auth/join-seller";
        }

        if (member.getPhone() != null && !member.getPhone().isBlank()
                && memberService.existsByPhone(member.getPhone())) {
            model.addAttribute("error", "이미 가입된 휴대폰 번호입니다.");
            model.addAttribute("member", member);
            model.addAttribute("seller", seller);
            return "auth/join-seller";
        }

        if (sellerService.existsByBizNo(seller.getBizNo())) {
            model.addAttribute("error", "이미 등록된 사업자번호입니다.");
            model.addAttribute("member", member);
            model.addAttribute("seller", seller);
            return "auth/join-seller";
        }

        member.setRole("SELLER");
        Member savedMember = memberService.registerUser(member);

        seller.setMember(savedMember);
        sellerService.registerSeller(seller);

        return "redirect:/seller/login";





    }
}




