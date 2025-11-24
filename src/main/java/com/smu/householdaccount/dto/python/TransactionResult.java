package com.smu.householdaccount.dto.python;

import lombok.Data;

// 거래 자동 분류 결과
@Data
public class TransactionResult {
    private String placeOfUse;
    private Integer entryAmount;
    private String memo;
    private String category;
    private String occurredAt;
}
