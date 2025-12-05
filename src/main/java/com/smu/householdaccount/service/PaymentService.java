package com.smu.householdaccount.service;

import java.math.BigDecimal;

public interface PaymentService {
    boolean verifyAndRecord(String merchantUid, String impUid, Long amount);
}
