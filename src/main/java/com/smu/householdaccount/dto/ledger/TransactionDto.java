package com.smu.householdaccount.dto.ledger;

import lombok.Data;

// DB에 넣기전에 담아두는 Dto
@Data
public class TransactionDto {

    private String placeOfUse;
    private Integer entryAmount;
    private String memo;
    private String occurredAt;

    private String entryType;
    private String payType;
    private String cardType;
    private String extSrc;
    private Long txnId;

    private String categoryName;
    private String categoryCode;
}