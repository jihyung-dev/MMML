package com.smu.householdaccount.repository;

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
    @Query(value = "SELECT " +
            "  DATE_FORMAT(le.OCCURRED_AT, '%Y-%m-%d') AS summaryDate, " +
            "  le.ENTRY_TYPE AS entryType, " +
            "  SUM(le.ENTRY_AMOUNT) AS totalAmount " +
            "FROM MMML.LEDGER_ENTRY le " +
            "WHERE le.GROUP_ID = :groupId " +
            "  AND le.OCCURRED_AT BETWEEN :startDate AND :endDate " +
            "GROUP BY DATE_FORMAT(le.OCCURRED_AT, '%Y-%m-%d'), le.OCCURRED_AT, le.ENTRY_TYPE",
            nativeQuery = true)
    List<Object[]> findDailyStatsRaw(@Param("groupId") Long groupId,
                                     @Param("startDate") LocalDateTime startDate,
                                     @Param("endDate") LocalDateTime endDate);
}
