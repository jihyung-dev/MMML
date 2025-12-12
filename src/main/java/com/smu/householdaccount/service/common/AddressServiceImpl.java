package com.smu.householdaccount.service.common;

import com.smu.householdaccount.entity.common.MemberAddress;
import com.smu.householdaccount.repository.common.MemberAddressRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class AddressServiceImpl implements AddressService{

    private final MemberAddressRepository memberAddressRepository;

    @Override
    public Optional<MemberAddress> getAddressById(Long addressId) {
        return memberAddressRepository.findById(addressId);
    }

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
    public boolean deleteAddress(Long addressId) {
        memberAddressRepository.deleteById(addressId);
        return true;
    }


    /**
     * addAddress 는 동시성 안전성을 위해 FOR UPDATE 잠금으로 기존 주소 목록을 먼저 조회합니다.
     */
    @Override
    public MemberAddress addAddress(MemberAddress address) {
        String memberId = address.getMemberId();

        // 1) 같은 트랜잭션 안에서 해당 회원의 모든 주소 행을 FOR UPDATE 로 잠깁니다.
        List<MemberAddress> existingAddresses = memberAddressRepository.findAllByMemberId(memberId);

        // 2) 첫 등록이면 무조건 기본으로 설정
        if (existingAddresses == null || existingAddresses.isEmpty()) {
            address.setIsDefault(true);
        }

        return memberAddressRepository.save(address);
    }

    @Override
    public MemberAddress modifyAddress(MemberAddress address) throws IllegalArgumentException {
        MemberAddress oldAddress=memberAddressRepository.findById(address.getId()).orElseThrow(
                ()->new IllegalArgumentException("does not exist address")
        );
        // 필요한 필드만 덮어쓰기 하도록 수정하는게 안전
        oldAddress.setAddressName(address.getAddressName());
        oldAddress.setRecipientName(address.getRecipientName());
        oldAddress.setAddressLine1(address.getAddressLine1());
        oldAddress.setAddressLine2(address.getAddressLine2());
        oldAddress.setZipcode(address.getZipcode());
        oldAddress.setPhone(address.getPhone());
        oldAddress.setRequestMessage(address.getRequestMessage());
        oldAddress.setIsDefault(address.getIsDefault());
        // isDefault 변경 처리 (동시에 기본 변경이 있을 수 있으므로 updateIsDefaultToFalse 사용)
        if ((address.getIsDefault()) && !(oldAddress.getIsDefault())) {
            memberAddressRepository.updateIsDefaultToFalse(oldAddress.getMemberId());
        }

        return memberAddressRepository.save(oldAddress);
    }

    @Override
    public void modifyDefaultAddress(MemberAddress address) throws IllegalArgumentException {
        memberAddressRepository.updateIsDefaultToFalse(address.getMemberId());
        memberAddressRepository.updateIsDefaultToTrue(address.getId());
    }

}
