package com.smu.householdaccount.repository.account;

import com.smu.householdaccount.dto.ledger.CategoryStatsDto;
import com.smu.householdaccount.dto.ledger.CategorySumDto;
import com.smu.householdaccount.dto.ledger.DailySumDto;
import com.smu.householdaccount.entity.account.BudgetGroup;
import com.smu.householdaccount.entity.account.LedgerEntry;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

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
      AND l.occurred_at >= :start
      AND l.occurred_at <  :end
    GROUP BY m.gender, ageGroup, c.category_name
""", nativeQuery = true)
    List<CategoryStatsDto> getCategoryStats(
            @Param("start") LocalDateTime start,
            @Param("end") LocalDateTime end
    );

    // ==========================================
    // [New] 대시보드(차트/캘린더) 전용 최적화 쿼리
    // ==========================================

    // 1. 카테고리별 합계
    @Query("""
        SELECT c.categoryName AS categoryName, SUM(l.entryAmount) AS totalAmount
        FROM LedgerEntry l
        JOIN l.category c
        WHERE l.groupId = :group
          AND l.entryType = 'EXPENSE'
          AND l.occurredAt BETWEEN :startDate AND :endDate
        GROUP BY c.categoryName
    """)
    List<CategorySumDto> findCategorySumNew(
            @Param("group") BudgetGroup group,
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate
    );

    // 2. 일별 합계 및 건수 조회 [수정됨]
    @Query("""
        SELECT 
            CAST(l.occurredAt AS LocalDate) AS date, 
            l.entryType AS entryType, 
            SUM(l.entryAmount) AS totalAmount,
            COUNT(l) AS txnCount  /* [★ 여기 추가 ★] 콤마(,) 잊지 마세요! */
        FROM LedgerEntry l
        WHERE l.groupId = :group
          AND l.occurredAt BETWEEN :startDate AND :endDate
        GROUP BY CAST(l.occurredAt AS LocalDate), l.entryType
    """)
    List<DailySumDto> findDailySumNew(
            @Param("group") BudgetGroup group,
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate
    );

    @Modifying
    @Transactional
    @Query(value = """
        INSERT INTO LEDGER_ENTRY
        (group_id, member_id, entry_type, pay_type, card_type,
         category_id, entry_amount, occurred_at, place_of_use, memo)
        VALUES (:groupId, :memberId, :entryType, :payType, :cardType,
                :categoryId, :entryAmount, :occurredAt, :placeOfUse, :memo)
        """, nativeQuery = true)
    void insertLedgerEntry(
            @Param("groupId") Long groupId,
            @Param("memberId") String memberId,
            @Param("entryType") String entryType,
            @Param("payType") String payType,
            @Param("cardType") String cardType,
            @Param("categoryId") String categoryId,
            @Param("entryAmount") BigDecimal entryAmount,
            @Param("occurredAt") LocalDate occurredAt,
            @Param("placeOfUse") String placeOfUse,
            @Param("memo") String memo
    );

    @Query(value = """
        SELECT DISTINCT le.group_id
        FROM LEDGER_ENTRY le
        JOIN GROUP_PROPERTY gp
          ON le.group_id = gp.group_id
        WHERE le.member_id = :memberId
          AND gp.group_type = 'P';
""", nativeQuery = true)
    Optional<Long> findGroupIdByMemberId(@Param("memberId") String memberId);

    @Query(value = "SELECT MAX(group_id) FROM LEDGER_ENTRY", nativeQuery = true)
    Long findMaxGroupId();

    // [추가] 그룹에 해당하는 모든 내역 삭제
    void deleteByGroupId(BudgetGroup group);

}
