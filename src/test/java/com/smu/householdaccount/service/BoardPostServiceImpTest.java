package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.repository.MemberRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Transactional
class BoardPostServiceImpTest {
    @Autowired
    BoardPostService boardPostService;
    @Autowired
    MemberRepository memberRepository;

    @Test
    void create() {
        System.out.println(boardPostService.create(40,"U007","자유게시판","감기조심하세요","걸리믄 아프요"));

    }

    @Test
    void findAll() {
        PageRequest pageable = PageRequest.of(0, 10);
        Page<BoardPost> posts;
        posts = boardPostService.findAll(pageable);
        System.out.println(posts);


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