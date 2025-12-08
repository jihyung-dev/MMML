package com.smu.householdaccount.controller.common;

import com.smu.householdaccount.entity.board.BoardComment;
import com.smu.householdaccount.entity.board.BoardPost;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.entity.hotdeal.ItemWish;
import com.smu.householdaccount.repository.board.BoardCommentRepository;
import com.smu.householdaccount.repository.board.BoardLikeRepository;
import com.smu.householdaccount.repository.board.BoardPostRepository;
import com.smu.householdaccount.repository.hotdeal.ItemWishRepository;
import com.smu.householdaccount.service.common.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class MyContoller {

    private final BoardPostRepository boardPostRepository;
    private final BoardCommentRepository boardCommentRepository;
    private final BoardLikeRepository boardLikeRepository;
    private final MemberService memberService;

    // ✅ [추가] 찜 리포지토리 주입
    private final ItemWishRepository itemWishRepository;

    @GetMapping("/activity")
    public String myActivity(@SessionAttribute("loginUser") Member loginUser, Model model) {
        String memberId = loginUser.getMemberId();
        Pageable pageable = PageRequest.of(0, 10, Sort.by(Sort.Direction.DESC, "createdAt"));

        Page<BoardPost> myPostPage = boardPostRepository.findByWriterId(memberId,pageable);

        Page<BoardComment> myCommentPage = boardCommentRepository.findByWriterId(memberId, pageable);
        Page<BoardPost> likedPostPage = boardPostRepository.findByBoardLikes_MemberId(memberId,pageable);

        // ✅ [추가] 찜한 핫딜 (최신순 3개만 조회 -> 미리보기용)
        Pageable limitThree = PageRequest.of(0, 3, Sort.by(Sort.Direction.DESC, "createdAt"));
        Page<ItemWish> myWishPage = itemWishRepository.findByMemberMemberId(memberId, limitThree);

        model.addAttribute("myPostPage", myPostPage);
        model.addAttribute("myCommentPage", myCommentPage);
        model.addAttribute("likedPostPage", likedPostPage);

        return "user/activity";
    }

    @GetMapping
    public String myPage(@SessionAttribute("loginUser") Member loginUser, Model model) {
        model.addAttribute("member", loginUser);
        return "user/mypage";
    }

    @GetMapping("/user/editpage")
    public String editPage(@SessionAttribute("loginUser") Member loginUser, Model model) {
        model.addAttribute("member", loginUser);
        return "user/editpage";
    }
    @PostMapping("/user/editpage")
    public String editProfile(
            @SessionAttribute("loginUser") Member loginUser,
            @RequestParam String memberName,
            @RequestParam String currentpw,
            @RequestParam String newpw,
            @RequestParam String newpw2,
            @RequestParam String phone,
            @RequestParam String address,
            Model model,
            HttpSession session
    )
    {
        try {
            Member updateMember =memberService.updateMemberInfo(
                    loginUser.getMemberId(),
                    memberName,
                    currentpw,
                    newpw,
                    newpw2,
                    phone,
                    address
            );
            updateMember.setPassword(null);
            session.setAttribute("loginUser", updateMember);
            return "redirect:/mypage"; // 정상 처리 후 리다이렉트
        } catch (RuntimeException e){
            model.addAttribute("errorMessage", e.getMessage());
            model.addAttribute("member", loginUser);
            return "user/editpage"; // 예외 시 editpage 그대로 보여주기
        }
    }

    // ✅ [추가] 찜한 핫딜 전체 보기 페이지 (더보기 클릭 시 이동)
    @GetMapping("/wishlist")
    public String myWishlist(@SessionAttribute("loginUser") Member loginUser,
                             @RequestParam(defaultValue = "0") int page,
                             Model model) {

        String memberId = loginUser.getMemberId();
        // 12개씩 보여주기
        Pageable pageable = PageRequest.of(page, 12, Sort.by(Sort.Direction.DESC, "createdAt"));

        Page<ItemWish> wishPage = itemWishRepository.findByMemberMemberId(memberId, pageable);

        model.addAttribute("wishPage", wishPage);
        return "user/wishlist"; // templates/user/wishlist.html 필요
    }
}