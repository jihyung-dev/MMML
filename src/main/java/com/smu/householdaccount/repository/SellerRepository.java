package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.Seller;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SellerRepository extends JpaRepository<Seller, Long> {

    // 특정 Member 의 판매자 정보 조회
    Optional<Seller> findByMember_MemberId(String memberId);

    // bizNo(사업자번호) 중복 체크
    boolean existsByBizNo(String bizNo);

    Optional<Seller> findByMember_MemberIdAndMember_MemberNameAndMember_Phone(
            String memberId,
            String memberName,
            String phone
    );


}
