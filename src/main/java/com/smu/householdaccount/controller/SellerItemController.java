package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.entity.Seller;
import com.smu.householdaccount.repository.HotdealOptionRepository;
import com.smu.householdaccount.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/seller/item")
@RequiredArgsConstructor
public class SellerItemController {

    private final ItemRepository itemRepository;
    private final HotdealOptionRepository hotdealOptionRepository;
    @GetMapping
    public String list(
            Model model,
            @SessionAttribute("sellerUser") Seller sellerUser,
            @PageableDefault(page = 0,size = 10,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<Item> itemPage=itemRepository.findBySellerId(sellerUser.getId(), pageable);
        model.addAttribute("itemPage",itemPage);

        return "seller/items";
    }

    @GetMapping("/{itemId}")
    public String dashboard(
            @PathVariable Long itemId,
            Model model) {
        // 1️⃣ 임의 item_id = 1로 ITEM 조회
        Item item = itemRepository.findWithCategoryWithHotdealOptionsById(itemId)
                .orElseThrow(() -> new RuntimeException("Item not found"));

        // 3️⃣ 뷰에 전달
        model.addAttribute("item", item);

        // 4️⃣ 뷰 파일 경로 (templates/seller/dashboard.html)
        return "seller/item";
    }
}