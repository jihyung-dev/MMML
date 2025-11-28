package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Category;
import com.smu.householdaccount.entity.HotdealOption;
import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.entity.ItemDetailImage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface ItemService {
    Page<Item> searchItems(Long sellerId,
                           String categoryId,
                           String keyword,
                           BigDecimal minPrice,
                           BigDecimal maxPrice,
                           String saleStatus,
                           LocalDate activeOn,
                           Pageable pageable);

//    필요없으면 삭제할 예정
    /*Page<Item> searchHotdeal(Long sellerId,
                           String categoryId,
                           String keyword,
                           BigDecimal minPrice,
                           BigDecimal maxPrice,
                           String saleStatus,
                           LocalDate activeOn,
                           Pageable pageable);*/



    Page<Item> findBySeller(Long sellerId, Pageable pageable);

    Page<Item> findByCategory(String categoryId, Pageable pageable);

    Item findByIdForResponse(Long id); // detail 용, 연관 초기화 포함

    void incrementViewCount(Long id);

    void addPopularityScore(Long id, long delta);

    List<Category> findAllCategories();

    Item getItem(Long itemId); // 상세 페이지에서 사용할 엔티티 (옵션/이미지도 repo 통해 가져옴)

    void increaseViewCount(Long itemId);

    List<HotdealOption> getOptions(Long itemId);

    List<ItemDetailImage> getDetailImages(Long itemId);

    boolean isWishedByMember(Long itemId, String memberId); //특정 회원이 해당상품을 찜했는지 확인

    long countWishes(Long itemId);

    //상품 상세 조회 → 이미지&옵션을 함께 로드하고 조회수 증가
    Optional<Item> getItemDetailAndIncrementView(Long id, String viewerMemberId);




}
