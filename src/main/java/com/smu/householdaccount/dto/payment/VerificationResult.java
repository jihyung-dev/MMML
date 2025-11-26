package com.smu.householdaccount.dto.payment;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class VerificationResult {
    private boolean success;
    private String impUid;
    private String merchantUid;
    private Integer amount;
    private String status;
    private String message;
}
