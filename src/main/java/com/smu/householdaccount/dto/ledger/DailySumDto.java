package com.smu.householdaccount.dto.ledger;
import java.time.LocalDate;
import java.math.BigDecimal;

public interface DailySumDto {
    LocalDate getDate();
    String getEntryType();
    BigDecimal getTotalAmount();
}