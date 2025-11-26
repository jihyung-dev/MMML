package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.Item;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class ItemRepositoryTest {
    @Autowired
    ItemRepository itemRepository;
    @Test
    @Transactional(readOnly = true)
    void findAllById() {
        List<Item> items=itemRepository.findAllById(List.of(1L,2L));
//        System.out.println(items);
        for(Item item:items){
            System.out.println(item);
            System.out.println(item.getHotdealOptions());
        }

    }@Test
    @Transactional(readOnly = true)
    void findById() {
        Optional<Item> itemOpt=itemRepository.findById(3L);
//        System.out.println(items);
        System.out.println(itemOpt.get());
        System.out.println(itemOpt.get().getHotdealOptions());
    }
}