package com.smu.householdaccount.repository.board;

import com.smu.householdaccount.entity.board.BoardLike;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BoardLikeRepository extends JpaRepository<BoardLike, Long> {

    Optional<BoardLike> findByPost_IdAndMember_MemberId(Long postId, String memberId);

    long countByPost_Id(Long postId);

//    List<BoardPost> findLikedPostsByMemberId(String );
}
