package com.smu.householdaccount.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class BizRepositoryTest {
    @Autowired
    private SellerRepository sellerRepository;
    @Test
    void findAll(){
        System.out.println(sellerRepository.findAll());
    }
}