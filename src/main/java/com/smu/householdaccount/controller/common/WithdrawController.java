package com.smu.householdaccount.controller.common;

import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.service.common.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class WithdrawController {   // ⭐ [신규 파일]

    private final MemberService memberService;

    /**
     * 🔹 회원탈퇴 확인/비밀번호 입력 폼
     * GET /member/withdraw
     */
    @GetMapping("/member/withdraw")
    public String withdrawForm(
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        // ⭐ [유지] 로그인 안 한 상태면 로그인 페이지로
        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("error", "로그인 후 이용 가능합니다.");
            return "redirect:/login";
        }

        // ⭐ [유지] 화면에서 아이디 등 쓰고 싶을 때 사용
        model.addAttribute("loginUser", loginUser);

        return "auth/withdraw";   // 🔸 templates/auth/withdraw.html
    }

    /**
     * 🔹 회원탈퇴 처리
     * POST /member/withdraw
     */
    @PostMapping("/member/withdraw")
    public String withdraw(
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            @RequestParam String password,        // ⭐ [유지] 폼에서 넘겨줄 비밀번호
            HttpSession session,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        // ⭐ [유지] 로그인 체크
        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("error", "로그인 후 이용 가능합니다.");
            return "redirect:/login";
        }

        String memberId = loginUser.getMemberId();   // ⭐ [추가] 가독성을 위해 분리

        // ✅ [새로 추가] 비밀번호 검증 (로그인 로직 재사용)
        Member verified = memberService.login(memberId, password);
        if (verified == null) {
            model.addAttribute("loginUser", loginUser);             // 아이디 다시 보여주기
            model.addAttribute("error", "비밀번호가 올바르지 않습니다.");  // 에러 메시지
            return "auth/withdraw";                                // 다시 탈퇴 화면
        }

        try {
            // ⭐ [유지] 회원탈퇴 (ENABLED = 'N' 처리)
            memberService.withdraw(memberId);
        } catch (Exception e) {
            model.addAttribute("loginUser", loginUser);
            model.addAttribute("error", "회원탈퇴 처리 중 오류가 발생했습니다.");
            return "auth/withdraw";
        }

        // ⭐ [유지] 세션 종료(로그아웃)
        session.invalidate();

        // ⭐ [조금 변경] 탈퇴 후 로그인 화면으로 보내는 게 자연스러워서 /login 으로 변경
        redirectAttributes.addFlashAttribute("message", "회원탈퇴가 완료되었습니다.");
        return "redirect:/login";
    }
}
