package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardLike;
import com.smu.householdaccount.entity.BoardPost;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BoardLikeRepository extends JpaRepository<BoardLike, Long> {

    Optional<BoardLike> findByPost_IdAndMember_MemberId(Long postId, String memberId);

    long countByPost_Id(Long postId);

//    List<BoardPost> findLikedPostsByMemberId(String );
}
