package com.smu.householdaccount.repository;


import com.smu.householdaccount.entity.BoardPost;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface BoardPostRepository extends JpaRepository<BoardPost,Integer> {
    //게시판 전체 조회(BOARD_POST 테이블)
    @Override
    List<BoardPost> findAll();

    //게시판 날짜 조회(BOARD_POST 테이블)
    List<BoardPost> findByCreatedAtBetween(LocalDateTime start, LocalDateTime end);


    //게시판 생성(BOARD_POST 테이블)
    BoardPost save(BoardPost boardPost);

    //게시판 삭제(BOARD_POST 테이블)
    BoardPost deleteById(int id);



}


