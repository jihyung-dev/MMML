package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final MemberService memberService;

    /**
     * 로그인 페이지
     */
    @GetMapping("/login")
    public String loginForm() {
        return "auth/login";
    }

    /**
     * 로그인 처리
     */
    @PostMapping("/login")
    public String login(
            @RequestParam String memberId,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        Member loginUser = memberService.login(memberId, password);

        if (loginUser == null) {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "auth/login";
        }

        // 🔥 로그인 성공 시 세션 저장
        session.setAttribute("loginUser", loginUser);                 // Member 객체
        session.setAttribute("loginUserId", loginUser.getMemberId()); // BoardPostController용

        // 🔥 역할에 따라 이동 경로 분기
        if ("ADMIN".equalsIgnoreCase(loginUser.getRole())) {
            return "redirect:/admin";
        }

        return "redirect:/";
    }

    /**
     * 로그아웃
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();   // 세션 전체 삭제
        return "redirect:/";
    }

    // =============================
    //  🔹 일반 회원가입
    // =============================

    @GetMapping("/join/member")
    public String joinMemberForm(Model model) {
        model.addAttribute("member", new Member());
        return "auth/join-member";
    }

    @PostMapping("/join/member")
    public String joinMember(@ModelAttribute Member member, Model model) {

        // 아이디 중복 체크
        if (memberService.existsByMemberId(member.getMemberId())) {
            model.addAttribute("member", member);
            model.addAttribute("error", "이미 사용 중인 아이디입니다.");
            return "auth/join-member";
        }

        // 닉네임 중복 체크 (필드명이 memberNickname이라고 가정)
        if (member.getMemberNickname() != null &&
                memberService.existsByNickname(member.getMemberNickname())) {
            model.addAttribute("member", member);
            model.addAttribute("error", "이미 사용 중인 닉네임입니다.");
            return "auth/join-member";
        }

        // 전화번호 중복 체크
        if (member.getPhone() != null &&
                memberService.existsByPhone(member.getPhone())) {
            model.addAttribute("member", member);
            model.addAttribute("error", "이미 가입된 전화번호입니다.");
            return "auth/join-member";
        }

        // 기본 권한은 MemberService에서 USER로 넣어주고 있음
        memberService.registerUser(member);

        // 가입 후 로그인 페이지로 이동
        return "redirect:/login";
    }

    // =============================
    //  🔹 아이디 찾기
    // =============================

    @GetMapping("/find-id")
    public String findIdForm() {
        return "auth/find-id";
    }

    @PostMapping("/find-id")
    public String findId(@RequestParam String memberName,
                         @RequestParam String phone,
                         Model model) {

        String memberId = memberService.findMemberId(memberName, phone);

        if (memberId == null) {
            model.addAttribute("error", "일치하는 회원 정보가 없습니다.");
        } else {
            model.addAttribute("memberId", memberId);
        }

        // 같은 화면에서 결과 보여주기
        return "auth/find-id";
    }

    // =============================
    //  🔹 비밀번호 찾기 + 재설정
    // =============================

    @GetMapping("/find-pw")
    public String findPwForm() {
        return "auth/find-pw";
    }

    // 1단계: 본인 확인
    @PostMapping("/find-pw")
    public String verifyForPwReset(@RequestParam String memberId,
                                   @RequestParam String memberName,
                                   @RequestParam String phone,
                                   Model model) {

        boolean valid = memberService.verifyMemberForPasswordReset(memberId, memberName, phone);

        if (!valid) {
            model.addAttribute("error", "입력하신 정보와 일치하는 회원이 없습니다.");
            return "auth/find-pw";
        }

        // 본인 확인이 끝났으면, 비밀번호 재설정 페이지로 이동
        model.addAttribute("memberId", memberId);
        return "auth/reset-pw";
    }

    // 2단계: 새 비밀번호 설정
    @PostMapping("/reset-pw")
    public String resetPw(@RequestParam String memberId,
                          @RequestParam String newPassword,
                          @RequestParam String confirmPassword,
                          Model model) {

        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("memberId", memberId);
            model.addAttribute("error", "새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
            return "auth/reset-pw";
        }

        memberService.resetPassword(memberId, newPassword);

        // 비밀번호 변경 후 로그인 페이지로 이동
        return "redirect:/login";
    }
}
