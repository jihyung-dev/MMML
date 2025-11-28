package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.OrderMain;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
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
}