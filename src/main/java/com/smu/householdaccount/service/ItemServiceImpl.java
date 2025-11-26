package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.repository.ItemRepository;
import com.smu.householdaccount.specification.ItemSpecifications;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Optional;

@Service
public class ItemServiceImpl implements ItemService {

    private final ItemRepository itemRepository;
    @Autowired
    public ItemServiceImpl(ItemRepository itemRepository) {
        this.itemRepository = itemRepository;
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
                                  LocalDate activeOn,
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
        page.forEach(item -> {
            if (item.getSeller() != null) item.getSeller().getId();
            if (item.getCategory() != null) item.getCategoryId();
        });

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
    @Transactional(readOnly = true)
    public Item findByIdForResponse(Long id) {
        Optional<Item> opt = itemRepository.findById(id);
        Item item = opt.orElseThrow(() -> new IllegalArgumentException("Item not found: " + id));
        // 연관 초기화
        if (item.getSeller() != null) item.getSeller().getId();
        if (item.getCategory() != null) item.getCategoryId();
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
}