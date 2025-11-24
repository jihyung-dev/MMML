package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface BoardPostRepository extends JpaRepository<BoardPost, Long> {

    // 날짜 기반 검색
    List<BoardPost> findByCreatedAtBetween(LocalDateTime start, LocalDateTime end);

    // 카테고리별 조회
    List<BoardPost> findByCategory(String category);

    // 제목 또는 내용 검색
    Page<BoardPost> findByPostTitleContainingOrPostContentContaining(
            String titleKeyword,
            String contentKeyword,
            Pageable pageable
    );
}
