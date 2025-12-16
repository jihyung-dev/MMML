package com.smu.householdaccount.controller.hotdeal;

import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.service.hotdeal.ItemService;
import com.smu.householdaccount.service.hotdeal.ItemWishService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Map;

@RestController // JSON/XML 응답을 위한 RestController 사용
@RequestMapping("/hotdeal/ajax/wishlist")
@RequiredArgsConstructor
public class ItemWishController {

    @Autowired(required = false)
    private final ItemWishService itemWishService;
    private final ItemService itemService;

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

        // 찜 토글 실행
        boolean nowWished = itemWishService.toggleWish(itemId, memberId);

        // [추가] 인기 점수 반영
        if (nowWished) {
            itemService.addPopularityScore(itemId, 10); // 찜 설정: +10점
        } else {
            itemService.addPopularityScore(itemId, -10); // 찜 해제: -10점 (선택 사항)
        }

        return ResponseEntity.ok(Map.of("wished", nowWished));
    }

    // ▼▼▼ [추가] 미리보기 데이터 반환 API ▼▼▼
    // 최종 URL: /hotdeal/wishlist/preview
    @GetMapping("/preview")
    public ResponseEntity<List<Map<String, Object>>> getPreview(
            @SessionAttribute(required = false) Member loginUser
    ) {
        if (loginUser == null) {
            // 로그인 안 했으면 빈 리스트 반환 (오류 아님)
            return ResponseEntity.ok(List.of());
        }

        List<Map<String, Object>> result = itemWishService.getTop3WishList(loginUser.getMemberId());
        return ResponseEntity.ok(result);
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

