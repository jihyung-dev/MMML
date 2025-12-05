package com.smu.householdaccount.dto.ledger;

import lombok.Builder;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Builder
public class LedgerDetailDto {
    private Long id;
    private LocalDateTime occurredAt; // 날짜
    private String entryType;         // 수입/지출
    private String categoryName;      // 카테고리 이름 (String으로 납작하게!)
    private String memo;              // 메모
    private String placeOfUse;        // 사용처
    private String payType;           // 결제수단
    private BigDecimal entryAmount;   // 금액
}