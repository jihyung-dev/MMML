package com.smu.householdaccount.dto.ledger;

import lombok.Builder;
import lombok.Data;

/**
 * 월 별 카테고리 평균 Dto
 */
@Data
@Builder
public class MonthlyLedgerDto {
    private String month;
    private LedgerSummaryDto summary;
}
