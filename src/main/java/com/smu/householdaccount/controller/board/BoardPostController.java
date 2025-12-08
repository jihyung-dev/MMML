package com.smu.householdaccount.controller.board;

import com.smu.householdaccount.entity.board.BoardPost;
import com.smu.householdaccount.entity.board.BoardComment;
import com.smu.householdaccount.service.board.BoardPostService;
import com.smu.householdaccount.service.board.BoardCommentService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardPostController {

    private final BoardPostService boardPostService;
    private final BoardCommentService boardCommentService; // ✅ 댓글 서비스 주입

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

    /** 글 상세 보기 + 댓글(부모 기준) 7개씩 페이지네이션 */
    @GetMapping("/{id}")
    public String detail(@PathVariable Long id,
                         @RequestParam(name = "cPage", defaultValue = "0") int cPage,
                         Model model) {

        // 게시글 조회
        BoardPost post = boardPostService.findById(id);

        // 조회수 증가
        boardPostService.increaseViewCount(id);

        // ✅ 부모 댓글 페이지네이션 (7개씩)
        int pageSize = 7;
        Page<BoardComment> parentCommentsPage =
                boardCommentService.getParentComments(id, cPage, pageSize);

        List<BoardComment> parentComments = parentCommentsPage.getContent();

        model.addAttribute("post", post);
        model.addAttribute("parentCommentsPage", parentCommentsPage);
        model.addAttribute("parentComments", parentComments);

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
