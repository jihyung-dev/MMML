package com.smu.householdaccount.controller.hotdeal;

import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.entity.hotdeal.Seller;
import com.smu.householdaccount.service.hotdeal.SellerService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;                      // ✅ Bean Validation용
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;   // ✅ 검증 결과
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/seller")
public class SellerController {

    private final SellerService sellerService;

    /**
     * 판매자 홈
     * - 전제: 일반 로그인으로 이미 로그인된 상태여야 함
     * - loginUser 세션(Member)을 보고, 해당 회원이 판매자인지 확인
     */
    @GetMapping
    public String sellerHome(
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        // 1) 로그인 여부 확인
        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("error", "로그인 후 이용 가능합니다.");
            return "redirect:/login";
        }

        // 2) 이 회원이 판매자로 등록되어 있는지 확인
        Seller seller = sellerService.getSellerByMemberId(loginUser.getMemberId());
        if (seller == null) {
            redirectAttributes.addFlashAttribute("error", "판매자 등록 후 이용 가능합니다.");
            return "redirect:/seller/join";
        }

        // 3) 판매자 정보 화면에 전달
        model.addAttribute("seller", seller);
        return "seller/home";
    }

    // =============================
    //  🔹 사업자번호 찾기
    // =============================

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

    // =============================
    //  🔹 사업자번호 실시간 중복 체크 (AJAX)
    // =============================

    @GetMapping("/api/check-biz-no")
    @ResponseBody
    public java.util.Map<String, Boolean> checkBizNo(@RequestParam String bizNo) {
        boolean duplicate = sellerService.existsByBizNo(bizNo);
        return java.util.Map.of("duplicate", duplicate);
    }

    // =============================
    //  🔹 판매자 등록 (일반 로그인 상태에서)
    // =============================

    /**
     * 판매자 등록 폼
     * - 일반 로그인 상태에서만 진입 가능
     * - 이미 판매자인 경우, 판매자 홈으로 리다이렉트
     */
    @GetMapping("/join")
    public String sellerJoinForm(
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        // 1) 로그인 되어 있는지 확인
        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("error", "로그인 후 판매자 등록이 가능합니다.");
            return "redirect:/login";
        }

        // 2) 이미 판매자로 등록된 회원인지 확인
        Seller existingSeller = sellerService.getSellerByMemberId(loginUser.getMemberId());
        if (existingSeller != null) {
            redirectAttributes.addFlashAttribute("error", "이미 판매자로 등록된 회원입니다.");
            return "redirect:/seller";
        }

        // 3) 새 판매자 등록용 빈 객체 전달
        if (!model.containsAttribute("seller")) {
            model.addAttribute("seller", new Seller());
        }
        return "auth/join-seller"; // 판매자 가입 폼
    }

    /**
     * 판매자 등록 처리
     * - Member는 새로 만들지 않고, 현재 로그인한 회원과 1:1로 연결
     * - Seller 엔티티에 붙어있는 @NotBlank/@NotNull 등 Bean Validation이 수행됨
     */
    @PostMapping("/join")
    public String sellerJoin(
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            @Valid @ModelAttribute("seller") Seller seller,   // ✅ 검증 대상
            BindingResult bindingResult,                      // ✅ 바로 뒤에 위치 필수
            HttpSession session,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        // 1) 로그인 체크
        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("error", "로그인 후 판매자 등록이 가능합니다.");
            return "redirect:/login";
        }

        // 2) Bean Validation (NOT NULL / NOT BLANK 등) 에러 체크
        if (bindingResult.hasErrors()) {
            // FieldError 들은 Thymeleaf에서 th:errors로 출력 가능
            // 여기서는 단순히 다시 폼으로 보냄
            return "auth/join-seller";
        }

        // 3) 현재 로그인한 회원을 판매자와 연결 (1:1)
        seller.setMember(loginUser);

        try {
            // 4) 비즈니스 검증 (이미 판매자인지, 사업자번호 중복인지 등)
            sellerService.registerSeller(seller);
        } catch (IllegalStateException e) {
            // 🛑 서비스 레벨 비즈니스 에러 (이미 판매자, 사업자번호 중복 등)
            model.addAttribute("error", e.getMessage());
            model.addAttribute("seller", seller);
            return "auth/join-seller";
        }

        // 5) 세션에 판매자 여부 반영 (핫딜 메인에서 버튼 분기용)
        session.setAttribute("isSeller", true);

        redirectAttributes.addFlashAttribute("message", "판매자 등록이 완료되었습니다.");
        return "redirect:/hotdeal";
    }

    // =============================
    //  🔹 판매자 정보 수정
    // =============================

    @GetMapping("/editpage")
    public String editSellerForm(
            @SessionAttribute("loginUser") Member loginUser,
            Model model
    ) {
        Seller seller = sellerService.getSellerByMemberId(loginUser.getMemberId());
        if (seller == null) {
            // 아직 판매자 등록 안 된 경우 → 등록 페이지로
            return "redirect:/seller/join";
        }

        model.addAttribute("seller", seller);
        return "seller/editpage";
    }

    @PostMapping("/editpage")
    public String editSeller(
            @SessionAttribute("loginUser") Member loginUser,
            @Valid @ModelAttribute("seller") Seller updatedSeller,  // ✅ 수정 시에도 검증
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        // 1) 검증 에러 있으면 다시 수정 폼으로
        if (bindingResult.hasErrors()) {
            model.addAttribute("seller", updatedSeller);
            return "seller/editpage";
        }

        // 2) 실제 수정 처리 (memberId 기준으로 기존 Seller 찾아서 덮어쓰기)
        sellerService.updateSeller(loginUser.getMemberId(), updatedSeller);

        redirectAttributes.addFlashAttribute("message", "판매자 정보가 수정되었습니다.");
        return "redirect:/seller";
    }

}
