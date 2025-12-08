package com.smu.householdaccount.repository;

import com.smu.householdaccount.repository.board.BoardCommentRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

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