package com.smu.householdaccount.controller.account;


import com.smu.householdaccount.dto.ledger.GroupCreateReq;
import com.smu.householdaccount.dto.ledger.GroupInviteReq;
import com.smu.householdaccount.dto.ledger.GroupMemberDto;
import com.smu.householdaccount.service.account.GroupService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/group")
@RequiredArgsConstructor
public class GroupController {

    private final GroupService groupService;

    /*
    1. 그룹 멤버 목록 조회
    GET /api/group/{groupId}/members
    */
    @GetMapping("/{groupId}/members")
    public ResponseEntity<List<GroupMemberDto>> getGroupMembers(
            @PathVariable Long groupId
    ) {
        List<GroupMemberDto> members = groupService.getGroupMembers(groupId);
        return ResponseEntity.ok(members);
    }

    /*
    2. 멤버 초대
    POST /api/group/{groupId}/invite
    */
    @PostMapping("/{groupId}/invite")
    public ResponseEntity<String> inviteMember(
            @PathVariable Long groupId,
            @RequestBody GroupInviteReq req
    ) {
        try {
            groupService.inviteMember(groupId, req.getTargetMemberId());
            return ResponseEntity.ok("멤버가 성공적으로 초대되었습니다.");
        } catch (IllegalArgumentException | IllegalStateException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

     /*
    3. 멤버 강퇴 (또는 탈퇴)
    DELETE /api/group/{groupId}/members/{groupMemberId}
    */
    @DeleteMapping("/{groupId}/members/{groupMemberId}")
    public ResponseEntity<String> removeMember(
            @PathVariable Long groupId,
            @PathVariable Long groupMemberId,
            @SessionAttribute(name = "loginuserId") String requesterId //로그인한 사용자 ID (요청자)
    ) {
        try {
            groupService.removeMember(groupId, groupMemberId, requesterId);
            return ResponseEntity.ok("멤버가 삭제되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    /**
     * 4. 그룹 생성
     * POST /api/group
     */
    /*@PostMapping
    public ResponseEntity<Long> createGroup(
            @RequestBody GroupCreateReq req,
            @SessionAttribute(name = "loginUserId") String ownerId
    ) {
        Long newGroupId = groupService.createGroup(req.getGroupName(), ownerId);
        return ResponseEntity.ok(newGroupId);
    }*/
}
