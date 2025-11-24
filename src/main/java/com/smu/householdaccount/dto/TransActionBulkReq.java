package com.smu.householdaccount.dto;

import lombok.Data;

import java.util.List;

@Data
public class TransActionBulkReq {
    private List<CategoryUpdateReq> transActions;
}
