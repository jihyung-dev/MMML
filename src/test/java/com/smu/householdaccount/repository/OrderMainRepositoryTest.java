package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.repository.hotdeal.OrderMainRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.UUID;

@SpringBootTest
class OrderMainRepositoryTest {
    @Autowired
    OrderMainRepository orderMainRepository;
    @Transactional
    @Test
    void save() {
        String merchantUid = "order-" + UUID.randomUUID();


        String loginUserId="U034";
        Long totalPrice=100000L;
        OrderMain orderMain = new OrderMain();
        orderMain.setMerchantUid(merchantUid);
        orderMain.setBuyerId(loginUserId);
        orderMain.setTotalAmount(totalPrice);
        orderMain.setUpdatedAt(LocalDateTime.now());
        orderMain.setCreatedAt(LocalDateTime.now());
        orderMain.setOrderStatus("BASKET");
        orderMainRepository.save(orderMain);
    }

    @Test
    void findBySellerId() {
        Pageable pageable= PageRequest.of(0, 10);
        // SELECT * FROM ORDER_MAIN WHERE SELLER_ID = 1;
        Page<OrderMain> orderMainPage=orderMainRepository.findBySellerId(1L,pageable);
       for (OrderMain orderMain : orderMainPage.getContent()){
           System.out.println(orderMain);
       }
    }
}