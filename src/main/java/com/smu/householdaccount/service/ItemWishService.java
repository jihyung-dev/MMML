package com.smu.householdaccount.service;

public interface ItemWishService {

    /*
     * 찜 토글. 기존에 존재하면 삭제(-> false), 없으면 추가(-> true).
     * @return true if now wished, false if now unwished
     */
    boolean toggleWish(Long itemId, String memberId);

    boolean isWished(Long itemId, String memberId);
}
