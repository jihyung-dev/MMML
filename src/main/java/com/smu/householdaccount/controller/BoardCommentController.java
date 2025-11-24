package com.smu.householdaccount.controller;

import com.smu.householdaccount.service.BoardCommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment")
public class BoardCommentController {

    private final BoardCommentService commentService;

    /**
     * 댓글 작성 / 대댓글 작성
     */
    @PostMapping("/write")
    public String write(@RequestParam Long id,
                        @RequestParam int postId,
                        @RequestParam String writerId,
                        @RequestParam String content,
                        @RequestParam(required = false) Long parentId) {

        commentService.create(id, postId, writerId, content, parentId);

        return "redirect:/board/" + postId; // 게시글 상세로 이동
    }

    /**
     * 댓글 삭제
     */
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id,
                         @RequestParam int postId) {

        commentService.delete(id);

        return "redirect:/board/" + postId;
    }
}
