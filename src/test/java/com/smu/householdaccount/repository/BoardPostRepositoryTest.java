package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
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

    @Test
    void findByCreatedAtBetween() {
        List<BoardPost> date=boardPostRepository.findByCreatedAtBetween
                (LocalDate.parse("2025-01-01").atStartOfDay(),LocalDate.parse("2025-01-05").atTime(23,59,59));
        System.out.println(date);

    }


    @Test
    void createBoardPost() {
        Member member=new Member();
        member.setMemberId("U009");
        BoardPost boardPost = new BoardPost();
        boardPost.setId(40);
        boardPost.setCategory("팁게시판");
        boardPost.setPostTitle("알뜰팁");
        boardPost.setPostContent("잠자는 카드 혜택을 가계부로 확인하고 현금 받기");
        boardPost.setWriter(member);
        boardPost.setViewCnt(12L);
        boardPostRepository.save(boardPost);
    }



    @Test
    void deleteById() {
        boardPostRepository.deleteById(40);
    }
}