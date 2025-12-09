package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.entity.hotdeal.Seller;
import com.smu.householdaccount.entity.board.BoardPost;
import com.smu.householdaccount.entity.hotdeal.Item;
import com.smu.householdaccount.repository.common.MemberRepository;
import com.smu.householdaccount.repository.hotdeal.SellerRepository;
import com.smu.householdaccount.repository.board.BoardPostRepository;
import com.smu.householdaccount.repository.hotdeal.ItemRepository;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminManageController {

    private final MemberRepository memberRepository;
    private final SellerRepository sellerRepository;
    private final BoardPostRepository boardPostRepository;
    private final ItemRepository itemRepository;
    // 가계부는 나중에 Repository 생기면 추가해도 됨

    /** 공통: 관리자인지 체크 */
    private boolean isNotAdmin(HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        return (loginUser == null || !"ADMIN".equalsIgnoreCase(loginUser.getRole()));
    }

    /** 1) 회원 관리 */
    @GetMapping("/members")
    public String members(HttpSession session, Model model) {
        if (isNotAdmin(session)) return "redirect:/";

        model.addAttribute("members", memberRepository.findAll());
        return "admin/members";   // → templates/admin/members.html
    }

    /** 2) 판매자 관리 */
    @GetMapping("/sellers")
    public String sellers(HttpSession session, Model model) {
        if (isNotAdmin(session)) return "redirect:/";

        model.addAttribute("sellers", sellerRepository.findAll());
        return "admin/sellers";   // → templates/admin/sellers.html
    }

    /** 3) 게시판 관리 */
    @GetMapping("/board")
    public String board(HttpSession session, Model model) {
        if (isNotAdmin(session)) return "redirect:/";

        model.addAttribute("posts", boardPostRepository.findAll());
        return "admin/board";     // → templates/admin/board.html
    }

    /** 4) 핫딜 관리 */
    @GetMapping("/hotdeal")
    public String hotdeal(HttpSession session, Model model) {
        if (isNotAdmin(session)) return "redirect:/";

        model.addAttribute("items", itemRepository.findAll());
        return "admin/hotdeal";   // → templates/admin/hotdeal.html
    }

    /** 5) 가계부 관리 (일단은 화면만) */
    @GetMapping("/ledger")
    public String ledger(HttpSession session, Model model) {
        if (isNotAdmin(session)) return "redirect:/";

        // 나중에 ledgerRepository 붙이면 여기서 데이터 넣기
        return "admin/ledger";    // → templates/admin/ledger.html
    }


}
