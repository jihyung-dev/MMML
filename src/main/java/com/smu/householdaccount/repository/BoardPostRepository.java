package com.smu.householdaccount.repository;


import com.smu.householdaccount.entity.BoardPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface BoardPostRepository extends JpaRepository<BoardPost,Integer> {
    // 날짜 범위 조회
    List<BoardPost> findByCreatedAtBetween(LocalDateTime start, LocalDateTime end);

    // 카테고리 조회
    List<BoardPost> findByCategory(String category);

    Page<BoardPost> findByPostTitleContainingOrPostContentContaining(
            String titleKeyword,
            String contentKeyword,
            Pageable pageable
    );




}


