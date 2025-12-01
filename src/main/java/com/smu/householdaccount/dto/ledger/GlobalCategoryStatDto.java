package com.smu.householdaccount.dto.ledger;

import java.math.BigDecimal;

/**
 * 분류 없이 전체 데이터 호출 Dto
 */
public record GlobalCategoryStatDto(
        String category,
        BigDecimal avg,
        BigDecimal sum,
        int count
) {}