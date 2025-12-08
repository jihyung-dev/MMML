package com.smu.householdaccount.repository.account;

import com.smu.householdaccount.entity.account.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, String> {
    // category_id가 PK(VARCHAR)라면 기본 제공 메서드로 충분

    // ID가 특정 prefix로 시작하는 카테고리만 조회
    List<Category> findByCategoryIdStartingWith(String prefix); //StartingWith ⇒ LIKE 'H%'
}

