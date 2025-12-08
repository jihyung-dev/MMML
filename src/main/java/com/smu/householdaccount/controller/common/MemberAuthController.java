package com.smu.householdaccount.controller.common;

import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.service.common.MemberService;
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
        // 리다이렉트 수정 필요
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

        // ✅ 이메일 중복 체크 (아이디/비번 찾기에서 이메일을 쓰기 때문에)
        if (member.getEmail() != null && !member.getEmail().isBlank()
                && memberService.existsByEmail(member.getEmail())) {
            model.addAttribute("member", member);
            model.addAttribute("error", "이미 사용 중인 이메일입니다.");
            return "auth/join-member";
        }

        // 기본 ROLE 은 서비스에서 GENERAL 로 세팅
        memberService.registerUser(member);

        return "redirect:/login";
    }
}
