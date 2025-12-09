package com.smu.householdaccount.controller.common;

import com.smu.householdaccount.service.common.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class RejoinController {   // ⭐ [신규 파일]

    private final MemberService memberService;

    /**
     * 🔹 재가입 화면
     *  - 대상: 로그인 시 enabled = 'N' 이라 막힌 사람
     *  - LoginController 에서 withdrawnMemberId 세션에 넣어둔 상태여야 함
     *
     *  GET /rejoin
     */
    @GetMapping("/rejoin")
    public String rejoinForm(
            HttpSession session,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        // ⭐ 로그인 단계에서 저장해 둔 탈퇴회원 아이디
        String withdrawnMemberId = (String) session.getAttribute("withdrawnMemberId");

        // 세션에 없으면 재가입 대상이 아님 → 로그인부터 다시
        if (withdrawnMemberId == null) {
            redirectAttributes.addFlashAttribute("error", "재가입할 회원 정보를 찾을 수 없습니다. 다시 로그인해 주세요.");
            return "redirect:/login";
        }

        // 화면에서 아이디 보여주기 용
        model.addAttribute("memberId", withdrawnMemberId);

        return "auth/rejoin";   // 🔸 templates/auth/rejoin.html 로 이동
    }

    /**
     * 🔹 재가입 처리
     *  - 새 비밀번호 설정 + enabled = 'Y' 로 되살리기
     *
     *  POST /rejoin
     */
    @PostMapping("/rejoin")
    public String rejoin(
            @RequestParam String newPassword,
            @RequestParam String confirmPassword,
            HttpSession session,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        // 1) 세션에서 탈퇴회원 아이디 꺼내기
        String withdrawnMemberId = (String) session.getAttribute("withdrawnMemberId");

        if (withdrawnMemberId == null) {
            redirectAttributes.addFlashAttribute("error", "재가입할 회원 정보를 찾을 수 없습니다. 다시 로그인해 주세요.");
            return "redirect:/login";
        }

        // 2) 비밀번호 검증 (일치 여부)
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("memberId", withdrawnMemberId);
            model.addAttribute("error", "새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
            return "auth/rejoin";
        }

        try {
            // 3) 서비스에 재가입 위임 (비밀번호 재설정 + enabled = 'Y')
            memberService.rejoin(withdrawnMemberId, newPassword);
        } catch (Exception e) {
            model.addAttribute("memberId", withdrawnMemberId);
            model.addAttribute("error", "재가입 처리 중 오류가 발생했습니다.");
            return "auth/rejoin";
        }

        // 4) 재가입용 세션 값 정리
        session.removeAttribute("withdrawnMemberId");

        // 5) 성공 메시지와 함께 로그인 페이지로 이동
        redirectAttributes.addFlashAttribute("message", "재가입이 완료되었습니다. 새 비밀번호로 로그인해 주세요.");
        return "redirect:/login";
    }
}
