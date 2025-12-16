package com.smu.householdaccount.repository.board;

import com.smu.householdaccount.entity.board.BoardPost;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Transactional
class BoardPostRepositoryTest {
    @Autowired
    BoardPostRepository boardPostRepository;

    @Test
    void findByPostTitleContainingOrPostContentContainingOrderByCreatedAtDesc() {
        Page<BoardPost> gg=boardPostRepository.findByPostTitleContainingOrPostContentContainingOrderByCreatedAtDesc("신선","신선", Pageable.unpaged());
        System.out.println(gg.getTotalPages());
    }
}