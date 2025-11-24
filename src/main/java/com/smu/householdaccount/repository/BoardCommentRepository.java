package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardComment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardCommentRepository extends JpaRepository<BoardComment, Long> {

    /**
     * 특정 게시글의 댓글 전체 조회 (작성순)
     */
    List<BoardComment> findByPost_IdOrderByCreatedAtAsc(int postId);

    /**
     * 특정 댓글의 대댓글 조회 (작성순)
     */
    List<BoardComment> findByParentComment_IdOrderByCreatedAtAsc(Long parentId);
}