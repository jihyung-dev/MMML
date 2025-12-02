package com.smu.householdaccount.dto.ledger;
import java.math.BigDecimal;

public interface CategorySumDto {
    String getCategoryName();
    BigDecimal getTotalAmount();
}