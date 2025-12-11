package com.smu.householdaccount.service.common;

import com.smu.householdaccount.entity.common.MemberAddress;
import org.springframework.stereotype.Service;

import java.util.List;

public interface AddressService {

    List<MemberAddress> getAddressesByMemberId(String memberId);
    MemberAddress getDefaultAddress(String memberId);
    boolean modifyDefaultAddress(String memberId, Long addressId);
    void deleteAddress(Long addressId);
    MemberAddress addAddress(MemberAddress address);
    MemberAddress modifyAddress(MemberAddress address) throws IllegalArgumentException;
}
