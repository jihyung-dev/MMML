package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.service.HotdealService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@AllArgsConstructor
public class HotdealController {

    private final HotdealService hotdealService;

    @GetMapping("/item/list.do")
    public String itemList(
            @PageableDefault(size=20, sort="createdAt", direction = Sort.Direction.DESC) Pageable pageable,
            Model model){
        System.out.println(pageable.getPageNumber());
        System.out.println(pageable.getPageSize());
        System.out.println();

        //Pageable pageable = PageRequest.of(0, 10);
//        Page<Item> itemPage=hotdealService.readItemByCategory("C11",pageable);
        Page<Item> itemsPage = hotdealService.readItems(pageable);
        model.addAttribute("itemPage",itemsPage);
        return "item/list";
    }

}
