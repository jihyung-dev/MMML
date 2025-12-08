package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.service.BoardCommentService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment")
public class BoardCommentController {

    private final BoardCommentService commentService;

    /** 댓글 또는 대댓글 작성 */
    @PostMapping("/write")
    public String write(@RequestParam Long postId,
                        @RequestParam String content,
                        @RequestParam(required = false) Long parentId,
                        @SessionAttribute(name = "loginUser", required = false) Member loginUser) {

        if (loginUser == null) {
            return "redirect:/login";  // 로그인 안 되어 있으면 로그인 페이지로
        }

        String loginUserId = loginUser.getMemberId();

        // 댓글/대댓글 생성
        commentService.create(postId, content, parentId, loginUserId);

        return "redirect:/board/" + postId;
    }

    /** 댓글 삭제 */
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id,
                         @RequestParam Long postId,
                         HttpSession session) {

        // 로그인 사용자 체크
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }

        String loginUserId = loginUser.getMemberId();

        // 삭제 수행
        commentService.delete(id, loginUserId);

        return "redirect:/board/" + postId;
    }
}
