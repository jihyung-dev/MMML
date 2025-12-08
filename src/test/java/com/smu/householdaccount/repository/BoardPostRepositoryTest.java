package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardPost;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class BoardPostRepositoryTest {

    @Autowired
    BoardPostRepository boardPostRepository;

    @Test
    void findByBoardLikes_MemberId() {
        Pageable pageable= PageRequest.of(0, 10);
        Page<BoardPost> boardPostPage=boardPostRepository.findByBoardLikes_MemberId("U009",pageable);
        System.out.println(boardPostPage.getContent());
    }

    @Test
    void findByWriterId() {
        Pageable pageable= PageRequest.of(0, 10);
        Page<BoardPost> boardPostPage=boardPostRepository.findByWriterId("U009",pageable);
        System.out.println(boardPostPage.getContent());
    }
}