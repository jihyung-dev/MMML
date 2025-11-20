package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;

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
    @Transactional
    @Test
    void testFindAll() {
        Pageable pageable= PageRequest.of(0,10, Sort.by("id").descending());
        Page<BoardPost> boardPosts = boardPostRepository.findAll(pageable);
        for(BoardPost boardPost:boardPosts.getContent()){
            System.out.println(boardPost);
            Member writer=boardPost.getWriter();
            System.out.println(writer);
        }
    }
}