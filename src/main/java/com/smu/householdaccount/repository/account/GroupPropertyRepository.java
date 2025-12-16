package com.smu.householdaccount.repository.account;

import com.smu.householdaccount.entity.account.BudgetGroup;
import com.smu.householdaccount.entity.account.GroupProperty;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface GroupPropertyRepository extends JpaRepository<GroupProperty, Integer> {
    // [추가] 그룹 객체로 속성 찾기
    Optional<GroupProperty> findByGroup(BudgetGroup group);
}
