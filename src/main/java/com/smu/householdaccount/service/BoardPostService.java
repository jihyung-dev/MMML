package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.BoardPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface BoardPostService {

    BoardPost create(String writerId, String category, String postTitle, String postContent);

    Page<BoardPost> findAll(Pageable pageable);

    BoardPost findById(Long id);

    BoardPost update(Long id, String category, String postTitle, String postContent);

    void delete(Long id);

    void increaseViewCount(Long id);

    Page<BoardPost> search(String keyword, Pageable pageable);
}
