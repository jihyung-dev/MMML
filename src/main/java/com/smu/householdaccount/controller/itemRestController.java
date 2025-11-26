package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.service.ItemService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@RestController
@RequestMapping("/hotdeal/ajax")
public class itemRestController {

    private final ItemService itemService;
    public itemRestController(ItemService itemService) {
        this.itemService = itemService;
    }

    // 검색/목록
    @GetMapping
    public ResponseEntity<Page<Item>> list(
            @RequestParam(required = false) Long sellerId,
            @RequestParam(required = false) String categoryId,
            @RequestParam(required = false) String q,
            @RequestParam(required = false) BigDecimal minPrice,
            @RequestParam(required = false) BigDecimal maxPrice,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date,
            Pageable pageable
    ) {
        Page<Item> page = itemService.searchItems(sellerId, categoryId, q, minPrice, maxPrice, status, date, pageable);
        return ResponseEntity.ok(page);
    }

    // 상세
    @GetMapping("/{id}")
    public ResponseEntity<Item> detail(@PathVariable Long id) {
        Item item = itemService.findByIdForResponse(id);
        return ResponseEntity.ok(item);
    }

    // 조회수 증가 (예: 프론트가 상세페이지 로드 시 호출)
    @PostMapping("/{id}/view")
    public ResponseEntity<Void> increaseView(@PathVariable Long id) {
        itemService.incrementViewCount(id);
        return ResponseEntity.noContent().build();
    }

    // 인기점수 증감 (예시)
    @PostMapping("/{id}/popularity")
    public ResponseEntity<Void> addPopularity(@PathVariable Long id, @RequestParam long delta) {
        itemService.addPopularityScore(id, delta);
        return ResponseEntity.noContent().build();
    }
}

