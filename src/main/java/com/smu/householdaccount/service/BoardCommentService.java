package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.BoardComment;

import java.util.List;

public interface BoardCommentService {

    BoardComment write(Long postId, String writerId, String content, Long parentId);

    List<BoardComment> findByPost(Long postId);

    void delete(Long id);
}
