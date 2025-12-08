package com.smu.householdaccount.service.hotdeal;

import com.smu.householdaccount.dto.item.ItemResponseDto;
import com.smu.householdaccount.entity.account.Category;
import com.smu.householdaccount.entity.hotdeal.HotdealOption;
import com.smu.householdaccount.entity.hotdeal.Item;
import com.smu.householdaccount.entity.hotdeal.ItemDetailImage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface ItemService {

    Item findById(Long id);

    Page<Item> searchItems(Long sellerId,
                           String categoryId,
                           String keyword,
                           BigDecimal minPrice,
                           BigDecimal maxPrice,
                           String saleStatus,
                           LocalDateTime activeOn,
                           Pageable pageable);

//    필요없으면 삭제할 예정
    /*Page<Item> searchHotdeal(Long sellerId,
                           String categoryId,
                           String keyword,
                           BigDecimal minPrice,
                           BigDecimal maxPrice,
                           String saleStatus,
                           LocalDateTime activeOn,
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

    // ★ [New] DTO 변환 메서드 선언 (껍데기)
    Page<ItemResponseDto> convertToDto(Page<Item> itemPage, String memberId);

    // ★ [New] 상세 조회용 DTO 변환 메서드 추가
    ItemResponseDto getItemDetailDto(Long id, String memberId);
}
