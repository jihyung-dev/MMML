package com.smu.householdaccount.controller.hotdeal;

import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.entity.hotdeal.Seller;
import com.smu.householdaccount.service.hotdeal.SellerService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

        // 3) 새 판매자 등록용 객체 전달
        model.addAttribute("seller", new Seller());
        return "auth/join-seller"; // 기존 판매자 가입 폼 템플릿 재사용
    }

    /**
     * 판매자 등록 처리
     * - Member는 새로 만들지 않고, 현재 로그인한 회원과 1:1로 연결
     */
    @PostMapping("/join")
    public String sellerJoin(
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            @ModelAttribute("seller") Seller seller,
            HttpSession session,                         // ⭐ 추가
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        // (1) 로그인/중복/검증 로직은 그대로 두고...

        // 4) 현재 로그인한 회원을 판매자와 연결
        seller.setMember(loginUser);

        // 5) 판매자 등록
        sellerService.registerSeller(seller);

        // ⭐ 여기 추가: 이제 이 세션은 판매자 계정!
        session.setAttribute("isSeller", true);

        redirectAttributes.addFlashAttribute("message", "판매자 등록이 완료되었습니다.");
        return "redirect:/hotdeal";
    }

    @GetMapping("/editpage")
    public String editSellerForm(@SessionAttribute("loginUser") Member loginUser, Model model) {
        Seller seller = sellerService.getSellerByMemberId(loginUser.getMemberId());
        if (seller == null) {
            return "redirect:/seller/join"; // 등록 안 된 경우
        }
        model.addAttribute("seller", seller);
        return "seller/editpage";
    }

    @PostMapping("/editpage")
    public String editSeller(
            @SessionAttribute("loginUser") Member loginUser,
            @ModelAttribute("seller") Seller updatedSeller,
            RedirectAttributes redirectAttributes
    ) {
        sellerService.updateSeller(loginUser.getMemberId(), updatedSeller);
        redirectAttributes.addFlashAttribute("message", "판매자 정보가 수정되었습니다.");
        return "redirect:/seller";
    }

}
