package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardComment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardCommentRepository extends JpaRepository<BoardComment, Long> {

    /** 특정 게시글의 모든 댓글 (부모댓글만) */
    List<BoardComment> findByPost_IdAndParentCommentIsNullOrderByCreatedAtAsc(Long postId);

    /** 특정 댓글의 대댓글 */
    List<BoardComment> findByParentComment_IdOrderByCreatedAtAsc(Long parentId);
}
