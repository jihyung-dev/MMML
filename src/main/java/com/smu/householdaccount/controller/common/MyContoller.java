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
    /**
     * 내 활동 (찜한 상품, 쓴 글 등 요약 보기)
     */
    @GetMapping("/activity")
    public String myActivity(@SessionAttribute("loginUser") Member loginUser, Model model) {
        String memberId = loginUser.getMemberId();

        // 1. 내가 쓴 글 (최신 3개)
        Pageable limitThree = PageRequest.of(0, 3, Sort.by(Sort.Direction.DESC, "createdAt"));
        Page<BoardPost> myPostPage = boardPostRepository.findByWriterId(memberId, limitThree);

        // 2. 내가 쓴 댓글 (최신 3개)
        Page<BoardComment> myCommentPage = boardCommentRepository.findByWriterId(memberId, limitThree);

        // 3. 좋아요 누른 글 (최신 3개)
        Page<BoardPost> likedPostPage = boardPostRepository.findByBoardLikes_MemberId(memberId, limitThree);

        // 4. 찜한 핫딜 (최신 3개)
        Page<ItemWish> myWishPage = itemWishRepository.findByMemberMemberId(memberId, limitThree);

        model.addAttribute("myPostPage", myPostPage);
        model.addAttribute("myCommentPage", myCommentPage);
        model.addAttribute("likedPostPage", likedPostPage);
        model.addAttribute("myWishPage", myWishPage);

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

    // ==========================================
    // ▼ [해결] 작동하지 않던 '더보기' 링크 연결 메서드 추가
    // ==========================================

    // 1. 찜한 핫딜 전체 보기 (/mypage/ajax/wishlist)
    // [수정 후] 이렇게 바꿔주세요!
    @GetMapping("/wishlist")  // 1. 주소 변경: /mypage/wishlist
    public String myWishlist(@SessionAttribute("loginUser") Member loginUser,
                             @RequestParam(defaultValue = "0") int page,
                             Model model) {
        String memberId = loginUser.getMemberId();
        Pageable pageable = PageRequest.of(page, 12, Sort.by(Sort.Direction.DESC, "createdAt"));
        Page<ItemWish> wishPage = itemWishRepository.findByMemberMemberId(memberId, pageable);
        model.addAttribute("wishPage", wishPage);

        // 2. 파일 경로 변경: templates/user/wishlist.html 을 바라보도록 설정
        return "user/wishlist";
    }

    // ==========================================
    // [AJAX 전용] 부분 화면 리턴 메서드들
    // ==========================================

    // 1. 내가 쓴 글 (AJAX)
    @GetMapping("/ajax/posts")
    public String ajaxMyPosts(@SessionAttribute("loginUser") Member loginUser,
                              @RequestParam(defaultValue = "0") int page,
                              Model model) {
        String memberId = loginUser.getMemberId();
        Pageable pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "createdAt"));

        Page<BoardPost> postPage = boardPostRepository.findByWriterId(memberId, pageable);
        model.addAttribute("postPage", postPage);

        // ★ 중요: 전체 페이지가 아니라 'post_list.html' 파일만 리턴합니다.
        return "user/ajax/post_list :: postListFragment";
    }

    // 2. 내가 쓴 댓글 (AJAX)
    @GetMapping("/ajax/comments")
    public String ajaxMyComments(@SessionAttribute("loginUser") Member loginUser,
                                 @RequestParam(defaultValue = "0") int page,
                                 Model model) {
        String memberId = loginUser.getMemberId();
        Pageable pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "createdAt"));

        Page<BoardComment> commentPage = boardCommentRepository.findByWriterId(memberId, pageable);
        model.addAttribute("commentPage", commentPage);

        return "user/ajax/comment_list :: commentListFragment";
    }

    // 3. 좋아요 누른 글 (AJAX)
    @GetMapping("/ajax/liked")
    public String ajaxMyLiked(@SessionAttribute("loginUser") Member loginUser,
                              @RequestParam(defaultValue = "0") int page,
                              Model model) {
        String memberId = loginUser.getMemberId();
        Pageable pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "createdAt"));

        Page<BoardPost> likedPage = boardPostRepository.findByBoardLikes_MemberId(memberId, pageable);
        model.addAttribute("likedPage", likedPage);

        return "user/ajax/liked_list :: likedListFragment";
    }
}