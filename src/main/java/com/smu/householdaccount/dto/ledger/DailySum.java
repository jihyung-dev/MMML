package com.smu.householdaccount.dto.ledger;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
public class DailySum {
        private String date;
        private BigDecimal totalAmount;
        private String entryType;

}
