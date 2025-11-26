package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.entity.Seller;

public interface MemberService {
    Seller sellerLogin(String memberId, String rawPassword, String bizNo);

    // 🔹 일반 회원가입
    Member registerUser(Member member);

    // 🔹 로그인 확인
    Member login(String memberId, String rawPassword);

    // 🔹 아이디 중복 체크
    boolean existsByMemberId(String memberId);

    // 🔹 닉네임 중복 체크
    boolean existsByNickname(String nickname);

    // 🔹 전화번호 중복 체크
    boolean existsByPhone(String phone);

    // 🔹 아이디 찾기
    String findMemberId(String memberName, String phone);

    // 🔹 비밀번호 재설정 (찾기 후 새 비밀번호 설정)
    void resetPassword(String memberId, String newPassword);

    // 🔹 비밀번호 찾기 검증용
    boolean verifyMemberForPasswordReset(String memberId, String memberName, String phone);
}
