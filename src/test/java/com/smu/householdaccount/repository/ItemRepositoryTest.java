package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.Category;
import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.entity.Seller;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.math.BigDecimal;
import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class ItemRepositoryTest {
    @Autowired
    private ItemRepository itemRepository;

    @Test
    void findAll() {
        Pageable pageable = PageRequest.of(0, 10, Sort.by("createdAt").descending());
        Page<Item> itemPage = itemRepository.findAll(pageable);
        System.out.println(itemPage.getContent());
    }
    @Test
    void save(){
        Item item = new Item();
        item.setItemName("테스트키보드");
        item.setItemPrice(BigDecimal.valueOf(99.99));
        item.setItemStock(22L);
        item.setSaleStartAt(LocalDate.now());
        item.setSaleEndAt(LocalDate.now());
//        item.setSaleStatus("");
//        Seller seller = new Seller();
//        seller.setBizNo("123-01-00006");
//        item.setSeller(seller);
//        Category category = new Category();
//        category.setCategoryId("C11");
//        item.setCategory(category);
        item.setSellerBizNo("123-01-00006");
        item.setCategoryId("C11");
        itemRepository.save(item);

    }

    @Test
    void findByCategoryId() {
        Pageable pageable= PageRequest.of(0, 10, Sort.by("createdAt").descending());
        Page<Item> itemPage = itemRepository.findByCategoryId("C11", pageable);
        System.out.println(itemPage.getContent());
    }
}