package com.smu.householdaccount.service.common;

import com.smu.householdaccount.entity.common.MemberAddress;
import org.springframework.stereotype.Service;

import java.util.List;

public interface AddressService {

    List<MemberAddress> getAddressesByMemberId(String memberId);
    MemberAddress getDefaultAddress(String memberId);
    boolean modifyDefaultAddress(String memberId, Long addressId);
    void deleteAddress(Long addressId);
    void addAddress(MemberAddress address);
    void modifyAddress(MemberAddress address) throws IllegalArgumentException;
}
