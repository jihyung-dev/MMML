package com.smu.householdaccount.dto.python;

import lombok.Data;

@Data
public class FineTuneResponse {
    private String status;     // started
    private String message;    // "Fine-tune 작업이 백그라운드에서 실행됩니다."
}