package com.smu.householdaccount.service.board;

import com.smu.householdaccount.entity.board.BoardComment;
import org.springframework.data.domain.Page;

public interface BoardCommentService {

    /** 댓글 또는 대댓글 생성 (작성자 자동) */
    BoardComment create(Long postId, String content, Long parentId, String loginUserId);

    /** 댓글 삭제 (작성자 본인만 가능) */
    void delete(Long commentId, String loginUserId);

    /** 특정 게시글의 부모 댓글 페이지네이션 */
    Page<BoardComment> getParentComments(Long postId, int page, int size);
}
