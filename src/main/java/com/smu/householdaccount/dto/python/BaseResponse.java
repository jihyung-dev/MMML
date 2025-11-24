package com.smu.householdaccount.dto.python;

import lombok.Data;

import java.util.List;

@Data
public class BaseResponse {
    private String status;      // success / partial / fail
    private Integer count;      // 성공한 개수
    private Integer failed;     // 실패 개수
    private List<FailedItem> failedItems;
}
