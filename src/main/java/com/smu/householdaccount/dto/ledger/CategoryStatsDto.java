package com.smu.householdaccount.dto.ledger;

import java.math.BigDecimal;

/**
 * 분류 하여 전체 데이터 호출 Dto
 */
public interface CategoryStatsDto {
    String getGender();
    Integer getAgeGroup();
    String getCategory();
    BigDecimal getTotal();
    BigDecimal getAvgAmount();
    Integer getTxnCount(); // 거래 횟수
}
