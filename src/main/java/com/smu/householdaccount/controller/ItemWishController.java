package com.smu.householdaccount.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController // JSON/XML 응답을 위한 RestController 사용
@RequestMapping("/hotdeal/wishlist")
@RequiredArgsConstructor
public class ItemWishController {


    // 현재 로그인된 사용자의 정보를 가져오는 로직이 필요합니다.
    // 여기서는 @AuthenticationPrincipal 등을 사용했다고 가정합니다.

    // 찜 등록 (POST /hotdeal/wishlist/{itemId})
    /*@PostMapping("/{itemId}")
    public ResponseEntity<?> addWish(@PathVariable Long itemId) {
        private final ItemWishService itemwishService;

        // Long currentUserId = ... (현재 로그인 사용자 ID)

        itemwishService.addWish(currentUserId, itemId);
        return ResponseEntity.ok().build(); // 200 OK
    }

    // 찜 취소 (DELETE /hotdeal/wishlist/{itemId})
    @DeleteMapping("/{itemId}")
    public ResponseEntity<?> removeWish(@PathVariable Long itemId) {
        // Long currentUserId = ... (현재 로그인 사용자 ID)

        itemwishService.removeWish(currentUserId, itemId);
        return ResponseEntity.ok().build(); // 200 OK
    }*/
}

