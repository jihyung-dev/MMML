package com.smu.householdaccount.repository.board;

import com.smu.householdaccount.entity.board.BoardComment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardCommentRepository extends JpaRepository<BoardComment, Long> {

    /**
     * 특정 게시글의 부모 댓글만 페이지네이션
     */
    Page<BoardComment> findByPost_IdAndParentCommentIsNull(Long postId, Pageable pageable);

    /**
     * 특정 부모 댓글의 대댓글 목록 (작성일 오름차순)
     * (지금은 c.boardComments 양방향 매핑을 쓰면 이거 안 써도 됨)
     */
    List<BoardComment> findByParentComment_IdOrderByCreatedAtAsc(Long parentId);

    Page<BoardComment> findByWriterId(String memberId, Pageable pageable);
}
