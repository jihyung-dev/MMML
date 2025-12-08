package com.smu.householdaccount.repository.common;

import com.smu.householdaccount.entity.common.Member;
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

    // 🚩 (추가) 이메일 중복 체크 필요하면 사용
    boolean existsByEmail(String email);

    // 🔹 아이디 찾기용 (이름 + 이메일 조합)
    Optional<Member> findByMemberNameAndEmail(String memberName, String email);

    // 🔹 비밀번호 찾기 검증용 (ID + 이름 + 이메일)
    Optional<Member> findByMemberIdAndMemberNameAndEmail(String memberId, String memberName, String email);
}
