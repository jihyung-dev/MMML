package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MemberRepository extends JpaRepository<Member, String> {

    // 로그인용 ID 조회
    Optional<Member> findByMemberId(String memberId);

    // 중복 체크용
    boolean existsByMemberId(String memberId);
    boolean existsByMemberNickname(String memberNickname);
    boolean existsByPhone(String phone);

    // 아이디 찾기용 (이름 + 전화번호 조합)
    Optional<Member> findByMemberNameAndPhone(String memberName, String phone);

    // 비밀번호 찾기용
    Optional<Member> findByMemberIdAndMemberNameAndPhone(String memberId, String memberName, String phone);



}
