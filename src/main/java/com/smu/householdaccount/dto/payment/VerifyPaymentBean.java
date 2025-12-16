package com.smu.householdaccount.dto.payment;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.Column;
import jakarta.validation.constraints.Size;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class VerifyPaymentBean {
    @JsonProperty("imp_uid")
    private String impUid;// = (String) body.get("imp_uid");

    @JsonProperty("merchant_uid")
    private String merchantUid;// = (String) body.get("merchant_uid");
    private Long amount;// = new BigDecimal(String.valueOf(body.get("amount"))).longValue();
    private String recipientName;
    private String addressLine1;
    private String addressLine2;
    private String requestMessage;
    private String zipcode;
    private String phone;
}
