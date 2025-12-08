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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/hotdeal")
@AllArgsConstructor
@Slf4j
public class ItemController {    // 명시적 생성자 주입 (Lombok 없이 안전)
    private final ItemService itemService;
    private final CategoryRepository categoryRepository;

    /*@GetMapping
    public String list(Model model,@PageableDefault(size = 10,page = 0,sort = "createdAt",direction = Sort.Direction.DESC) Pageable pageable){
        Page<Item> itemPage=itemService.findByCategory("H01",pageable);
        model.addAttribute("itemPage",itemPage);

        return "hotdeal/list";
    }*/


    // 목록: 검색 파라미터 모두 optional
    @GetMapping
    public String list(
            @RequestParam(required = false) Long sellerId,
            @RequestParam(required = false) String categoryId,
            @RequestParam(required = false) String q,
            @RequestParam(required = false) BigDecimal minPrice,
            @RequestParam(required = false) BigDecimal maxPrice,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDateTime date,
            @PageableDefault(page=0, size = 8, sort = "id", direction = Sort.Direction.DESC) Pageable pageable,
            Model model,

            // ★ [수정] 로그인 사용자 정보 가져오기 (ItemWishController와 동일한 방식)
            // required = false로 해야 비로그인 사용자도 목록을 볼 수 있음
            @SessionAttribute(name = "loginUser", required = false) Member loginUser
    ) {
        Page<Item> itemPage = itemService.searchItems(sellerId, categoryId, q, minPrice, maxPrice, status, date, pageable);

        //수정 주석처리
        //model.addAttribute("itemPage", itemPage);
        log.info("itemPage.content : {}", itemPage.getContent());

        // 2. ★ [추가] 로그인한 멤버 ID 추출
        String currentMemberId = null;
        if (loginUser != null) {
            currentMemberId = loginUser.getMemberId();
        }
        // ★ 이 로그를 확인해보세요!
        System.out.println("현재 로그인 ID: " + currentMemberId);

        // 3. ★ [핵심] 엔티티 -> DTO 변환 (여기서 DB 조회하여 찜 여부를 채움)
        Page<ItemResponseDto> dtoPage = itemService.convertToDto(itemPage, currentMemberId);

        // 4. 모델에 담기 (DTO 페이지를 넘겨줌)
        model.addAttribute("itemPage", dtoPage);

        // 카테고리 목록 조회
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
//    수정 주석처리
//    ) {
//        // 1️⃣ 조회수 증가 (원자적 업데이트)
//        itemService.incrementViewCount(id);
//
//        // 2️⃣ 아이템 조회
//        Item item = itemService.findByIdForResponse(id);
//        if(item == null){
//            redirectAttrs.addFlashAttribute("errorMessage", "존재하지 않는 상품입니다.");
//            return "redirect:/hotdeal";
//        }
            @SessionAttribute(name = "loginUser", required = false) Member loginUser
    ) {
        try {
            // 1. 로그인 ID 추출
            String currentMemberId = null;
            if (loginUser != null) {
                currentMemberId = loginUser.getMemberId();
            }

            // 2. ★ [수정] 서비스 호출 (DTO 반환)
            // 기존: Item item = itemService.findByIdForResponse(id);
            // 변경: getItemDetailDto 사용
            ItemResponseDto itemDto = itemService.getItemDetailDto(id, currentMemberId);

            // 3. 모델에 담기 (이제 item에는 isLiked가 들어있음)
            model.addAttribute("item", itemDto);

            return "item/detail";

        } catch (IllegalArgumentException e) {
            // 상품이 없을 경우 처리
            redirectAttrs.addFlashAttribute("errorMessage", "존재하지 않는 상품입니다.");
            return "redirect:/hotdeal";
        }

//        model.addAttribute("item", item);
//
//        // 옵션 그룹 만들기 (예: 옵션 타입별로 그룹핑)
//        Map<String, List<HotdealOption>> optionGroups = item.getHotdealOptions().stream()
//                .collect(Collectors.groupingBy(
//                        HotdealOption::getOptionType, // key: 옵션 타입
//                        LinkedHashMap::new,           // 순서 유지
//                        Collectors.toList()           // value: 옵션 리스트
//                ));
//        model.addAttribute("optionGroups", optionGroups);
//        return "item/detail";
    }


    @PostMapping("/order")
    public String orderItem(
            @RequestParam Long itemId,
            @RequestParam(required = false, defaultValue = "1") int quantity,
            @RequestParam(required = false) Long selectedOption) {
        // 테스트용 로그
        System.out.println("itemId=" + itemId + ", quantity=" + quantity + ", selectedOption=" + selectedOption);
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

}
