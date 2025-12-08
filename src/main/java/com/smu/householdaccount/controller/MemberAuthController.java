package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class MemberAuthController {

    private final MemberService memberService;


//  1. 아이디, 2. 닉네임 실시간 중복 검사 후 메시지
    @GetMapping("/api/members/check-id")
    @ResponseBody
    public java.util.Map<String, Boolean> checkMemberId(@RequestParam String memberId) {
        boolean duplicate = memberService.existsByMemberId(memberId);
        return java.util.Map.of("duplicate", duplicate);
    }

    @GetMapping("/api/members/check-nickname")
    @ResponseBody
    public java.util.Map<String, Boolean> checkNickname(@RequestParam String nickname) {
        boolean duplicate = memberService.existsByNickname(nickname);
        return java.util.Map.of("duplicate", duplicate);
    }




    /**
     * 회원가입 페이지
     * GET /join/member
     */
    @GetMapping("/join/member")
    public String joinForm(@ModelAttribute("member") Member member, Model model) {

        // redirect 이후 FlashAttribute 로 넘어온 member가 없으면 새로 생성
        if (!model.containsAttribute("member")) {
            model.addAttribute("member", new Member());
        }

        return "auth/join-member";
    }

    /**
     * 회원가입 처리
     * POST /join/member
     */
    @PostMapping("/join/member")
    public String join(
            @ModelAttribute("member") Member member,
            RedirectAttributes redirectAttributes
    ) {
        // 🔹 휴대폰 형식(11자리 숫자) 검증
        String phone = member.getPhone();
        if (phone == null || !phone.matches("\\d{11}")) {
            redirectAttributes.addFlashAttribute("member", member);
            redirectAttributes.addFlashAttribute("error", "휴대전화 11자리를 정확히 입력해주세요");
            return "redirect:/join/member";
        }


        // 아이디 중복 체크
        if (memberService.existsByMemberId(member.getMemberId())) {
            redirectAttributes.addFlashAttribute("member", member);
            redirectAttributes.addFlashAttribute("error", "이미 사용 중인 아이디입니다.");
            return "redirect:/join/member";
        }

        // 닉네임 중복 체크
        if (memberService.existsByNickname(member.getMemberNickname())) {
            redirectAttributes.addFlashAttribute("member", member);
            redirectAttributes.addFlashAttribute("error", "이미 사용 중인 닉네임입니다.");
            return "redirect:/join/member";
        }

        // 휴대폰 중복 체크
        if (member.getPhone() != null && !member.getPhone().isBlank()
                && memberService.existsByPhone(member.getPhone())) {
            redirectAttributes.addFlashAttribute("member", member);
            redirectAttributes.addFlashAttribute("error", "이미 사용 중인 휴대폰 번호입니다.");
            return "redirect:/join/member";
        }

        // 이메일 중복 체크
        if (member.getEmail() != null && !member.getEmail().isBlank()
                && memberService.existsByEmail(member.getEmail())) {
            redirectAttributes.addFlashAttribute("member", member);
            redirectAttributes.addFlashAttribute("error", "이미 사용 중인 이메일입니다.");
            return "redirect:/join/member";
        }

        // 기본 ROLE 은 서비스에서 GENERAL 로 세팅
        memberService.registerUser(member);

        return "redirect:/login";
    }
}
