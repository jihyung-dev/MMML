package com.smu.householdaccount.dto.python;

import lombok.Data;

// 자동 학습 Dto
@Data
public class AiTrainingResponse {
    private String status;
    private String trainedAt;
    private Integer dataSize;
    private String message;
}
