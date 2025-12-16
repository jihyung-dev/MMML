package com.smu.householdaccount.service.common;

import com.smu.householdaccount.entity.account.BudgetGroup;
import com.smu.householdaccount.entity.account.GroupMember;
import com.smu.householdaccount.entity.account.GroupProperty;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.repository.account.BudgetGroupRepository;
import com.smu.householdaccount.repository.account.GroupMemberRepository;
import com.smu.householdaccount.repository.account.GroupPropertyRepository;
import com.smu.householdaccount.repository.common.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberServiceImp implements MemberService {

    private final MemberRepository memberRepository;

    // 간단하게 new 로 사용 (나중에 Bean 주입 방식으로 바꿔도 됨)
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    // [추가] 가계부 생성을 위한 레포지토리들 주입
    private final BudgetGroupRepository budgetGroupRepository;
    private final GroupPropertyRepository groupPropertyRepository;
    private final GroupMemberRepository groupMemberRepository;

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

        // 1. 비밀번호 암호화
        String encodedPw = passwordEncoder.encode(member.getPassword());
        member.setPassword(encodedPw);

        // 2. 권한 설정
        if (member.getRole() == null || member.getRole().isBlank()) {
            member.setRole("GENERAL");
        }

        // 3. 회원 저장
        Member savedMember = memberRepository.save(member);

        // ★ [핵심] 개인 가계부 자동 생성 호출! (이 부분이 누락되었었습니다)
        createPersonalLedger(savedMember);

        // enabled, createdAt 은 @PrePersist 에서 처리
        return savedMember;
    }

    // [추가] 개인 가계부 생성 메서드
    private void createPersonalLedger(Member member) {
        // 1) 그룹 본체 생성
        BudgetGroup group = new BudgetGroup();
        group.setGroupName(member.getMemberName() + "님의 개인 가계부");
        group.setOwner(member);
        group.setCreatedAt(LocalDateTime.now());
        budgetGroupRepository.save(group);

        // 2) 그룹 속성(Property) 생성 -> 타입 'P'
        GroupProperty property = new GroupProperty();
        property.setGroup(group);
        property.setGroupType('P'); // Personal
        // property.setCreatedAt(Instant.now()); // 필요 시 주석 해제
        groupPropertyRepository.save(property);

        // 3) 멤버(OWNER)로 등록
        GroupMember groupMember = new GroupMember();
        groupMember.setGroup(group);
        groupMember.setMember(member);
        groupMember.setRole("OWNER");
        groupMember.setCreatedAt(LocalDateTime.now());
        groupMemberRepository.save(groupMember);
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


    // 회원탈퇴관련
    @Override
    public void withdraw(String memberId) {
        memberRepository.findById(memberId).ifPresent(member -> {
            member.setEnabled("N");
            memberRepository.save(member);
            // 필요하면 전화번호/주소/이메일 마스킹도 여기서 가능
        });
    }

    @Override
    public void rejoin(String memberId, String newPassword) {
        memberRepository.findById(memberId).ifPresent(member -> {

            // (선택) 방어 코드: 탈퇴 회원이 아닌 경우 막고 싶으면 사용
            if (member.getEnabled() != null && !"N".equalsIgnoreCase(member.getEnabled())) {
                throw new IllegalStateException("이미 활성화된 회원은 재가입 대상이 아닙니다.");
            }

            String encodedPw = passwordEncoder.encode(newPassword);
            member.setPassword(encodedPw);   // 새 비밀번호 설정
            member.setEnabled("Y");          // 다시 활성화

            memberRepository.save(member);
        });

    }
}
