package com.smu.householdaccount.dto.python;

import lombok.Data;

import java.util.List;

@Data
public class ClassifyTransactionResponse extends BaseResponse{
    private List<TransactionResult> results;
}

