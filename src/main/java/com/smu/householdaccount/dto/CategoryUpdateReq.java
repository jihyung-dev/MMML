package com.smu.householdaccount.dto;

import lombok.Data;

@Data
public class CategoryUpdateReq {
    private String placeOfUse; // 상호명
    private int entryAmount; // 사용 금액
    private String memo; // 메모
    private String category; // 카테고리
    private String occurredAt; // 사용 일시
    // 구분 타입 하나 추가 예정
}
