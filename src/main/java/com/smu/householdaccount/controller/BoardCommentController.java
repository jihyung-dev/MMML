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
     * postId  : 게시글 번호
     * writerId: 댓글 작성자 ID
     * content : 내용
     * parentId: 부모 댓글(대댓글)
     */
    @PostMapping("/write")
    public String write(@RequestParam Long postId,
                        @RequestParam String writerId,
                        @RequestParam String content,
                        @RequestParam(required = false) Long parentId) {

        commentService.write(postId, writerId, content, parentId);

        return "redirect:/board/" + postId;
    }

    /**
     * 댓글 삭제
     */
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id,
                         @RequestParam Long postId) {

        commentService.delete(id);

        return "redirect:/board/" + postId;
    }
}
