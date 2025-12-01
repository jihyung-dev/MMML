package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.entity.Seller;
import com.smu.householdaccount.repository.ItemRepository;
import com.smu.householdaccount.repository.SellerRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class SellerServiceImpTest {

    @Autowired
    private SellerServiceImp sellerServiceImp;

    @Autowired
    private SellerRepository sellerRepository;

    @Autowired
    private ItemRepository itemRepository;

    @Test
    void getItemBySeller() {
        // 1️⃣ 테스트용 판매자 가져오기

        // 2️⃣ 페이징 설정 (0페이지, 10개씩)
        PageRequest pageable = PageRequest.of(0, 10);

        // 3️⃣ 서비스 호출
        Page<Item> itemsPage = sellerServiceImp.getItemBySeller(1L, pageable);

        // 4️⃣ 검증
        assertNotNull(itemsPage, "페이지 객체는 null이 아니어야 합니다.");
        assertTrue(itemsPage.hasContent(), "판매자가 등록한 Item이 존재해야 합니다.");

        // 5️⃣ 조회된 Item 출력
        itemsPage.getContent().forEach(item -> {
            System.out.println(item);
            System.out.println(item.getHotdealOptions());
        });
    }
}