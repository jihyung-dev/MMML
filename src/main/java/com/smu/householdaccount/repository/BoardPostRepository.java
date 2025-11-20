package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BoardPost;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardPostRepository extends JpaRepository<BoardPost,Long> {
    @Override
    List<BoardPost> findAll();
}
