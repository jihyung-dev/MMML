package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BudgetGroup;
import com.smu.householdaccount.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BudgetGroupRepository extends JpaRepository<BudgetGroup, Long> {
    Optional<BudgetGroup> findById(Long id);

    // 맴버로 그룹 조회
    Optional<BudgetGroup> findByOwner(Member owner);
}
