package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardComment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BoardCommentRepository extends JpaRepository<BoardComment, Long> {
    //@Query(value = "SELECT * FROM BOARD_COMMENT LIMIT :start,:length",nativeQuery = true) !!!!!!!!!!절대쓰면안됨
    // 게시글 기준 댓글 전체 (정렬)
    List<BoardComment> findByPost_IdOrderByCreatedAtAsc(Long postId);

    // 대댓글 조회
    List<BoardComment> findByParentComment_IdOrderByCreatedAtAsc(Long parentId);
}
