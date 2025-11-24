
package com.smu.householdaccount.controller;

import com.smu.householdaccount.service.BoardLikeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/like")
public class BoardLikeController {

    private final BoardLikeService boardLikeService;

    // 좋아요 실행
    @PostMapping("/add")
    public String like(@RequestParam Long id,
                       @RequestParam int postId,
                       @RequestParam String memberId) {

        boardLikeService.like(id, postId, memberId);
        return "redirect:/board/" + postId;
    }

    // 좋아요 취소
    @PostMapping("/remove")
    public String unlike(@RequestParam int postId,
                         @RequestParam String memberId) {

        boardLikeService.unlike(postId, memberId);
        return "redirect:/board/" + postId;
    }
}
