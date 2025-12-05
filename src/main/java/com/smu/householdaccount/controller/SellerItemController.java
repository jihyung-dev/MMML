package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Category;
import com.smu.householdaccount.entity.HotdealOption;
import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.entity.ItemDetailImage;
import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.entity.Seller;
import com.smu.householdaccount.repository.CategoryRepository;
import com.smu.householdaccount.repository.HotdealOptionRepository;
import com.smu.householdaccount.repository.ItemDetailImageRepository;
import com.smu.householdaccount.repository.ItemRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/seller/item")
@RequiredArgsConstructor
public class SellerItemController {

    private final ItemRepository itemRepository;
    private final HotdealOptionRepository hotdealOptionRepository;
    private final CategoryRepository categoryRepository;
    private final ItemDetailImageRepository itemDetailImageRepository;

    /** 판매자 본인이 등록한 상품 목록 */
    @GetMapping
    public String list(
            Model model,
            @SessionAttribute("loginUser") Member loginUser,
            @PageableDefault(page = 0, size = 10, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Seller seller = loginUser.getSeller();
        Page<Item> itemPage = itemRepository.findBySellerId(seller.getId(), pageable);
        model.addAttribute("itemPage", itemPage);

        return "seller/items";
    }

    /** 판매자 상품 상세(대시보드용) */
    @GetMapping("/{itemId}")
    public String dashboard(
            @PathVariable Long itemId,
            Model model) {

        Item item = itemRepository.findWithCategoryWithHotdealOptionsById(itemId)
                .orElseThrow(() -> new RuntimeException("Item not found"));

        model.addAttribute("item", item);

        return "seller/item";
    }

    // =========================================
    // 🔥 판매자 상품 등록 폼 (DTO 없이)
    // =========================================
    @GetMapping("/new")
    public String showCreateForm(
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            Model model
    ) {
        // 로그인 & 판매자 여부 체크
        if (loginUser == null || loginUser.getSeller() == null) {
            // 로그인 안 했거나, 아직 판매자 등록 안 된 경우
            return "redirect:/seller/join";
        }

        // 카테고리 목록 (핫딜: H로 시작)
        List<Category> categories = categoryRepository.findByCategoryIdStartingWith("H");
        model.addAttribute("categories", categories);

        return "seller/item-form";
    }

    // =========================================
    // 🔥 판매자 상품 등록 처리 (DTO 없이 @RequestParam)
    //      - ITEM 1건
    //      - HOTDEAL_OPTION N건
    //      - ITEM_DETAIL_IMAGE N건
    // =========================================
    @PostMapping("/new")
    public String createItem(
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,

            @RequestParam String itemName,
            @RequestParam BigDecimal originalPrice,
            @RequestParam BigDecimal itemSaleprice,
            @RequestParam String categoryId,
            @RequestParam(required = false) String itemImageUrl,

            @RequestParam(required = false)
            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate saleStartDate,

            @RequestParam
            @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate saleEndDate,

            // 🔽 옵션 여러 개
            @RequestParam(required = false) List<String> optionType,
            @RequestParam(required = false) List<String> optionValue,
            @RequestParam(required = false) List<BigDecimal> additionalPrice,
            @RequestParam(required = false) List<Long> stock,

            // 🔽 상세 이미지 여러 개
            @RequestParam(required = false) List<String> detailImageUrl,

            Model model
    ) {
        // 로그인 / 판매자 체크
        if (loginUser == null || loginUser.getSeller() == null) {
            return "redirect:/seller/join";
        }
        Seller seller = loginUser.getSeller();

        // ------------ 간단 검증 ------------
        if (originalPrice.compareTo(itemSaleprice) < 0) {
            model.addAttribute("errorMessage", "정상가는 할인가보다 크거나 같아야 합니다.");

            List<Category> categories = categoryRepository.findByCategoryIdStartingWith("H");
            model.addAttribute("categories", categories);
            model.addAttribute("prevItemName", itemName);
            model.addAttribute("prevOriginalPrice", originalPrice);
            model.addAttribute("prevItemSaleprice", itemSaleprice);
            model.addAttribute("prevCategoryId", categoryId);
            model.addAttribute("prevItemImageUrl", itemImageUrl);
            model.addAttribute("prevSaleStartDate", saleStartDate);
            model.addAttribute("prevSaleEndDate", saleEndDate);

            return "seller/item-form";
        }

        LocalDateTime saleStartAt = null;
        if (saleStartDate != null) {
            saleStartAt = saleStartDate.atStartOfDay();
        }
        LocalDateTime saleEndAt = saleEndDate.atStartOfDay();

        if (saleStartAt != null && saleStartAt.isAfter(saleEndAt)) {
            model.addAttribute("errorMessage", "판매 시작일은 종료일보다 이후일 수 없습니다.");

            List<Category> categories = categoryRepository.findByCategoryIdStartingWith("H");
            model.addAttribute("categories", categories);
            model.addAttribute("prevItemName", itemName);
            model.addAttribute("prevOriginalPrice", originalPrice);
            model.addAttribute("prevItemSaleprice", itemSaleprice);
            model.addAttribute("prevCategoryId", categoryId);
            model.addAttribute("prevItemImageUrl", itemImageUrl);
            model.addAttribute("prevSaleStartDate", saleStartDate);
            model.addAttribute("prevSaleEndDate", saleEndDate);

            return "seller/item-form";
        }

        // ✅ 여기 추가: category 엔티티 조회해서 세팅
        Category category = categoryRepository.findById(categoryId)
                .orElseThrow(() -> new RuntimeException("존재하지 않는 카테고리입니다."));

        // ------------ ITEM 저장 ------------
        Item item = new Item();
        item.setSellerId(seller.getId());
        item.setItemName(itemName);
        item.setOriginalPrice(originalPrice);
        item.setItemSaleprice(itemSaleprice);
        item.setCategoryId(categoryId);   // FK 값
        item.setCategory(category);       // ✅ 연관 엔티티도 함께 세팅
        item.setItemImageUrl(itemImageUrl);
        item.setSaleStartAt(saleStartAt);
        item.setSaleEndAt(saleEndAt);
        item.setSaleStatus("ON_SALE");

        itemRepository.save(item);

        // ------------ 옵션 여러 개 저장 ------------
        if (optionType != null && optionValue != null) {
            for (int i = 0; i < optionType.size(); i++) {
                String type = optionType.get(i);
                String value = optionValue.get(i);

                if (type == null || type.isBlank() || value == null || value.isBlank()) {
                    continue;
                }

                BigDecimal addPrice =
                        (additionalPrice != null && additionalPrice.size() > i && additionalPrice.get(i) != null)
                                ? additionalPrice.get(i)
                                : BigDecimal.ZERO;

                Long stk =
                        (stock != null && stock.size() > i && stock.get(i) != null)
                                ? stock.get(i)
                                : 0L;

                HotdealOption opt = new HotdealOption();
                opt.setItemId(item.getId());
                opt.setOptionType(type);
                opt.setOptionValue(value);
                opt.setAdditionalPrice(addPrice);
                opt.setStock(stk);

                hotdealOptionRepository.save(opt);
            }
        }

        // ------------ 상세 이미지 여러 장 저장 ------------
        if (detailImageUrl != null) {
            int order = 1;
            for (String url : detailImageUrl) {
                if (url == null || url.isBlank()) continue;

                ItemDetailImage img = new ItemDetailImage();
                img.setItem(item);
                img.setImageUrl(url);
                img.setDisplayOrder((long) order++);

                itemDetailImageRepository.save(img);
            }
        }

        return "redirect:/seller/item";
    }


}
