package com.smu.householdaccount.repository.board;

import com.smu.householdaccount.entity.board.BoardPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BoardPostRepository extends JpaRepository<BoardPost, Long> {

    /** 최신순 전체 조회 */
    Page<BoardPost> findAllByOrderByCreatedAtDesc(Pageable pageable);

    /** 제목 또는 내용 검색 (최신순 정렬) */
    Page<BoardPost> findByPostTitleContainingOrPostContentContainingOrderByCreatedAtDesc(
            String titleKeyword,
            String contentKeyword,
            Pageable pageable
    );

    Page<BoardPost> findByWriterId(String memberId,Pageable pageable);

    Page<BoardPost> findByBoardLikes_MemberId(String memberId,Pageable pageable);
    //List<BoardPost> findByWriterId(String memberId);

    Page<BoardPost> findByCategoryOrderByCreatedAtDesc(String category, Pageable pageable);
}
