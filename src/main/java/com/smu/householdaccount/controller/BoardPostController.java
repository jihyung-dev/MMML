package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.service.BoardPostService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardPostController {

    private final BoardPostService boardPostService;

    /** 게시글 목록 */
    @GetMapping
    public String list(@RequestParam(defaultValue = "0") int page,
                       @RequestParam(required = false) String keyword,
                       Model model) {

        PageRequest pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "createdAt"));

        Page<BoardPost> posts = (keyword == null || keyword.isBlank())
                ? boardPostService.findAll(pageable)
                : boardPostService.search(keyword, pageable);

        model.addAttribute("posts", posts);
        model.addAttribute("keyword", keyword);

        return "board/list";
    }

    /** 작성 폼 */
    @GetMapping("/write")
    public String writeForm() {
        return "board/write";
    }

    /** 저장 */
    @PostMapping("/write")
    public String write(@RequestParam String writerId,
                        @RequestParam String category,
                        @RequestParam String postTitle,
                        @RequestParam String postContent) {

        boardPostService.create(writerId, category, postTitle, postContent);
        return "redirect:/board";
    }

    /** 상세 */
    @GetMapping("/{id}")
    public String detail(@PathVariable Long id, Model model) {

        BoardPost post = boardPostService.findById(id);
        boardPostService.increaseViewCount(id);

        model.addAttribute("post", post);
        return "board/detail";
    }

    /** 삭제 */
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        boardPostService.delete(id);
        return "redirect:/board";
    }

    /** 수정 폼 */
    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {

        BoardPost post = boardPostService.findById(id);
        model.addAttribute("post", post);

        return "board/edit";
    }

    /** 수정 저장 */
    @PostMapping("/{id}/edit")
    public String edit(@PathVariable Long id,
                       @RequestParam String category,
                       @RequestParam String postTitle,
                       @RequestParam String postContent) {

        boardPostService.update(id, category, postTitle, postContent);
        return "redirect:/board/" + id;
    }
}
