package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Seller;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class MemberServiceImpTest {
    @Autowired
    private MemberService memberService;
    @Test
    void bcrypt() {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        System.out.println(passwordEncoder.encode("1234"));

        System.out.println(passwordEncoder.matches("1234", "$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a"));
    }

    @Test
    void registerUser() {
    }

    @Test
    void loginUser() {
        System.out.println(memberService.login("U067", "1234"));
        System.out.println(memberService.login("U067", "12341"));
    }

    @Test
    void sellerLogin() {
        String sellerId = "U006";
        String password = "1234";
        String bizNo = "123-01-00006";
        Seller seller = memberService.sellerLogin(sellerId, password, bizNo);
        System.out.println(seller);

    }
}