package com.smu.householdaccount.dto.ledger;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GroupInviteReq {
    private String targetMemberId; //초대할 사용자 ID
}
