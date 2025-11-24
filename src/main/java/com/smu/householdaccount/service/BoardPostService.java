package com.smu.householdaccount.service;


import com.smu.householdaccount.entity.BoardPost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.time.LocalDateTime;
import java.util.List;

public interface BoardPostService {
    //게시판 생성
    BoardPost create(int id, String writerId, String category,String postTitle, String postContent);

    //게시판 전체조회
    Page<BoardPost> findAll(Pageable pageable);

    //게시판 조회 ID로
    BoardPost findById(int id);

    //게시판 글 수정
    BoardPost update(int id, String category, String title, String content);

    //게시판 글 삭제
    void delete(int id);

    //게시판 조회수 조회
    void increaseViewCount(int id);

    //게시판 키워드로 검색기능
    Page<BoardPost> search(String keyword, Pageable pageable);







}
