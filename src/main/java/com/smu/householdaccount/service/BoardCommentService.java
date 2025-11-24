package com.smu.householdaccount.service;
import com.smu.householdaccount.entity.BoardComment;

import java.util.List;

public interface BoardCommentService {
    // 댓글 등록
    BoardComment create(Long id, int postId, String writerId, String content, Long parentId);

    // 특정 게시글의 댓글 조회
    List<BoardComment> findByPostId(int postId);

    // 단일 댓글 조회
    BoardComment findById(Long id);

    // 댓글 삭제
    void delete(Long id);
}
