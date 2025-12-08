package com.smu.householdaccount.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.math.BigDecimal;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class CategoryUpdateReq {
    private String entryType;       // entry_type
    private String payType;         // pay_type
    private String cardType;        // card_type
    private BigDecimal entryAmount; // entry_amount
    private String currency;        // currency
    private String occurredAt;      // occurred_at
    private String placeOfUse;      // place_of_use
    private String memo;            // memo
    private String category;        // category → 이후 PK로 변환됨
}
