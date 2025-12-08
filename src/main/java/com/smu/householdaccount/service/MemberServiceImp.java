package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberServiceImp implements MemberService {

    private final MemberRepository memberRepository;

    // 간단하게 new 로 사용 (나중에 Bean 주입 방식으로 바꿔도 됨)
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public Member updateMemberInfo(String memberId, String memberName, String currentpw, String newpw, String newpw2, String phone, String address) {
        Member member = memberRepository.findByMemberId(memberId)
                .orElseThrow(() -> new RuntimeException("회원 정보를 찾을 수 없습니다."));

        // 비밀번호를 변경할 때만 현재 비밀번호 확인
        if (!newpw.isBlank() || !newpw2.isBlank()) {
            if (!passwordEncoder.matches(currentpw, member.getPassword())) {
                throw new RuntimeException("현재 비밀번호가 일치하지 않습니다.");
            }

            if (!newpw.equals(newpw2)) {
                throw new RuntimeException("새 비밀번호가 일치하지 않습니다.");
            }

            // 비밀번호 변경
            member.setPassword(passwordEncoder.encode(newpw));
        }

        // 이름, 전화번호, 주소 변경
        member.setMemberName(memberName);
        member.setPhone(phone);
        member.setAddress(address);

        member=memberRepository.save(member);
        return member;
    }

    /**
     * 일반 회원가입
     * - gender, age, email 도 Member 객체에 바인딩되어 넘어온다고 가정
     */
    @Override
    public Member registerUser(Member member) {

        // 비밀번호 암호화
        String encodedPw = passwordEncoder.encode(member.getPassword());
        member.setPassword(encodedPw);

        // 기본 권한 설정
        if (member.getRole() == null || member.getRole().isBlank()) {
            member.setRole("GENERAL");
        }

        // enabled, createdAt 은 @PrePersist 에서 처리
        return memberRepository.save(member);
    }

    /**
     * 로그인
     */
    @Transactional(readOnly = true)
    @Override
    public Member login(String memberId, String rawPassword) {
        return memberRepository.findById(memberId)
                .filter(m -> passwordEncoder.matches(rawPassword, m.getPassword()))
                .orElse(null);
    }

    /**
     * 중복 체크: 아이디
     */
    @Transactional(readOnly = true)
    @Override
    public boolean existsByMemberId(String memberId) {
        return memberRepository.existsById(memberId);
    }

    /**
     * 중복 체크: 닉네임
     */
    @Transactional(readOnly = true)
    @Override
    public boolean existsByNickname(String nickname) {
        return memberRepository.existsByMemberNickname(nickname);
    }

    /**
     * 중복 체크: 휴대폰번호
     */
    @Transactional(readOnly = true)
    @Override
    public boolean existsByPhone(String phone) {
        return memberRepository.existsByPhone(phone);
    }

    /**
     * (선택) 중복 체크: 이메일
     */
    @Transactional(readOnly = true)
    @Override
    public boolean existsByEmail(String email) {
        return memberRepository.existsByEmail(email);
    }

    /**
     * 아이디 찾기 (이름 + 이메일)
     */
    @Transactional(readOnly = true)
    @Override
    public String findMemberId(String memberName, String email) {
        return memberRepository.findByMemberNameAndEmail(memberName, email)
                .map(Member::getMemberId)
                .orElse(null);
    }

    /**
     * 비밀번호 찾기 → 본인 인증 (ID + 이름 + 이메일)
     */
    @Transactional(readOnly = true)
    @Override
    public boolean verifyMemberForPasswordReset(String memberId, String memberName, String email) {
        return memberRepository
                .findByMemberIdAndMemberNameAndEmail(memberId, memberName, email)
                .isPresent();
    }

    /**
     * 비밀번호 재설정
     */
    @Override
    public void resetPassword(String memberId, String newPassword) {

        memberRepository.findById(memberId).ifPresent(member -> {
            String encodedPw = passwordEncoder.encode(newPassword);
            member.setPassword(encodedPw);
            memberRepository.save(member);
        });
    }

    @Override
    public boolean isMember(String memberId) {
        return memberRepository.findById(memberId).isPresent();
    }

    @Override
    public String buildSimpleOauthKey(String provider, String oauthId) {
        String trimmed = oauthId.substring(0, Math.min(40, oauthId.length()));
        return provider + "_" + trimmed;
    }

    @Override
    public void registerOAuthUser(Member member) {
        memberRepository.save(member);
    }

    @Override
    public Member getMember(String memberId) {
        return memberRepository.findByMemberId(memberId).orElse(null);
    }
}
