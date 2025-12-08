package com.smu.householdaccount.controller.board;

import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.service.board.BoardLikeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/like")
public class BoardLikeController {

    private final BoardLikeService boardLikeService;

    /** 좋아요 추가 */
    @PostMapping("/add/{postId}")
    public String like(@PathVariable Long postId, HttpSession session) {

        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";   // 로그인 안 되어있으면 로그인 화면으로
        }

        boardLikeService.like(postId, loginUser.getMemberId());
        return "redirect:/board/" + postId;
    }

    /** 좋아요 취소 */
    @PostMapping("/remove/{postId}")
    public String unlike(@PathVariable Long postId, HttpSession session) {

        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";   // 로그인 안 되어있으면 로그인 화면으로
        }

        boardLikeService.unlike(postId, loginUser.getMemberId());
        return "redirect:/board/" + postId;
    }
}
