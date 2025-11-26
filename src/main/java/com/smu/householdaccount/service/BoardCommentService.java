package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.BoardComment;

public interface BoardCommentService {

    /** 댓글 또는 대댓글 생성 (작성자 자동) */
    BoardComment create(Long postId, String content, Long parentId, String loginUserId);

    /** 댓글 삭제 (작성자 본인만 가능) */
    void delete(Long commentId, String loginUserId);
}
