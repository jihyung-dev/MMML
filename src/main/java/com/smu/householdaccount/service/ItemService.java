package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Category;
import com.smu.householdaccount.entity.Item;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

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
}
