package com.smu.householdaccount.dto.ledger;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class GroupMemberDto {
    private Long groupMemberId; // 삭제할 때 필요
    private String memberId;    // 아이디 표시
    private String memberName;  // 이름 표시
    private String nickname;    // 닉네임 표시
    private String role;        // OWNER(방장)인지 MEMBER(일반)인지 구분
    private String joinedAt;    // 가입일 (yyyy-MM-dd 형태)
}

