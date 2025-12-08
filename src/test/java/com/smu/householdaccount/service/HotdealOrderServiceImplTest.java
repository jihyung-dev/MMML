package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.service.hotdeal.HotdealOrderService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class HotdealOrderServiceImplTest {
    @Autowired
    private HotdealOrderService hotdealOrderService;

    @Test
    void getBuyerDefaultInfo() {
        String memberId = "U029";
        Member result = hotdealOrderService.getBuyerDefaultInfo(memberId);

        assertNotNull(result);
        assertEquals(memberId, result.getMemberId());

        System.out.println("회원 이름: " + result.getMemberName());
        System.out.println("주소: " + result.getAddress());
        System.out.println("전화번호: " + result.getPhone());

    }

    @Test
    void createBasket() {

    }
}