package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.service.MemberService;
import com.smu.householdaccount.service.SellerService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final MemberService memberService;
    private final SellerService sellerService;

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
        session.setAttribute("loginUser", loginUser);
        session.setAttribute("loginUserId", loginUser.getMemberId());

        // ⭐ 여기 추가: 이 회원이 판매자인지 여부 세션에 저장
        boolean isSeller = sellerService.getSellerByMemberId(loginUser.getMemberId()) != null;
        session.setAttribute("isSeller", isSeller);

        // 역할에 따라 이동 경로 분기
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
        session.invalidate();
        return "redirect:/";
    }

    // =============================
    //  🔹 아이디 찾기 (이름 + 이메일)
    // =============================

    @GetMapping("/find-id")
    public String findIdForm() {
        return "auth/find-id";
    }

    @PostMapping("/find-id")
    public String findId(@RequestParam String memberName,
                         @RequestParam String email,
                         Model model) {

        String memberId = memberService.findMemberId(memberName, email);

        if (memberId == null) {
            model.addAttribute("error", "일치하는 회원 정보가 없습니다.");
        } else {
            model.addAttribute("memberId", memberId);
        }

        return "auth/find-id";
    }

    // =============================
    //  🔹 비밀번호 찾기 + 재설정
    // =============================

    @GetMapping("/find-pw")
    public String findPwForm() {
        return "auth/find-pw";
    }

    // 1단계: 본인 확인 (ID + 이름 + 이메일)
    @PostMapping("/find-pw")
    public String verifyForPwReset(@RequestParam String memberId,
                                   @RequestParam String memberName,
                                   @RequestParam String email,
                                   Model model) {

        boolean valid = memberService.verifyMemberForPasswordReset(memberId, memberName, email);

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

        return "redirect:/login";
    }
}
