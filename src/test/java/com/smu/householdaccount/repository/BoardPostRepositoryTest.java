package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardPost;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class BoardPostRepositoryTest {
    @Autowired
    BoardPostRepository boardPostRepository;

    @Test
    void findAll() throws Exception {
        List<BoardPost> boardPosts = boardPostRepository.findAll();
        System.out.println(boardPosts);
    }
}