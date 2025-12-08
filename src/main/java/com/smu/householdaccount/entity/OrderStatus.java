package com.smu.householdaccount.entity;

public enum OrderStatus {
    PENDING,        // 결제 대기 (결제창 띄워짐, 아직 돈 안나감)
    PAID,           // 결제 완료 (돈 나감, SUCCESS 대신 명확하게 PAID 추천)
    FAILED,         // 결제 실패 (잔액부족 등)
    CANCELED       // 결제 취소 (사용자 단순 변심, 환불 등)
}