package com.smu.householdaccount.dto.payment;

import lombok.Data;

@Data
public class CreateOrderReq {
    private int amount;
    private Long buyerId;
}
