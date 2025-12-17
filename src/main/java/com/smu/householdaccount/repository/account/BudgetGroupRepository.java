package com.smu.householdaccount.repository.account;

import com.smu.householdaccount.entity.account.BudgetGroup;
import com.smu.householdaccount.entity.common.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BudgetGroupRepository extends JpaRepository<BudgetGroup, Long> {
    Optional<BudgetGroup> findById(Long id);

    // 맴버로 그룹 조회
//    Optional<BudgetGroup> findByOwner(Member owner);

    List<BudgetGroup> findByOwner(Member owner);

    List<BudgetGroup> findAllByOwner(Member owner);

    // [추가] 소유자로 그룹 찾기 (가장 먼저 만들어진 1개 - 보통 개인 가계부)
    Optional<BudgetGroup> findFirstByOwnerOrderByCreatedAtAsc(Member owner);
}
