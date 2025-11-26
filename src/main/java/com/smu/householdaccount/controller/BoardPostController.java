package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.service.BoardPostService;
import jakarta.servlet.http.HttpSession;
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
    public String list(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(required = false) String keyword,
            Model model
    ) {

        PageRequest pageable = PageRequest.of(page, 10);
        Page<BoardPost> posts;

        if (keyword != null && !keyword.isBlank()) {
            posts = boardPostService.search(keyword, pageable);
        } else {
            posts = boardPostService.findAll(pageable);
        }

        model.addAttribute("posts", posts);
        model.addAttribute("keyword", keyword);

        return "board/list";
    }

    /** 글쓰기 폼 */
    @GetMapping("/write")
    public String writeForm(HttpSession session) {

        if (session.getAttribute("loginUserId") == null) {
            return "redirect:/login";
        }

        return "board/write";
    }

    /** 글 저장 */
    @PostMapping("/write")
    public String write(
            @RequestParam String category,
            @RequestParam String postTitle,
            @RequestParam String postContent,
            HttpSession session
    ) {

        String loginUserId = (String) session.getAttribute("loginUserId");

        if (loginUserId == null) {
            return "redirect:/login";
        }

        boardPostService.create(category, postTitle, postContent, loginUserId);

        return "redirect:/board";
    }

    /** 글 상세 보기 */
    @GetMapping("/{id}")
    public String detail(@PathVariable Long id, Model model) {

        BoardPost post = boardPostService.findById(id);

        boardPostService.increaseViewCount(id);

        model.addAttribute("post", post);

        return "board/detail";
    }

    /** 수정 폼 */
    @GetMapping("/{id}/edit")
    public String editForm(
            @PathVariable Long id,
            HttpSession session,
            Model model
    ) {

        String loginUserId = (String) session.getAttribute("loginUserId");
        if (loginUserId == null) return "redirect:/login";

        BoardPost post = boardPostService.findById(id);

        if (!post.getWriter().getMemberId().equals(loginUserId)) {
            throw new RuntimeException("본인만 수정할 수 있습니다.");
        }

        model.addAttribute("post", post);

        return "board/edit";
    }

    /** 수정 저장 */
    @PostMapping("/{id}/edit")
    public String edit(
            @PathVariable Long id,
            @RequestParam String category,
            @RequestParam String postTitle,
            @RequestParam String postContent,
            HttpSession session
    ) {

        String loginUserId = (String) session.getAttribute("loginUserId");
        if (loginUserId == null) return "redirect:/login";

        boardPostService.update(id, category, postTitle, postContent, loginUserId);

        return "redirect:/board/" + id;
    }

    /** 삭제 */
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id, HttpSession session) {

        String loginUserId = (String) session.getAttribute("loginUserId");
        if (loginUserId == null) return "redirect:/login";

        boardPostService.delete(id, loginUserId);

        return "redirect:/board";
    }
}
