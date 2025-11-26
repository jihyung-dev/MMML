package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.BudgetGroup;
import com.smu.householdaccount.entity.LedgerEntry;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface LedgerRepository extends JpaRepository<LedgerEntry, Long> {

    // group_id로 조회
    List<LedgerEntry> findByGroupId(BudgetGroup groupId);

    // group_id와 구간 설정으로 조회
    @Query("""
    SELECT l
    FROM LedgerEntry l
    WHERE l.occurredAt BETWEEN :startDate AND :endDate
      AND l.groupId = :group
""")
    List<LedgerEntry> findByGroupAndDateRange(
            @Param("group") BudgetGroup group,
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );
}
