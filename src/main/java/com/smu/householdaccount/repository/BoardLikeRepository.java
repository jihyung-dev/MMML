package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardLike;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BoardLikeRepository extends JpaRepository<BoardLike, Long> {

    // 회원이 특정 게시글에 좋아요 했는지 확인
    Optional<BoardLike> findByPost_IdAndMember_MemberId(int postId, String memberId);

    // 특정 게시글의 좋아요 개수 조회
    Long countByPost_Id(int postId);
}
