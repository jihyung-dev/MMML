package com.smu.householdaccount.dto.ledger;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * 분류 하여 전체 데이터 저장 Dto
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryStatDto {
    private BigDecimal avg;
    private BigDecimal sum;
    private int count;  // 거래 횟수 (선택)
}
