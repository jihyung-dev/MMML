package com.smu.householdaccount.repository;

import com.smu.householdaccount.dto.ledger.CategoryStatsDto;
import com.smu.householdaccount.entity.BudgetGroup;
import com.smu.householdaccount.entity.LedgerEntry;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate
    );

    @Query(value = """
        SELECT 
            m.gender AS gender,
            FLOOR(m.age / 10) * 10 AS ageGroup,
            c.category_name AS category,
            SUM(l.entry_amount) AS total,
            AVG(l.entry_amount) AS avgAmount,
            COUNT(*) AS txnCount
        FROM LEDGER_ENTRY l
        JOIN MEMBER m ON l.member_id = m.member_id
        JOIN CATEGORY c ON l.category_id = c.category_id
        WHERE l.entry_type = 'EXPENSE'
        GROUP BY m.gender, ageGroup, c.category_name
        """,
            nativeQuery = true)
    List<CategoryStatsDto> getCategoryStats();
}
