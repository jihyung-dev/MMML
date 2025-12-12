package com.smu.householdaccount.repository.common;

import com.smu.householdaccount.entity.common.MemberAddress;
import jakarta.transaction.Transactional;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

@Rollback(false)
@SpringBootTest
class MemberAddressRepositoryTest {
    @Autowired
    private MemberAddressRepository memberAddressRepository;
    @Test
    void save() {
        MemberAddress address = new MemberAddress();
        address.setMemberId("U001");
        address.setAddressName("집");
        address.setRecipientName("김철수");
        address.setAddressLine1("서울특별시 강남구 테헤란로 101");
        address.setAddressLine2("101동 1203호");
        address.setZipcode("06236");
        address.setPhone("010-1111-0001");
        address.setRequestMessage("공동현관 비밀번호 7777");
        address.setIsDefault(false);
        // when
        MemberAddress saved = memberAddressRepository.save(address);
        System.out.println(saved);
    }

    @Test
    void findAllByMemberId() {
        System.out.println(memberAddressRepository.findAllByMemberId("U001"));
    }

    @Test
    void findTop1ByMemberIdAndIsDefaultIsTrue() {
        System.out.println(memberAddressRepository.findTop1ByMemberIdAndIsDefaultIsTrue("U001"));
    }

    @Test
    @Transactional
    void updateIsDefaultToFalse() {
        System.out.println(memberAddressRepository.updateIsDefaultToFalse("U001"));
    }

    @Test
    @Transactional
    void updateIsDefaultToTrue() {
        System.out.println(memberAddressRepository.updateIsDefaultToTrue(1L));
    }
}