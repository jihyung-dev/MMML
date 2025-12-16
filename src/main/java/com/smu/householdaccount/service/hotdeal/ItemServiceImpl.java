package com.smu.householdaccount.service.hotdeal;

import com.smu.householdaccount.dto.item.ItemResponseDto;
import com.smu.householdaccount.entity.account.Category;
import com.smu.householdaccount.entity.hotdeal.HotdealOption;
import com.smu.householdaccount.entity.hotdeal.Item;
import com.smu.householdaccount.entity.hotdeal.ItemDetailImage;
import com.smu.householdaccount.repository.hotdeal.HotdealOptionRepository;
import com.smu.householdaccount.repository.hotdeal.ItemDetailImageRepository;
import com.smu.householdaccount.repository.hotdeal.ItemRepository;
import com.smu.householdaccount.repository.hotdeal.ItemWishRepository;
import com.smu.householdaccount.specification.ItemSpecifications;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService {

    private final ItemRepository itemRepository;
    private final HotdealOptionRepository optionRepository;
    private final ItemDetailImageRepository imageRepository;

    private final ItemWishRepository itemWishRepository; // ★ [필수] 주입


    @Override
    public Item findById(Long id) {
        return itemRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("상품을 찾을 수 없습니다. id=" + id));
    }

    /**
     * 동적 검색 (Specification 을 사용)
     * 반환되는 Page<Item>의 각 Item은 service 내부에서 연관 객체를 미리 초기화함.
     */
    @Override
    @Transactional(readOnly = true)
    public Page<Item> searchItems(Long sellerId,
                                  String categoryId,
                                  String keyword,
                                  BigDecimal minPrice,
                                  BigDecimal maxPrice,
                                  String saleStatus,
                                  LocalDateTime activeOn,
                                  Pageable pageable
    ){
        /*Specification<Item> spec = Specification.allOf(
                    ItemSpecifications.hasSellerId(sellerId),
                    ItemSpecifications.hasCategoryId(categoryId),
                    ItemSpecifications.nameContains(keyword),
                    ItemSpecifications.priceBetween(minPrice, maxPrice),
                    ItemSpecifications.hasSaleStatus(saleStatus),
                    ItemSpecifications.activeOn(activeOn)
        );*/
        // 1. 각 조건별 Specification을 호출하여 null이 아닌 조건만 List에 수집합니다.
        List<Specification<Item>> spec = new ArrayList<>();

        // ItemSpecifications의 각 메서드는 조건이 없으면 null을 반환합니다.
        // Optional.ofNullable을 사용하여 null이 아닌 경우에만 리스트에 추가합니다.
        Optional.ofNullable(ItemSpecifications.hasSellerId(sellerId)).ifPresent(spec::add);
        Optional.ofNullable(ItemSpecifications.hasCategoryId(categoryId)).ifPresent(spec::add);
        Optional.ofNullable(ItemSpecifications.nameContains(keyword)).ifPresent(spec::add);
        Optional.ofNullable(ItemSpecifications.priceBetween(minPrice, maxPrice)).ifPresent(spec::add);
        Optional.ofNullable(ItemSpecifications.hasSaleStatus(saleStatus)).ifPresent(spec::add);
        Optional.ofNullable(ItemSpecifications.activeOn(activeOn)).ifPresent(spec::add);

        // 2. Specification.allOf(List)를 사용하여 수집된 모든 조건을 안전하게 AND로 조합합니다.
        //    (List가 비어있으면 전체를 반환하는 안전한 방식입니다.)
        Specification<Item> finalSpec = Specification.allOf(spec);

        Page<Item> page = itemRepository.findAll(finalSpec, pageable);

        // 연관 엔티티 강제 초기화 (LazyInitializationException 방지)
//        page.forEach(item -> {
//            if (item.getSeller() != null) item.getSeller().getId();
//            if (item.getCategory() != null) item.getCategoryId();
//        });

        return page;
    }


    @Override
    @Transactional(readOnly = true)
    public Page<Item> findBySeller(Long sellerId, Pageable pageable) {
        Page<Item> page = itemRepository.findBySeller_Id(sellerId, pageable);
        page.forEach(item -> {
            if (item.getSeller() != null) item.getSeller().getId();
            if (item.getCategory() != null) item.getCategoryId();
        });
        return page;
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Item> findByCategory(String categoryId, Pageable pageable) {
        Page<Item> page = itemRepository.findByCategoryId(categoryId, pageable);
        page.forEach(item -> {
            if (item.getSeller() != null) item.getSeller().getId();
            if (item.getCategory() != null) item.getCategoryId();
        });
        return page;
    }

    @Override
    public List<Category> findAllCategories() {
        // 현재 ItemServiceImpl에는 CategoryRepository 주입이 명시되어 있지 않아 빈 리스트를 반환합니다.
        // List<Category> categories = categoryRepository.findAll();
        // return categories;
        return List.of();
    }

    @Override
    @Transactional(readOnly = true)
    public Item findByIdForResponse(Long id) {
        Optional<Item> opt = itemRepository.findById(id);
        Item item = opt.orElseThrow(() -> new IllegalArgumentException("Item not found: " + id));
//        // 연관 초기화
//        if (item.getSeller() != null) item.getSeller().getId();
//        if (item.getCategory() != null) item.getCategoryId();
        return item;
    }

    @Override
    @Transactional
    public void incrementViewCount(Long id) {
        itemRepository.incrementViewCount(id);
    }

    @Override
    @Transactional
    public void addPopularityScore(Long id, long delta) {
        itemRepository.addPopularityScore(id, delta);
    }


    @Override
    @Transactional(readOnly = true)
    public Item getItem(Long itemId) {
        return itemRepository.findById(itemId)
                .orElseThrow(() -> new EntityNotFoundException("Item not found id=" + itemId));
    }

    @Override
    public void increaseViewCount(Long itemId) {
        // 단순한 방법: 엔티티 읽고 저장
        itemRepository.findById(itemId).ifPresent(item -> {
            item.setViewCount(item.getViewCount() + 1);
            itemRepository.save(item);
        });
        // 또는 @Modifying 쿼리로 한 줄 업데이트(SQL)로 처리해도 됨(동시성 고려)
    }

    @Override
    @Transactional(readOnly = true)
    public List<HotdealOption> getOptions(Long itemId) {
        return optionRepository.findByItemId(itemId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<ItemDetailImage> getDetailImages(Long itemId) {
        return imageRepository.findByItemIdOrderByDisplayOrderAsc(itemId);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean isWishedByMember(Long itemId, String memberId) {
        if (memberId == null) return false;
        return itemWishRepository.findByItemIdAndMemberId(itemId, memberId).isPresent();
    }

    @Override
    @Transactional(readOnly = true)
    public long countWishes(Long itemId) {
        return itemWishRepository.countByItemId(itemId);
    }


    @Override
    @Transactional
    public Optional<Item> getItemDetailAndIncrementView(Long id, String viewerMemberId) {
        // 1) 조회수 원자적 증가 (리포지토리 메서드)
        try {
            itemRepository.incrementViewCount(id);
        } catch (Exception ex) {
            // 조회수 업데이트 실패해도 상세 조회는 시도하도록 로그만 남길 것
            //log.warn("incrementViewCount failed for id={}", id, ex);
        }
        // 2) 이미지, 옵션 같이 가져오는 메서드 사용
        return itemRepository.findWithImagesAndOptionsById(id);
    }

    // ★ [핵심] 빨간 줄 해결된 코드
    @Override
    @Transactional(readOnly = true)
    public Page<ItemResponseDto> convertToDto(Page<Item> itemPage, String memberId) {
        // 위 괄호 안에 'String memberId'가 있어서 아래에서 사용할 수 있습니다.
        return itemPage.map(item -> {
            boolean isLiked = false;

            // memberId가 null이 아니면 찜 여부 확인
            if (memberId != null) {
                isLiked = itemWishRepository.existsByItemIdAndMemberId(item.getId(), memberId);
            }

            return new ItemResponseDto(item, isLiked);
        });
    }
    @Override
    @Transactional
    public ItemResponseDto getItemDetailDto(Long id, String memberId) {
        // 1. 조회수 증가
        incrementViewCount(id);

        // 2. 아이템 조회 (없으면 예외 발생)
        Item item = itemRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Item not found: " + id));

        // 3. 찜 여부 확인
        /*boolean isLiked = false;
        if (memberId != null) {
            isLiked = itemWishRepository.existsByItemIdAndMemberId(id, memberId);
        }*/
        boolean isLiked = (memberId != null) && itemWishRepository.existsByItemIdAndMemberId(id, memberId);

        // 4. DTO 반환
        return new ItemResponseDto(item, isLiked);

    }



    @Override
    @Transactional
    public Item createItem(Item item, List<MultipartFile> detailImageFiles) {

        // 1. 상세 이미지 목록 초기화
        List<ItemDetailImage> newDetailImages = new ArrayList<>();

        // 2. 이미지 파일 처리 및 ItemDetailImage Entity 생성
        for (long i = 0; i < detailImageFiles.size(); i++) {
            MultipartFile file = detailImageFiles.get((int) i);

            // 파일 유효성 검사 및 업로드
            if (!file.isEmpty()) {
                // **TODO: 실제 파일 업로드 로직 (예: S3 업로드)**
                // String imageUrl = fileStorageService.upload(file);
                // 지금은 임시 URL을 사용합니다.
                String imageUrl = "https://cdn.hotdeal.com/item/" + item.getItemName() + "_" + (i + 1) + ".jpg";

                ItemDetailImage detailImage = new ItemDetailImage();
                detailImage.setImageUrl(imageUrl);
                detailImage.setDisplayOrder(i + 1);

                // 3. Item과의 양방향 관계 설정 (가장 중요)
                item.addDetailImage(detailImage);
            }
        }

        // 4. Item Entity 저장
        // ItemDetailImage는 Item Entity의 CascadeType.ALL에 의해 함께 저장됩니다.
        return itemRepository.save(item);
    }
}