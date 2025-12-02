package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Category;
import com.smu.householdaccount.entity.HotdealOption;
import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.entity.ItemDetailImage;
import com.smu.householdaccount.repository.HotdealOptionRepository;
import com.smu.householdaccount.repository.ItemDetailImageRepository;
import com.smu.householdaccount.repository.ItemRepository;
import com.smu.householdaccount.repository.ItemWishRepository;
import com.smu.householdaccount.specification.ItemSpecifications;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService {

    private final ItemRepository itemRepository;
    private final HotdealOptionRepository optionRepository;
    private final ItemDetailImageRepository imageRepository;
    private final ItemWishRepository wishRepository;



    /*@Autowired
    public ItemServiceImpl(ItemRepository itemRepository, HotdealOptionRepository optionRepository, ItemDetailImageRepository imageRepository, ItemWishRepository wishRepository) {
        this.itemRepository = itemRepository;
        this.optionRepository = optionRepository;
        this.imageRepository = imageRepository;
        this.wishRepository = wishRepository;
    }*/

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
        Specification<Item> spec = Specification.allOf(
                    ItemSpecifications.hasSellerId(sellerId),
                    ItemSpecifications.hasCategoryId(categoryId),
                    ItemSpecifications.nameContains(keyword),
                    ItemSpecifications.priceBetween(minPrice, maxPrice),
                    ItemSpecifications.hasSaleStatus(saleStatus),
                    ItemSpecifications.activeOn(activeOn)
        );

        Page<Item> page = itemRepository.findAll(spec, pageable);

        // 연관 엔티티 강제 초기화 (LazyInitializationException 방지)
//        page.forEach(item -> {
//            if (item.getSeller() != null) item.getSeller().getId();
//            if (item.getCategory() != null) item.getCategoryId();
//        });

        return page;
    }

//    필요없으면 삭제할 예정
    /*@Override
    public Page<Item> searchHotdeal(Long sellerId, String categoryId, String keyword, BigDecimal minPrice, BigDecimal maxPrice, String saleStatus, LocalDate activeOn, Pageable pageable) {
        return null;
    }*/

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
    public List<Category> findAllCategories() {
        return List.of();
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
        return wishRepository.findByItemIdAndMemberId(itemId, memberId).isPresent();
    }

    @Override
    @Transactional(readOnly = true)
    public long countWishes(Long itemId) {
        return wishRepository.countByItemId(itemId);
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





}