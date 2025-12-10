package com.smu.householdaccount.controller.hotdeal;

import java.math.BigDecimal;

import com.smu.householdaccount.dto.item.ItemResponseDto;
import com.smu.householdaccount.entity.account.Category;
import com.smu.householdaccount.entity.hotdeal.Item;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.repository.account.CategoryRepository;
import com.smu.householdaccount.service.hotdeal.ItemService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.*;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/hotdeal")
@AllArgsConstructor
@Slf4j
public class ItemController {    // 명시적 생성자 주입 (Lombok 없이 안전)
    private final ItemService itemService;
    private final CategoryRepository categoryRepository;


    // 목록: 검색 파라미터 모두 optional
    @GetMapping
    public String list(
            @RequestParam(required = false) Long sellerId,
            @RequestParam(required = false) String categoryId,
            @RequestParam(required = false) String q, // 상품 이름 검색어
            @RequestParam(required = false) BigDecimal minPrice,
            @RequestParam(required = false) BigDecimal maxPrice,
            @RequestParam(required = false) String status, // 판매 상태 (ON_SALE, ENDED, SOLD_OUT 등)
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDateTime date, // 특정 날짜 기준 검색
            @PageableDefault(page=0, size = 8, sort = "id", direction = Sort.Direction.DESC) Pageable pageable,
            Model model,

            // ★ [수정] 로그인 사용자 정보 가져오기 (ItemWishController와 동일한 방식)
            // required = false로 해야 비로그인 사용자도 목록을 볼 수 있음
            @SessionAttribute(name = "loginUser", required = false) Member loginUser
    ) {
        Page<Item> itemPage = itemService.searchItems(sellerId, categoryId, q, minPrice, maxPrice, status, date, pageable);

        //수정 주석처리
        //model.addAttribute("itemPage", itemPage);
        log.info("itemPage.content size : {}", itemPage.getContent().size());

        // 2. ★ [추가] 로그인한 멤버 ID 추출
        /*String currentMemberId = null;
        if (loginUser != null) {
            currentMemberId = loginUser.getMemberId();
        }*/
        String currentMemberId = (loginUser != null) ? loginUser.getMemberId() : null;

        // ★ 이 로그를 확인해보세요!
        System.out.println("현재 로그인 ID: " + currentMemberId);

        // 3. ★ [핵심] 엔티티 -> DTO 변환 (여기서 DB 조회하여 찜 여부를 채움)
        Page<ItemResponseDto> dtoPage = itemService.convertToDto(itemPage, currentMemberId);

        // 4. 모델에 담기 (DTO 페이지를 넘겨줌)
        model.addAttribute("itemPage", dtoPage);

        // 5. 검색 조건 유지를 위해 모델에 다시 추가
        model.addAttribute("sellerId", sellerId);
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("q", q);
        model.addAttribute("minPrice", minPrice);
        model.addAttribute("maxPrice", maxPrice);
        model.addAttribute("status", status);
        model.addAttribute("date", date);

        // 6. 카테고리 목록 조회
        List<Category> categories = categoryRepository.findByCategoryIdStartingWith("H"); // Service에서 DB 조회
        log.info("categories : {}", categories);
        model.addAttribute("categories", categories);

        // 뷰: src/main/resources/templates/hotdeal/list.html (Thymeleaf 등)
        return "item/list";
    }

    // 상세: 상세 페이지 로드 시 서버에서 조회수 증가 후 보여줌
    @GetMapping("/{id}")
    public String detail(
            @PathVariable Long id,
            Model model,
            RedirectAttributes redirectAttrs,

            @SessionAttribute(name = "loginUser", required = false) Member loginUser
//        기존 코드
//        try {
//            // 1. 로그인 ID 추출
//            String currentMemberId = null;
//            if (loginUser != null) {
//                currentMemberId = loginUser.getMemberId();
//            }
//
//            // 2. ★ [수정] 서비스 호출 (DTO 반환)
//            // 기존: Item item = itemService.findByIdForResponse(id);
//            // 변경: getItemDetailDto 사용
//            ItemResponseDto itemDto = itemService.getItemDetailDto(id, currentMemberId);
//
//            // 3. 모델에 담기 (이제 item에는 isLiked가 들어있음)
//            model.addAttribute("item", itemDto);
//
//            return "item/detail";


//        변경코드
// 1. [기존] 조회수 증가 (이미 있다면 유지)
    ) {
        try {
        itemService.incrementViewCount(id);

        // 2. [추가] 인기 점수 +1 증가 (단순 관심)
        itemService.addPopularityScore(id, 1);

        // ... (이하 기존 로직: 사용자 ID 추출 및 DTO 조회)
        String currentMemberId = (loginUser != null) ? loginUser.getMemberId() : null;
        ItemResponseDto itemDto = itemService.getItemDetailDto(id, currentMemberId);

        model.addAttribute("item", itemDto);
        return "item/detail";

        } catch (IllegalArgumentException e) {
            // 상품이 없을 경우 처리
            redirectAttrs.addFlashAttribute("errorMessage", "존재하지 않는 상품입니다.");
            return "redirect:/hotdeal";
        }

    }


    @PostMapping("/order")
    public String orderItem(
            @RequestParam Long itemId,
            @RequestParam(required = false, defaultValue = "1") int quantity,
            @RequestParam(required = false) Long selectedOption) {
        // 테스트용 로그
        System.out.println("itemId=" + itemId + ", quantity=" + quantity + ", selectedOption=" + selectedOption);

        // [추가] 주문 완료 후 인기 점수 +50점
        itemService.addPopularityScore(itemId, 50);

        return "redirect:/hotdeal"; // 임시로 목록 페이지로 리다이렉트
    }

    @GetMapping("/item/{id}")
    public String getItemDetail(
            @PathVariable Long id,
            Model model) {
        Item item = itemService.findById(id);

        // LocalDateTime -> 문자열
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String saleStartAtStr = item.getSaleStartAt().format(formatter);

        model.addAttribute("item", item);
        model.addAttribute("saleStartAtStr", saleStartAtStr);
        return "item/detail";
    }

    // 인기점수 변경: 폼 제출 방식 (예: 관리자 버튼에서 POST 호출)
    @PostMapping("/{id}/popularity")
    public String changePopularity(@PathVariable Long id,
                                   @RequestParam long delta,
                                   RedirectAttributes redirectAttrs) {
        itemService.addPopularityScore(id, delta);
        // 리다이렉트하여 상세 페이지 재조회
        return "redirect:/item/" + id;
    }
/*
    @GetMapping
    public String mainHotdeal(Model model) {
        // 1) 기존 서비스로 핫딜 상품 조회
        Page<Item> hotdealItems = itemService.searchItems(
                null,        // sellerId
                null,        // categoryId
                null,        // keyword
                null,        // minPrice
                null,        // maxPrice
                "HOTDEAL",   // saleStatus = 핫딜 상품만
                LocalDateTime.now(), // activeOn = 현재 판매 중인 상품
                PageRequest.of(0, 20) // 첫 페이지, 20개 출력
        );

        // 2) 컨트롤러 내부에서 D-Day 계산 → ItemDto로 변환
        List<ItemResponseDto> itemsWithDday = hotdealItems.getContent().stream()
                .map(item -> {
                    long daysLeft = ChronoUnit.DAYS.between(
                            LocalDate.now(),
                            item.getSaleEndAt().toLocalDate()
                    );

                    return new ItemResponseDto(item, daysLeft);  // ← 여기서 DTO 객체 생성
                })
                .toList();

        // 3) 타임리프로 전달
        model.addAttribute("items", itemsWithDday);

        return "item/list";
    }*/
}
