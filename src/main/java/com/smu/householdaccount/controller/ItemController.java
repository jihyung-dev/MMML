package com.smu.householdaccount.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;

import com.smu.householdaccount.entity.Category;
import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.repository.CategoryRepository;
import com.smu.householdaccount.service.ItemService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.DecimalFormat;
import java.util.List;

@Controller
@RequestMapping("/hotdeal")
@AllArgsConstructor
@Slf4j
public class ItemController {    // 명시적 생성자 주입 (Lombok 없이 안전)
    private final ItemService itemService;
    private final CategoryRepository categoryRepository;

    /*@GetMapping
    public String list(Model model,@PageableDefault(size = 10,page = 0,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable){
        Page<Item> itemPage=itemService.findByCategory("H01",pageable);
        model.addAttribute("itemPage",itemPage);

        return "hotdeal/list";
    }*/


    // 목록: 검색 파라미터 모두 optional
    @GetMapping
    public String list(
            @RequestParam(required = false) Long sellerId,
            @RequestParam(required = false) String categoryId,
            @RequestParam(required = false) String q,
            @RequestParam(required = false) BigDecimal minPrice,
            @RequestParam(required = false) BigDecimal maxPrice,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date,
            @PageableDefault(page=0, size = 8, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable,
            Model model
    ) {
        Page<Item> itemPage = itemService.searchItems(sellerId, categoryId, q, minPrice, maxPrice, status, date, pageable);
        model.addAttribute("itemPage", itemPage);
        log.info("itemPage.content : {}", itemPage.getContent());

        // 카테고리 목록 조회
        List<Category> categories = categoryRepository.findByCategoryIdStartingWith("H"); // Service에서 DB 조회
        log.info("categories : {}", categories);
        model.addAttribute("categories", categories);

        // 뷰: src/main/resources/templates/hotdeal/list.html (Thymeleaf 등)
        return "item/list";
    }

    // 상세: 상세 페이지 로드 시 서버에서 조회수 증가 후 보여줌
    @GetMapping("/{id}")
    public String detail(
            @PathVariable Long id,
            Model model,
            RedirectAttributes redirectAttrs) {
        // 조회수 증가 (원자적 업데이트)
        itemService.incrementViewCount(id);

        Item item = itemService.findByIdForResponse(id);
        model.addAttribute("item", item);
        return "item/detail";
    }

    // 인기점수 변경: 폼 제출 방식 (예: 관리자 버튼에서 POST 호출)
    @PostMapping("/{id}/popularity")
    public String changePopularity(@PathVariable Long id,
                                   @RequestParam long delta,
                                   RedirectAttributes redirectAttrs) {
        itemService.addPopularityScore(id, delta);
        // 리다이렉트하여 상세 페이지 재조회
        return "redirect:/item/" + id;
    }

}
