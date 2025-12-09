package com.smu.householdaccount.service.common;

import com.smu.householdaccount.entity.common.Member;

public interface MemberService {

    Member updateMemberInfo(
            String memberId,
            String memberName,
            String currentpw,
            String newpw,
            String newpw2,
            String phone,
            String address
    );

    // 🔹 일반 회원가입
    Member registerUser(Member member);

    // 🔹 로그인 (일반/판매자 공통)
    Member login(String memberId, String rawPassword);

    // 🔹 아이디 중복 체크
    boolean existsByMemberId(String memberId);

    // 🔹 닉네임 중복 체크
    boolean existsByNickname(String nickname);

    // 🔹 전화번호 중복 체크
    boolean existsByPhone(String phone);

    // 🔹 (선택) 이메일 중복 체크
    boolean existsByEmail(String email);

    // 🔹 아이디 찾기 (이름 + 이메일)
    String findMemberId(String memberName, String email);

    // 🔹 비밀번호 찾기 검증용 (ID + 이름 + 이메일)
    boolean verifyMemberForPasswordReset(String memberId, String memberName, String email);

    // 🔹 비밀번호 재설정
    void resetPassword(String memberId, String newPassword);

    // 회원 등록 여부 확인
    boolean isMember(String memberId);

    // oAuth 회원용 아이디
    String buildSimpleOauthKey(String provider, String oauthId);

    // 소셜 회원가입
    void registerOAuthUser(Member member);

    // 회원 정보 받아오기
    Member getMember(String memberId);

    // 🔹 회원탈퇴 (ENABLED = 'N' 으로 비활성 처리)  // ⭐ [추가 설명]
    void withdraw(String memberId);

    // ⭐ 재가입 (탈퇴회원 다시 활성화 + 비밀번호 변경)
    void rejoin(String memberId, String newPassword);
}
