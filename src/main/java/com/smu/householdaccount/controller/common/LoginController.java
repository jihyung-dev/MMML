package com.smu.householdaccount.controller.common;

import com.smu.householdaccount.dto.CustomUserDetails;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.service.common.MemberService;
import com.smu.householdaccount.service.common.RedisService;
import com.smu.householdaccount.service.hotdeal.SellerService;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final MemberService memberService;
    private final SellerService sellerService;
    private final RedisService redisService;

    /**
     * 로그인 페이지
     **/
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

        // 1) 아이디/비번 불일치
        if (loginUser == null) {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "auth/login";
        }

        // 2) 탈퇴 회원(enabled = 'N') 인지 확인
        if ("N".equalsIgnoreCase(loginUser.getEnabled())) {
            // 재가입 시 쓰기 위해 세션에 아이디 저장
            session.setAttribute("withdrawnMemberId", loginUser.getMemberId());

            // 로그인은 막고, 에러 메시지 + 재가입 유도 플래그
            model.addAttribute("error", "탈퇴한 회원입니다. 재가입을 진행하시겠습니까?");
            model.addAttribute("withdrawn", true);   // ⭐ 팝업 띄우기용 플래그

            return "auth/login";
        }

        // 🔐 보안 강화: 세션에 올리기 전에 비밀번호 필드를 제거
        loginUser.setPassword(null);

        // 🔥 로그인 성공 시 세션 저장
        session.setAttribute("loginUser", loginUser);
        session.setAttribute("loginUserId", loginUser.getMemberId());

        // CSRF 인증용 세션 저장
        CustomUserDetails userDetails = new CustomUserDetails(loginUser);
        Authentication authentication =
                new UsernamePasswordAuthenticationToken(
                        userDetails,
                        null,
                        userDetails.getAuthorities()
                );
        SecurityContextHolder.getContext().setAuthentication(authentication);
        session.setAttribute(
                HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY,
                SecurityContextHolder.getContext()
        );

        String inviteToken = (String) session.getAttribute("inviteToken");
        // 그룹 가게부 초대 토큰이 있을 경우
        if(inviteToken != null){
            return "redirect:/api/group/accept?token=" + inviteToken;
        }

        // 이 회원이 판매자인지 여부 세션에 저장
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

    // 메일 인증 절차 추가
    @GetMapping("/request/mail")
    public ResponseEntity<String> requestMail(HttpSession session, @RequestParam String email) throws MessagingException {
        // 세션에서 메일 정보 받아서 사용자 아이디로 TTL 10분 캐싱 추가
        Member member = (Member) session.getAttribute("loginUser");
//        redisService.saveEmailAuthCode(member.getEmail());
        redisService.saveEmailAuthCode(email);
        return ResponseEntity.ok("success");
    }

    // 수신 메일 인증
    @GetMapping("/request/check_mail")
    public ResponseEntity<Boolean> checkMail(HttpSession session,
                                             @RequestParam String email,
                                             @RequestParam String inputCode) {
        Boolean isValid = redisService.validateAuthCode(email, inputCode);
        return ResponseEntity.ok(isValid);
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
            return "auth/find-pw"; // TODO: 추후 비동기 처리 고려
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
