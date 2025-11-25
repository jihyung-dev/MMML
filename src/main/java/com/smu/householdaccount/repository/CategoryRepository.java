package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, String> {
    // category_id가 PK(VARCHAR)라면 기본 제공 메서드로 충분

}

