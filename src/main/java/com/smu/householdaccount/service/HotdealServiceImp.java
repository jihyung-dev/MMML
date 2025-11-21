package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.repository.ItemRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class HotdealServiceImp implements HotdealService{
    //@Autowired
    private final ItemRepository itemRepository;


    @Override
    public Page<Item> readItemByCategory(String category, Pageable pageable) {
        return this.itemRepository.findByCategoryId(category, pageable);
    }

    @Override
    public Page<Item> readItems(Pageable pageable) {
        return this.itemRepository.findAll(pageable);
    }
}
