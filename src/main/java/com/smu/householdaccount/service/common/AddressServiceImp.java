package com.smu.householdaccount.service.common;

import com.smu.householdaccount.entity.common.MemberAddress;
import com.smu.householdaccount.repository.common.MemberAddressRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AddressServiceImp implements AddressService{
    private final MemberAddressRepository memberAddressRepository;
    @Override
    public List<MemberAddress> getAddressesByMemberId(String memberId) {
        return memberAddressRepository.findAllByMemberId(memberId);
    }

    @Override
    public MemberAddress getDefaultAddress(String memberId) {
        return memberAddressRepository.findTop1ByMemberIdAndIsDefaultIsTrue(memberId);
    }

    @Override
    public boolean modifyDefaultAddress(String memberId, Long addressId) {
        memberAddressRepository.updateIsDefaultToFalse(memberId);//기본배송지 없앰
        int updateCount=memberAddressRepository.updateIsDefaultToTrue(addressId);//기본 배송지 등록
        return updateCount>0;
    }

    @Override
    public void deleteAddress(Long addressId) {
        memberAddressRepository.deleteById(addressId);
    }

    @Override
    public MemberAddress addAddress(MemberAddress address) {
        return memberAddressRepository.save(address);
    }

    @Override
    public MemberAddress modifyAddress(MemberAddress address) throws IllegalArgumentException {
        MemberAddress oldAddress=memberAddressRepository.findById(address.getId()).orElseThrow(
                ()->new IllegalArgumentException("does not exist address")
        );
        return memberAddressRepository.save(address);
    }

}
