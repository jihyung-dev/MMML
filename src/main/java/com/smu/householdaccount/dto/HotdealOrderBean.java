package com.smu.householdaccount.dto;

import lombok.Data;

import java.util.List;

@Data
public class HotdealOrderBean {
    private Long itemId;
    private Long sellerId;//판매자
    private String buyerId;//구매자
    private List<Long>  quantity;
    private List<Long> optionId;
}
