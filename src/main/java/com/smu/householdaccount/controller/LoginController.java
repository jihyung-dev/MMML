package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final MemberService memberService;

    /**
     * 로그인 페이지
     */
    @GetMapping("/login")
    public String loginForm(Model model) {
        return "auth/login";  // templates/auth/login.html
    }

    /**
     * 로그인 처리
     */
    @PostMapping("/login")
    public String login(@RequestParam String memberId,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        Member loginMember = memberService.login(memberId, password);

        if (loginMember == null) {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "auth/login";
        }

        // 세션 저장
        session.setAttribute("loginMember", loginMember);

        return "redirect:/";  // 홈으로 이동
    }

    /**
     * 로그아웃
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 삭제
        return "redirect:/login";
    }
}
