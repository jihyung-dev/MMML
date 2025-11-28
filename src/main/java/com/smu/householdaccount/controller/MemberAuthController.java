package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class MemberAuthController {

    private final MemberService memberService;

    /**
     * 회원가입 페이지
     * GET /join/member
     */
    @GetMapping("/join/member")
    public String joinForm(Model model) {
        model.addAttribute("member", new Member());
        return "auth/join-member";
    }

    /**
     * 회원가입 처리
     * POST /join/member
     */
    @PostMapping("/join/member")
    public String join(
            @ModelAttribute Member member,
            Model model
    ) {
        // 아이디 중복 체크
        if (memberService.existsByMemberId(member.getMemberId())) {
            model.addAttribute("member", member);
            model.addAttribute("error", "이미 사용 중인 아이디입니다.");
            return "auth/join-member";
        }

        // 닉네임 중복 체크
        if (memberService.existsByNickname(member.getMemberNickname())) {
            model.addAttribute("member", member);
            model.addAttribute("error", "이미 사용 중인 닉네임입니다.");
            return "auth/join-member";
        }

        // 휴대폰 중복 체크
        if (member.getPhone() != null && !member.getPhone().isBlank()
                && memberService.existsByPhone(member.getPhone())) {
            model.addAttribute("member", member);
            model.addAttribute("error", "이미 사용 중인 휴대폰 번호입니다.");
            return "auth/join-member";
        }

        // 기본 ROLE 은 서비스에서 USER 로 세팅
        memberService.registerUser(member);

        // 가입 완료 후 로그인 페이지로 이동 (원하면 "/" 그대로 둬도 됨)
        return "redirect:/login";
    }
}
