package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BudgetGroup;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BudgetGroupRepository extends JpaRepository<BudgetGroup, Long> {
    Optional<BudgetGroup> findById(Long id);
}
