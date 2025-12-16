package com.smu.householdaccount.service.hotdeal;

import java.util.List;
import java.util.Map;

public interface ItemWishService {

    /*
     * 찜 토글. 기존에 존재하면 삭제(-> false), 없으면 추가(-> true).
     * @return true if now wished, false if now unwished
     */
    boolean toggleWish(Long itemId, String memberId);

    boolean isWished(Long itemId, String memberId);

    // ▼▼▼ [추가] 메인화면 미리보기용 (Top 3) 메서드 정의 ▼▼▼
    List<Map<String, Object>> getTop3WishList(String memberId);
}
