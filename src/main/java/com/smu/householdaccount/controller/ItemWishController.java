package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.service.ItemWishService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.Map;

@RestController // JSON/XML 응답을 위한 RestController 사용
@RequestMapping("/hotdeal/wishlist")
@RequiredArgsConstructor
public class ItemWishController {

    @Autowired(required = false)
    private final ItemWishService itemWishService;

    // 페이지 로드 시 현재 상태 조회 (옵션)
    @GetMapping("/{itemId}/status")
    public ResponseEntity<Map<String, Object>> status(
            @PathVariable Long itemId,
            @SessionAttribute Member loginUser) {
        if (loginUser == null) {
            return ResponseEntity.ok(Map.of("wished", false));
        }
        String memberId = loginUser.getMemberId();
        boolean wished = itemWishService.isWished(itemId, memberId);
        return ResponseEntity.ok(Map.of("wished", wished));
    }

    // 토글: 찜 on/off (POST로 간단히 토글 처리)
    @PostMapping("/{itemId}")
    public ResponseEntity<Map<String, Object>> toggle(
            @PathVariable Long itemId,
            @SessionAttribute(required = false) Member loginUser) {

        if (loginUser == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "로그인이 필요합니다.");
        }
        String memberId = loginUser.getMemberId();
        boolean nowWished = itemWishService.toggleWish(itemId, memberId);
        return ResponseEntity.ok(Map.of("wished", nowWished));
    }

    // (선택) 찜 삭제 전용
    @DeleteMapping("/{itemId}")
    public ResponseEntity<Void> remove(@PathVariable Long itemId,
                                       @AuthenticationPrincipal UserDetails userDetails) {
        if (userDetails == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "로그인이 필요합니다.");
        }
        String memberId = userDetails.getUsername();
        itemWishService.toggleWish(itemId, memberId); // toggle 사용하거나 직접 delete 메서드 만들기 가능
        return ResponseEntity.noContent().build();
    }
}

