package com.smu.householdaccount.service.common;

import com.smu.householdaccount.entity.common.MemberAddress;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class AddressServiceImpTest {
    @Autowired
    private AddressService addressService;
    @Test
    void modifyAddress() {
        MemberAddress address = new MemberAddress();
        address.setId(11L);
        address.setMemberId("U001");
        address.setAddressName("집임");
        address.setRecipientName("김칠칠");
        address.setAddressLine1("서울특별시 강남구 테헤란로 201");
        address.setAddressLine2("101동 2203호");
        address.setZipcode("06232");
        address.setPhone("010-2222-0001");
        address.setRequestMessage("공동현관 비밀번호 8888");
        address.setIsDefault(true);
        addressService.modifyAddress(address);


    }
}