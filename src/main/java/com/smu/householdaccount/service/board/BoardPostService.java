package com.smu.householdaccount.service.board;

import com.smu.householdaccount.entity.board.BoardPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface BoardPostService {

    /** 게시글 생성 (작성자 자동 처리) */
    BoardPost create(String category, String title, String content, String loginUserId);

    /** 게시글 전체 조회 */
    Page<BoardPost> findAll(Pageable pageable);

    /** 게시글 상세 조회 */
    BoardPost findById(Long id);

    /** 게시글 수정 (작성자 본인 여부 검사 포함) */
    BoardPost update(Long id, String category, String title, String content, String loginUserId);

    /** 게시글 삭제 (작성자 본인만 가능) */
    void delete(Long id, String loginUserId);

    /** 조회수 증가 */
    void increaseViewCount(Long id);

    /** 검색 기능 */
    Page<BoardPost> search(String keyword, Pageable pageable);
}
