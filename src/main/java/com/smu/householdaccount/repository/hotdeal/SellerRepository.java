package com.smu.householdaccount.repository.hotdeal;

import com.smu.householdaccount.entity.hotdeal.Seller;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    //관리자게시판 판매자 검색기능
    Page<Seller> findByMember_MemberIdContainingIgnoreCaseOrMember_MemberNicknameContainingIgnoreCaseOrBizNameContainingIgnoreCase(
            String memberId,
            String nickname,
            String bizName,
            Pageable pageable
    );



}
