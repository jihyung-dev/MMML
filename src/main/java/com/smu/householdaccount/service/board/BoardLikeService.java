package com.smu.householdaccount.service.board;

public interface BoardLikeService {

    /** 좋아요 추가 (중복 체크, 자동 memberId) */
    void like(Long postId, String loginUserId);

    /** 좋아요 취소 */
    void unlike(Long postId, String loginUserId);

    /** 특정 글을 로그인한 유저가 좋아요 눌렀는지 확인 */
    boolean isLiked(Long postId, String loginUserId);

    /** 좋아요 수 조회 */
    long countLikes(Long postId);

    /** ✅ 좋아요 토글 (true: 좋아요 상태, false: 좋아요 해제 상태) */
    boolean toggleLike(Long postId, String loginUserId); // <-- 추가

}
