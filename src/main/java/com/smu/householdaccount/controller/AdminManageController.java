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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public String members(HttpSession session,
                          Model model,
                          @RequestParam(defaultValue = "0") int page,
                          @RequestParam(defaultValue = "10") int size,
                          @RequestParam(required = false) String keyword) {

        if (isNotAdmin(session)) return "redirect:/";

        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Member> memberPage;

        if (keyword != null && !keyword.isBlank()) {
            memberPage = memberRepository
                    .findByMemberIdContainingIgnoreCaseOrMemberNameContainingIgnoreCaseOrMemberNicknameContainingIgnoreCase(
                            keyword, keyword, keyword, pageable
                    );
        } else {
            memberPage = memberRepository.findAll(pageable);
            keyword = ""; // 뷰에서 쓰기 편하게
        }

        model.addAttribute("memberPage", memberPage);
        model.addAttribute("keyword", keyword);

        return "admin/members";
    }

    /** 2) 판매자 관리 */
    @GetMapping("/sellers")
    public String sellers(HttpSession session,
                          Model model,
                          @RequestParam(defaultValue = "0") int page,
                          @RequestParam(defaultValue = "10") int size,
                          @RequestParam(required = false) String keyword) {

        if (isNotAdmin(session)) return "redirect:/";

        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Seller> sellerPage;

        if (keyword != null && !keyword.isBlank()) {
            sellerPage = sellerRepository
                    .findByMember_MemberIdContainingIgnoreCaseOrMember_MemberNicknameContainingIgnoreCaseOrBizNameContainingIgnoreCase(
                            keyword, keyword, keyword, pageable
                    );
        } else {
            sellerPage = sellerRepository.findAll(pageable);
            keyword = "";
        }

        model.addAttribute("sellerPage", sellerPage);
        model.addAttribute("keyword", keyword);

        return "admin/sellers";   // templates/admin/sellers.html
    }

    /** 3) 게시판 관리 */
    @GetMapping("/board")
    public String board(HttpSession session,
                        Model model,
                        @RequestParam(defaultValue = "0") int page,
                        @RequestParam(defaultValue = "10") int size,
                        @RequestParam(required = false) String keyword) {

        if (isNotAdmin(session)) return "redirect:/";

        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<BoardPost> postPage;

        if (keyword != null && !keyword.isBlank()) {
            postPage = boardPostRepository
                    .findByPostTitleContainingIgnoreCaseOrWriter_MemberNicknameContainingIgnoreCase(
                            keyword, keyword, pageable
                    );
        } else {
            postPage = boardPostRepository.findAll(pageable);
            keyword = "";
        }

        model.addAttribute("postPage", postPage);
        model.addAttribute("keyword", keyword);

        return "admin/board";     // templates/admin/board.html
    }


    /** 4) 핫딜 관리 */
    @GetMapping("/hotdeal")
    public String hotdeal(HttpSession session,
                          Model model,
                          @RequestParam(defaultValue = "0") int page,
                          @RequestParam(defaultValue = "10") int size,
                          @RequestParam(required = false) String keyword) {

        if (isNotAdmin(session)) return "redirect:/";

        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        Page<Item> itemPage;

        if (keyword != null && !keyword.isBlank()) {
            itemPage = itemRepository.findByItemNameContainingIgnoreCase(keyword, pageable);
        } else {
            itemPage = itemRepository.findAll(pageable);
            keyword = "";
        }

        model.addAttribute("itemPage", itemPage);
        model.addAttribute("keyword", keyword);

        return "admin/hotdeal";   // templates/admin/hotdeal.html
    }

    /** 5) 가계부 관리 (일단은 화면만) */
    @GetMapping("/ledger")
    public String ledger(HttpSession session, Model model) {
        if (isNotAdmin(session)) return "redirect:/";

        // 나중에 ledgerRepository 붙이면 여기서 데이터 넣기
        return "admin/ledger";    // → templates/admin/ledger.html
    }


    // 유저 활성/비활성 토글용 메서드
    @PostMapping("/members/{memberId}/toggle")
    public String toggleMemberEnabled(@PathVariable String memberId,
                                      @RequestParam(defaultValue = "0") int page,
                                      @RequestParam(defaultValue = "10") int size,
                                      HttpSession session) {

        if (isNotAdmin(session)) return "redirect:/";

        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new IllegalArgumentException("회원이 존재하지 않습니다: " + memberId));

        // enabled 컬럼이 'Y' / 'N' 이라고 가정
        if ("Y".equalsIgnoreCase(member.getEnabled())) {
            member.setEnabled("N");
        } else {
            member.setEnabled("Y");
        }

        memberRepository.save(member);

        return "redirect:/admin/members?page=" + page + "&size=" + size;
    }



}
