package com.smu.householdaccount.dto.ledger;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
public class CategoryStatRedisDto {
    private String gender;
    private int ageGroup;
    private String category;
    private BigDecimal avg;
    private BigDecimal sum;
    private int count;
}
