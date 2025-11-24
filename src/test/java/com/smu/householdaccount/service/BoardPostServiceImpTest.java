package com.smu.householdaccount.service;

import com.smu.householdaccount.repository.MemberRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@Transactional
class BoardPostServiceImpTest {
    @Autowired
    BoardPostService boardPostService;
    @Autowired
    MemberRepository memberRepository;

    @Test
    void create() {


    }

    @Test
    void findAll() {

    }

    @Test
    void findById() {
    }

    @Test
    void update() {
    }

    @Test
    void delete() {
    }

    @Test
    void increaseViewCount() {
    }

    @Test
    void search() {
    }
}