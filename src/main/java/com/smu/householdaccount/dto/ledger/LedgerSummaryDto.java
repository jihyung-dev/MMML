package com.smu.householdaccount.dto.ledger;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
public class LedgerSummaryDto {
    private BigDecimal totalExpense; // 총 금액
    private BigDecimal totalIncome; // 총 수익
    private List<CategorySummary> categories; // 카테고리 별 내역
    private List<DailySummary> daily; // 일 별 내역

    @Data @Builder
    public static class CategorySummary {
        private String categoryName;
        private BigDecimal amount;
    }

    @Data @Builder
    public static class DailySummary {
        private LocalDateTime date;
        private BigDecimal expense;
        private BigDecimal income;

        // [추가] 건수 정보
        private Long expenseCount; // 지출 건수
        private Long incomeCount;  // 수입 건수
    }
}
