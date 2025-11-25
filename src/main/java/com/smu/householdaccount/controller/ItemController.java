package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.service.ItemService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hotdeal")
@AllArgsConstructor
public class ItemController {
    private final ItemService itemService;
    @GetMapping
    public String list(Model model,@PageableDefault(size = 10,page = 0,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable){
        Page<Item> itemPage=itemService.findByCategory("H01",pageable);
        model.addAttribute("itemPage",itemPage);

        return "hotdeal/list";
    }
}
