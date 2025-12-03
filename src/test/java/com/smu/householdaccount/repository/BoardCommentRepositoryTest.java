package com.smu.householdaccount.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class BoardCommentRepositoryTest {
    @Autowired
    BoardCommentRepository boardCommentRepository;
    @Test
    @Transactional(readOnly = true)
    void findByWriterId() {
        System.out.println(boardCommentRepository.findByWriterId("U009", Pageable.unpaged()));
    }
}