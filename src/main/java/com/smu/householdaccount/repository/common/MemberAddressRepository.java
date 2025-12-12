package com.smu.householdaccount.repository.common;

import com.smu.householdaccount.entity.common.MemberAddress;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberAddressRepository extends CrudRepository<MemberAddress,Long> {
    @Override
    <S extends MemberAddress> S save(S entity);

    List<MemberAddress> findAllByMemberId(String memberId);


    // TOP1 -> 서비스단에서 유저가 기본배송지를 1개만 가지도록 할 예정이지만 db가 유저가 기본배송지를 무조건 1개 가진단 보장이 없음
    MemberAddress findTop1ByMemberIdAndIsDefaultIsTrue(String memberId);

    //유저가 가진 기본 배송지를 기본 배송지가 이니게 수정
    @Modifying
    @Query("UPDATE MemberAddress m SET m.isDefault = false WHERE m.isDefault = true AND m.memberId = :memberId")
    int updateIsDefaultToFalse(@Param("memberId") String memberId);

    //유저가 선택한 배송지를 기본 배송지로 수정
    @Modifying
    @Query("UPDATE MemberAddress m SET m.isDefault = true WHERE m.id = :id")
    int updateIsDefaultToTrue(@Param("id") Long id);


    // 새로 추가: 해당 회원의 주소가 하나라도 있는지 확인
    boolean existsByMemberId(String memberId);

    // (선택) 회원의 주소 개수 조회
    long countByMemberId(String memberId);

}
