package com.smu.householdaccount.dto.python;

import lombok.Data;

@Data
public class FineTuneStatusResponse {
    private String status;     // idle / running / success / fail
    private String message;
    private String timestamp;
}
