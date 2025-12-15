package com.smu.householdaccount.service.common;

import com.smu.householdaccount.entity.common.MemberAddress;

import java.util.List;
import java.util.Optional;

public interface AddressService {

    Optional<MemberAddress> getAddressById(Long addressId);
    List<MemberAddress> getAddressesByMemberId(String memberId);
    MemberAddress getDefaultAddress(String memberId);
    boolean modifyDefaultAddress(String memberId, Long addressId);
    boolean deleteAddress(Long addressId);
    MemberAddress addAddress(MemberAddress address);
    MemberAddress modifyAddress(MemberAddress address) throws IllegalArgumentException;
    void modifyDefaultAddress(MemberAddress address) throws IllegalArgumentException;
}
