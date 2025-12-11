package com.smu.householdaccount.service.account;


import com.smu.householdaccount.dto.ledger.GroupMemberDto;
import com.smu.householdaccount.entity.account.BudgetGroup;
import com.smu.householdaccount.entity.account.GroupMember;
import com.smu.householdaccount.entity.account.GroupProperty;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.repository.account.BudgetGroupRepository;
import com.smu.householdaccount.repository.account.GroupMemberRepository;
import com.smu.householdaccount.repository.account.GroupPropertyRepository;
import com.smu.householdaccount.repository.common.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class GroupService {

    private final GroupMemberRepository groupMemberRepository;
    private final MemberRepository memberRepository;
    private final BudgetGroupRepository budgetGroupRepository;

    /**
     * 1. 그룹 멤버 목록 조회
     */
    @Transactional(readOnly = true)
    public List<GroupMemberDto> getGroupMembers(Long groupId) {
        return groupMemberRepository.findByGroup_Id(groupId).stream()
                .map(gm -> GroupMemberDto.builder()
                        .groupMemberId(gm.getId())
                        .memberId(gm.getMember().getMemberId())
                        .memberName(gm.getMember().getMemberName())
                        .nickname(gm.getMember().getMemberNickname())
                        .role(gm.getRole()) // "OWNER" or "MEMBER"
                        .joinedAt(gm.getCreatedAt().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")))
                        .build())
                .collect(Collectors.toList());
    }

    /**
     * 2. 멤버 초대 (ID로 검색해서 추가)
     */
    @Transactional
    public void inviteMember(Long groupId, String targetMemberId) {
        // 그룹 확인
        BudgetGroup group = budgetGroupRepository.findById(groupId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 그룹입니다."));

        // 초대할 사용자 확인
        Member target = memberRepository.findById(targetMemberId)
                .orElseThrow(() -> new IllegalArgumentException("해당 아이디를 가진 사용자가 없습니다."));

        // 이미 멤버인지 중복 체크
        if (groupMemberRepository.existsByGroupAndMember(group, target)) {
            throw new IllegalStateException("이미 그룹에 가입된 멤버입니다.");
        }

        // 멤버 추가
        GroupMember newMember = new GroupMember();
        newMember.setGroup(group);
        newMember.setMember(target);
        newMember.setRole("MEMBER"); // 기본은 일반 멤버
        newMember.setCreatedAt(LocalDateTime.now());

        groupMemberRepository.save(newMember);
    }

    /**
     * 3. 멤버 삭제 (강퇴 또는 탈퇴)
     * - 요청자(requesterId)가 'OWNER'여야만 남을 강퇴 가능
     * - 혹은 본인이 본인을 삭제(탈퇴)하는 경우는 허용
     */
    @Transactional
    public void removeMember(Long groupId, Long targetGroupMemberId, String requesterId) {
        // 삭제할 대상 찾기
        GroupMember target = groupMemberRepository.findById(targetGroupMemberId)
                .orElseThrow(() -> new IllegalArgumentException("해당 멤버 정보가 없습니다."));

        // 요청자 정보 확인 (권한 체크용)
        // 주의: requesterId로 내 GroupMember 정보를 찾아야 내 Role을 알 수 있음
        // 아래 로직은 '그룹장만 강퇴 가능'이라는 규칙을 적용한 예시입니다.

        // 1) 내 정보 조회 (내 Role 확인)
        Member requester = memberRepository.findById(requesterId).orElseThrow();

        // 내가 이 그룹의 멤버인지 확인
        GroupMember me = groupMemberRepository.findByGroupAndMember(target.getGroup(), requester)
                .orElseThrow(() -> new IllegalArgumentException("당신은 이 그룹의 멤버가 아닙니다."));

        // 2) 권한 체크
        boolean isSelf = target.getMember().getMemberId().equals(requesterId); // 나 스스로 탈퇴?
        boolean isOwner = "OWNER".equals(me.getRole()); // 내가 방장?

        if (!isSelf && !isOwner) {
            throw new IllegalStateException("멤버를 강퇴할 권한이 없습니다. (방장만 가능)");
        }

        // 3) 방장 스스로 탈퇴하려는 경우 막기 (또는 방장 위임 로직 필요)
        if (isSelf && isOwner) {
            // 멤버가 더 남아있다면 방장은 나갈 수 없다거나, 방장을 위임해야 한다는 로직이 필요할 수 있음
            // 여기서는 일단 경고만 주석으로 남김
        }

        // 삭제 실행
        groupMemberRepository.delete(target);
    }


    private final GroupPropertyRepository groupPropertyRepository; // [추가] 필드 주입 필요

    /**
     * 4. 그룹 생성 (새 그룹 만들기)
     */
    @Transactional
    public Long createGroup(String groupName, String ownerId) {
        Member owner = memberRepository.findById(ownerId)
                .orElseThrow(() -> new IllegalArgumentException("사용자 정보 없음"));

        // 1. 그룹 생성 & 저장
        BudgetGroup group = new BudgetGroup();
        group.setGroupName(groupName);
        group.setOwner(owner);
        group.setCreatedAt(LocalDateTime.now());
        budgetGroupRepository.save(group);

        // 2. 그룹 속성 저장 (타입 'G': 모임 통장)
        GroupProperty property = new GroupProperty();
        property.setGroup(group);
        property.setGroupType('G');
        // property.setCreatedAt(Instant.now()); // 필요시
        groupPropertyRepository.save(property);

        // 3. 나를 멤버(OWNER)로 추가
        GroupMember member = new GroupMember();
        member.setGroup(group);
        member.setMember(owner);
        member.setRole("OWNER");
        member.setCreatedAt(LocalDateTime.now());
        groupMemberRepository.save(member);

        return group.getId(); // 생성된 그룹 ID 반환
    }
}