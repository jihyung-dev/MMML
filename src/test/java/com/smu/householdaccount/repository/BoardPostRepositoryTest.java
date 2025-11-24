package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.entity.Member;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Transactional
class BoardPostRepositoryTest {
    @Autowired
    BoardPostRepository boardPostRepository;

}