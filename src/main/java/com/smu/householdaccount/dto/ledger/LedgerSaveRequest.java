package com.smu.householdaccount.dto.ledger;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class LedgerSaveRequest {
    private String entryType;    // INCOME 또는 EXPENSE
    private BigDecimal amount;   // 금액

    // [변경] 날짜와 시간을 모두 포함 (ISO 8601 형식 매핑)
    private LocalDateTime dateTime;

    private String time;         // (선택사항 - 로직에서는 dateTime 사용)
    private String categoryName; // 카테고리 이름
    private String memo;         // 메모
    private String place;        // 사용처
    private String payType;      // CARD, CASH 등
}