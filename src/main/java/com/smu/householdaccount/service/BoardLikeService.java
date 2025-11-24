package com.smu.householdaccount.service;

public interface BoardLikeService {

    // 좋아요 추가
    void like(Long likeId, int postId, String memberId);

    // 좋아요 취소
    void unlike(int postId, String memberId);

    // 이미 좋아요를 눌렀는지 확인
    boolean isLiked(int postId, String memberId);

    // 게시글 좋아요 총 개수 조회
    long countLikes(int postId);
}

