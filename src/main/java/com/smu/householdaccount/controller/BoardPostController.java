package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.service.BoardPostService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
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

        PageRequest pageable = PageRequest.of(page, 10);
        Page<BoardPost> posts;

        if (keyword != null && !keyword.isBlank()) {
            posts = boardPostService.search(keyword, pageable);
        } else {
            posts = boardPostService.findAll(pageable);
        }

        model.addAttribute("posts", posts);
        model.addAttribute("keyword", keyword); // 검색창 유지

        return "board/list";
    }

    /** 게시글 작성 폼 */
    @GetMapping("/write")
    public String writeForm(Model model) {
        return "board/write";
    }

    /** 게시글 작성 저장 */
    @PostMapping("/write")
    public String write(@RequestParam int id,
                        @RequestParam String writerId,
                        @RequestParam String category,
                        @RequestParam String postTitle,
                        @RequestParam String postContent) {

        boardPostService.create(id, writerId, category, postTitle, postContent);

        return "redirect:/board";
    }


    /**
     * 게시글 상세 보기
     */
    @GetMapping("/{id}")
    public String detail(@PathVariable int id, Model model) {

        BoardPost post = boardPostService.findById(id);

        // 조회수 증가
        boardPostService.increaseViewCount(id);

        model.addAttribute("post", post);

        return "board/detail";  // templates/board/detail.html
    }

    /**
     * 게시글 삭제
     */
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable int id) {
        boardPostService.delete(id);
        return "redirect:/board";
    }


    /**
     * 게시글 수정 폼
     */
    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable int id, Model model) {

        BoardPost post = boardPostService.findById(id);
        model.addAttribute("post", post);

        return "board/edit"; // templates/board/edit.html
    }


    /**
     * 게시글 수정 저장
     */
    @PostMapping("/{id}/edit")
    public String edit(@PathVariable int id,
                       @RequestParam String category,
                       @RequestParam String postTitle,
                       @RequestParam String postContent) {

        boardPostService.update(id, category, postTitle, postContent);

        return "redirect:/board/" + id;
    }








}
