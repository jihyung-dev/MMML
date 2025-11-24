package com.smu.householdaccount.dto.python;

import lombok.Data;

@Data
public class FailedItem {
    private Integer index;      // 실패한 데이터 index
    private String reason;      // 오류 메시지
    private Object rawData;     // 원본 데이터 그대로 (Map 구조)
}
