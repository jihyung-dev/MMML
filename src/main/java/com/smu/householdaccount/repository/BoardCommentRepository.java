package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardComment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardCommentRepository extends JpaRepository<BoardComment, Long> {

    // 게시글 기준 댓글 전체 (정렬)
    List<BoardComment> findByPost_IdOrderByCreatedAtAsc(Long postId);

    // 대댓글 조회
    List<BoardComment> findByParentComment_IdOrderByCreatedAtAsc(Long parentId);
}
