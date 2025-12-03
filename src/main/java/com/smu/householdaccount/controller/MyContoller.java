package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.BoardComment;
import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.repository.BoardCommentRepository;
import com.smu.householdaccount.repository.BoardLikeRepository;
import com.smu.householdaccount.repository.BoardPostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class MyContoller {

    private final BoardPostRepository boardPostRepository;
    private final BoardCommentRepository boardCommentRepository;
    private final BoardLikeRepository boardLikeRepository;

    @GetMapping("/activity")
    public String myActivity(@SessionAttribute("loginUser") Member loginUser, Model model) {
        String memberId = loginUser.getMemberId();
        Pageable pageable = PageRequest.of(0, 10, Sort.by(Sort.Direction.DESC, "createdAt"));

        Page<BoardPost> myPostPage = boardPostRepository.findByWriterId(memberId,pageable);

        Page<BoardComment> myCommentPage = boardCommentRepository.findByWriterId(memberId, pageable);
        Page<BoardPost> likedPostPage = boardPostRepository.findByBoardLikes_MemberId(memberId,pageable);

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
}