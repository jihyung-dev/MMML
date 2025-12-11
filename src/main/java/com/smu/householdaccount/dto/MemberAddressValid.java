package com.smu.householdaccount.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data
public class MemberAddressValid {
    @NotBlank(message = "배송지 이름은 필수입니다.")
    private String addressName;

    @NotBlank(message = "받는 사람 이름은 필수입니다.")
    private String recipientName;

    @NotBlank(message = "주소는 필수입니다.")
    private String addressLine1;

    @NotBlank(message = "우편번호는 필수입니다.")
    private String zipcode;

    @Pattern(
            regexp = "^01[0-9]-\\d{3,4}-\\d{4}$",
            message = "연락처 형식이 올바르지 않습니다. 예) 010-1234-5678"
    )
    private String phone;

    private String addressLine2;
    private String requestMessage;


}
