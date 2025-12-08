package com.smu.householdaccount.service.hotdeal;

public interface PaymentService {
    boolean verifyAndRecord(String merchantUid, String impUid, Long amount);
}
