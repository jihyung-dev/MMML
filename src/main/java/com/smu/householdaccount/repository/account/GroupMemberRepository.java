package com.smu.householdaccount.repository.account;

import com.smu.householdaccount.entity.account.BudgetGroup;
import com.smu.householdaccount.entity.account.GroupMember;
import com.smu.householdaccount.entity.common.Member;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface GroupMemberRepository extends JpaRepository<GroupMember, Long>{

    // 1. [조회] 특정 그룹의 모든 멤버 가져오기 (멤버 정보까지 한 번에 로딩)
    // N+1 문제 방지를 위해 @EntityGraph 사용 (Member 객체도 같이 조회)
    @EntityGraph(attributePaths = {"member"})
    List<GroupMember> findByGroup_Id(Long groupId);

    // 2. [검증] 이미 그룹에 속해 있는지 확인 (초대 시 중복 방지)
    boolean existsByGroupAndMember(BudgetGroup group, Member member);

    // 3. [사이드바] 내가 속한 모든 그룹 목록 가져오기
    // 그룹 정보(Group)도 같이 가져오기 위해 EntityGraph 사용
    @EntityGraph(attributePaths = {"group"})
    List<GroupMember> findByMember_MemberId(String memberId);

    // 4. [삭제/권한] 특정 그룹에서 특정 멤버 찾기 (강퇴, 탈퇴, 권한 변경용)
    Optional<GroupMember> findByGroupAndMember(BudgetGroup group, Member member);

    // (옵션) 그룹장(OWNER)이 누군지 찾을 때
    Optional<GroupMember> findByGroup_IdAndRole(Long groupId, String role);

    // [추가] 그룹에 속한 모든 멤버 삭제
    void deleteByGroup(BudgetGroup group);
}
