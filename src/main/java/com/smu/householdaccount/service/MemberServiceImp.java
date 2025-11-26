package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.entity.Seller;
import com.smu.householdaccount.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.Set;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberServiceImp implements MemberService {

    private final MemberRepository memberRepository;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    /**
     * 일반 회원가입
     */
    @Override
    public Member registerUser(Member member) {

        // 비밀번호 암호화
        String encodedPw = passwordEncoder.encode(member.getPassword());
        member.setPassword(encodedPw);

        // 기본 권한 설정
        if (member.getRole() == null) {
            member.setRole("USER");
        }

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

    @Transactional(readOnly = true)
    public Seller sellerLogin(String memberId, String rawPassword,String bizNo) throws IllegalStateException ,IllegalArgumentException{
        Seller seller = null;
         Optional<Member> memberOpt=memberRepository.findById(memberId);
         Member member=memberOpt
                 .filter(m -> passwordEncoder.matches(rawPassword, m.getPassword()))
                 .orElseThrow(()->new IllegalArgumentException("아이디 또는 비밀번호가 올바르지 않습니다."));


         Set<Seller> sellers=member.getSellers();
         if(sellers.size()>0){
             for(Seller s: sellers){
                 if(s.getBizNo().equals(bizNo)){
                     seller=s;
                     break;
                 }
             }

         }
         if(seller==null){
             throw new IllegalStateException("해당 사업자번호로 등록된 판매자 계정이 없습니다.");
         }
         return seller;
    }

    /**
     * 중복 체크: 아이디
     */
    @Override
    public boolean existsByMemberId(String memberId) {
        return memberRepository.existsById(memberId);
    }

    /**
     * 중복 체크: 닉네임
     */
    @Override
    public boolean existsByNickname(String nickname) {
        return memberRepository.existsByMemberNickname(nickname);
    }

    /**
     * 중복 체크: 휴대폰번호
     */
    @Override
    public boolean existsByPhone(String phone) {
        return memberRepository.existsByPhone(phone);
    }

    /**
     * 아이디 찾기
     */
    @Override
    public String findMemberId(String memberName, String phone) {
        return memberRepository.findByMemberNameAndPhone(memberName, phone)
                .map(Member::getMemberId)
                .orElse(null);
    }

    /**
     * 비밀번호 찾기 → 본인 인증
     */
    @Override
    public boolean verifyMemberForPasswordReset(String memberId, String name, String phone) {
        return memberRepository.findById(memberId)
                .filter(m -> m.getMemberName().equals(name))
                .filter(m -> m.getPhone().equals(phone))
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
}
