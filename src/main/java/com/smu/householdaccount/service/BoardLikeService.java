package com.smu.householdaccount.service;

public interface BoardLikeService {

    void like(Long postId, String memberId);

    void unlike(Long postId, String memberId);

    boolean isLiked(Long postId, String memberId);

    long countLikes(Long postId);
}
