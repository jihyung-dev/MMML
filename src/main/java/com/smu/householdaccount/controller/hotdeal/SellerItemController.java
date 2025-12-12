package com.smu.householdaccount.controller.hotdeal;

import com.smu.householdaccount.dto.SellerItemNewBean;
import com.smu.householdaccount.entity.account.Category;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.entity.hotdeal.HotdealOption;
import com.smu.householdaccount.entity.hotdeal.Item;
import com.smu.householdaccount.entity.hotdeal.ItemDetailImage;
import com.smu.householdaccount.entity.hotdeal.Seller;
import com.smu.householdaccount.repository.account.CategoryRepository;
import com.smu.householdaccount.repository.hotdeal.HotdealOptionRepository;
import com.smu.householdaccount.repository.hotdeal.ItemDetailImageRepository;
import com.smu.householdaccount.repository.hotdeal.ItemRepository;
import com.smu.householdaccount.repository.hotdeal.OrderItemRepository; // ⭐ 삭제/주문 여부 체크용 (현재는 미사용)
import com.smu.householdaccount.service.common.S3Service;
import com.smu.householdaccount.service.hotdeal.SellerService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/seller/item")
@RequiredArgsConstructor
@Slf4j
public class SellerItemController {

    private final ItemRepository itemRepository;
    private final HotdealOptionRepository hotdealOptionRepository;
    private final CategoryRepository categoryRepository;
    private final ItemDetailImageRepository itemDetailImageRepository;
    private final S3Service s3Service;
    private final SellerService sellerService;
    private final OrderItemRepository orderItemRepository; // ⭐ 나중에 "이미 주문된 상품 삭제 방지"에 사용할 예정

    /** 판매자 본인이 등록한 상품 목록 */
    @GetMapping
    public String list(
            Model model,
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            @PageableDefault(page = 0, size = 10, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable
    ) {
        if (loginUser == null) {
            return "redirect:/login";
        }

        Seller seller = sellerService.getSellerByMemberId(loginUser.getMemberId());
        if (seller == null) {
            return "redirect:/seller/join";
        }

        Page<Item> itemPage = itemRepository.findBySellerId(seller.getId(), pageable);
        model.addAttribute("itemPage", itemPage);

        return "seller/items";
    }

    /** 판매자 상품 상세(대시보드용) */
    @GetMapping("/{itemId}")
    public String dashboard(
            @PathVariable Long itemId,
            Model model) {

        Item item = itemRepository.findWithCategoryWithHotdealOptionsById(itemId)
                .orElseThrow(() -> new RuntimeException("Item not found"));

        model.addAttribute("item", item);

        return "seller/item";
    }


    // =====================================================
    // ✅ 판매자 상품 수정 폼 진입
    //  - URL: GET /seller/item/{itemId}/edit
    //  - 역할: 기존 상품 정보를 SellerItemNewBean에 채워서
    //          등록 폼(seller/item-form.html)을 재사용
    // =====================================================
    @GetMapping("/{itemId}/edit")
    public String showEditForm(
            @PathVariable Long itemId,
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            Model model
    ) {
        // 1) 로그인 체크
        if (loginUser == null) {
            return "redirect:/login";
        }

        // 2) 현재 로그인한 회원의 판매자 정보 조회
        Seller seller = sellerService.getSellerByMemberId(loginUser.getMemberId());
        if (seller == null) {
            return "redirect:/seller/join";
        }

        // 3) 수정 대상 상품 조회
        Item item = itemRepository.findById(itemId)
                .orElseThrow(() -> new RuntimeException("상품을 찾을 수 없습니다."));

        // 4) 소유권 체크: 다른 판매자의 상품이면 목록으로 돌려보냄
        if (!item.getSellerId().equals(seller.getId())) {
            return "redirect:/seller/item";
        }

        // 5) 기존 Item → 폼 Bean으로 변환하여 화면에 바인딩
        SellerItemNewBean bean = new SellerItemNewBean();
        bean.setItemName(item.getItemName());
        bean.setOriginalPrice(item.getOriginalPrice());
        bean.setItemSaleprice(item.getItemSaleprice());
        bean.setCategoryId(item.getCategoryId());
        bean.setItemImageUrl(item.getItemImageUrl()); // ⭐ 기존 대표 이미지 URL 기억

        if (item.getSaleStartAt() != null) {
            bean.setSaleStartDate(item.getSaleStartAt().toLocalDate());
        }
        if (item.getSaleEndAt() != null) {
            bean.setSaleEndDate(item.getSaleEndAt().toLocalDate());
        }

        // 6) 옵션 목록 → Bean의 리스트들에 채우기
        List<HotdealOption> options = hotdealOptionRepository.findByItemId(item.getId());
        bean.setOptionType(options.stream().map(HotdealOption::getOptionType).toList());
        bean.setOptionValue(options.stream().map(HotdealOption::getOptionValue).toList());
        bean.setAdditionalPrice(options.stream().map(HotdealOption::getAdditionalPrice).toList());
        bean.setStock(options.stream().map(HotdealOption::getStock).toList());

        // 7) 모델에 폼 객체 + 모드 + itemId 담기
        model.addAttribute("sellerItemNewBean", bean);
        model.addAttribute("itemId", itemId);   // ⭐ form action 에서 사용
        model.addAttribute("mode", "edit");     // ⭐ 등록/수정 구분용 플래그

        // 8) 공통 폼용 데이터(카테고리 등) 셋팅
        prepareFormModel(model);

        // 👉 등록 폼(seller/item-form.html)을 재사용
        return "seller/item-form";
    }


    // =====================================================
    // ✅ 판매자 상품 수정 처리
    //  - URL: POST /seller/item/{itemId}/edit
    //  - 역할: 기존 상품 + 옵션 + 상세이미지 전체 갱신
    // =====================================================
    @PostMapping("/{itemId}/edit")
    public String updateItem(
            @PathVariable Long itemId,
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            @Valid @ModelAttribute("sellerItemNewBean") SellerItemNewBean bean,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes redirectAttributes
    ) throws IOException {

        // 1) 로그인 / 판매자 여부 체크
        if (loginUser == null) {
            return "redirect:/login";
        }
        Seller seller = sellerService.getSellerByMemberId(loginUser.getMemberId());
        if (seller == null) {
            return "redirect:/seller/join";
        }

        // 2) 수정 대상 상품 조회
        Item item = itemRepository.findById(itemId)
                .orElseThrow(() -> new RuntimeException("상품을 찾을 수 없습니다."));

        // 3) 소유권 체크
        if (!item.getSellerId().equals(seller.getId())) {
            redirectAttributes.addFlashAttribute("error", "본인이 등록한 상품만 수정할 수 있습니다.");
            return "redirect:/seller/item";
        }

        // 4) Bean Validation 에러가 있으면 다시 폼으로
        if (bindingResult.hasErrors()) {
            prepareFormModel(model);
            model.addAttribute("itemId", itemId);
            model.addAttribute("mode", "edit"); // ⭐ 에러 시에도 모드 유지
            return "seller/item-form";
        }

        // 5) 판매 기간(LocalDate → LocalDateTime)
        LocalDateTime saleStartAt = null;
        if (bean.getSaleStartDate() != null) {
            saleStartAt = bean.getSaleStartDate().atStartOfDay();
        }

        // ⭐ [수정] saleEndDate 널일 때 NPE 방지 + 기존 값 유지
        LocalDateTime saleEndAt = item.getSaleEndAt(); // 기본값: 기존 종료일 유지
        if (bean.getSaleEndDate() != null) {
            saleEndAt = bean.getSaleEndDate().atStartOfDay();
        }

        // 6) 카테고리 조회
        Category category = categoryRepository.findById(bean.getCategoryId())
                .orElseThrow(() -> new RuntimeException("존재하지 않는 카테고리입니다."));

        // 7) 대표 이미지 URL 처리
        String itemImageUrl = bean.getItemImageUrl();    // 폼에서 온 URL (수정 폼에서는 보통 null)
        MultipartFile itemImageFile = bean.getItemImageFile();

        if (itemImageUrl == null || itemImageUrl.isBlank()) {
            if (itemImageFile != null && !itemImageFile.isEmpty()) {
                // 새 파일 업로드 → URL 갱신
                itemImageUrl = s3Service.upload(itemImageFile, "item");
            } else {
                // 아무 입력도 없으면 기존 이미지 유지
                itemImageUrl = item.getItemImageUrl();
            }
        }

        // 8) 기본 상품 정보 갱신
        item.setItemName(bean.getItemName());
        item.setOriginalPrice(bean.getOriginalPrice());
        item.setItemSaleprice(bean.getItemSaleprice());
        item.setCategoryId(bean.getCategoryId());
        item.setCategory(category);
        item.setItemImageUrl(itemImageUrl);
        item.setSaleStartAt(saleStartAt);
        item.setSaleEndAt(saleEndAt);
        // item.setSaleStatus(...); // 필요하면 상태 변경도 여기서 처리

        itemRepository.save(item);

        // =================================================
        // 9) 옵션 전체 재설정
        //    - 기존 옵션들 삭제 후, 폼에서 넘어온 값 기준으로 다시 저장
        // =================================================
        // 9-1) 기존 옵션 삭제
        List<HotdealOption> existingOptions = hotdealOptionRepository.findByItemId(item.getId());
        hotdealOptionRepository.deleteAll(existingOptions); // ⭐ 전체 삭제 후 재등록

        // 9-2) 신규 옵션 저장 (등록 로직과 동일)
        List<String> optionType = bean.getOptionType();
        List<String> optionValue = bean.getOptionValue();
        List<BigDecimal> additionalPrice = bean.getAdditionalPrice();
        List<Long> stock = bean.getStock();

        if (optionType != null && optionValue != null) {
            for (int i = 0; i < optionType.size(); i++) {
                String type = optionType.get(i);
                String value = optionValue.get(i);

                if (type == null || type.isBlank() || value == null || value.isBlank()) continue;

                BigDecimal addPrice =
                        (additionalPrice != null && additionalPrice.size() > i && additionalPrice.get(i) != null)
                                ? additionalPrice.get(i)
                                : BigDecimal.ZERO;

                Long stk =
                        (stock != null && stock.size() > i && stock.get(i) != null)
                                ? stock.get(i)
                                : 0L;

                HotdealOption opt = new HotdealOption();
                opt.setItemId(item.getId());
                opt.setOptionType(type);
                opt.setOptionValue(value);
                opt.setAdditionalPrice(addPrice);
                opt.setStock(stk);

                hotdealOptionRepository.save(opt);
            }
        }

        // =================================================
        // 10) 상세 이미지 전체 재설정
        //     - 새 이미지가 올라온 경우에만 교체하고,
        //       아무 파일도 안 올리면 기존 이미지 유지
        // =================================================
        MultipartFile[] detailImageFiles = bean.getDetailImageFiles();

        // ⭐ [수정] 새 파일이 있을 때만 기존 이미지 삭제 + 재등록
        boolean hasNewDetailImages = false;
        if (detailImageFiles != null) {
            for (MultipartFile f : detailImageFiles) {
                if (f != null && !f.isEmpty()) {
                    hasNewDetailImages = true;
                    break;
                }
            }
        }

        if (hasNewDetailImages) {
            // 기존 이미지 전체 삭제
            List<ItemDetailImage> oldImages = itemDetailImageRepository.findByItemId(item.getId());
            itemDetailImageRepository.deleteAll(oldImages);

            // 새 이미지 등록
            for (int i = 0; i < detailImageFiles.length; i++) {
                MultipartFile file = detailImageFiles[i];
                if (file == null || file.isEmpty()) continue;

                String url = s3Service.upload(file, "item");
                ItemDetailImage img = new ItemDetailImage();
                img.setItemId(item.getId());
                img.setImageUrl(url);
                img.setDisplayOrder((long) i);
                itemDetailImageRepository.save(img);
            }
        }

        redirectAttributes.addFlashAttribute("message", "상품이 수정되었습니다.");
        return "redirect:/seller/item/" + itemId;
    }




    // 🔥 등록 폼 열기
    @GetMapping("/new")
    public String showCreateForm(
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            Model model
    ) {
        if (loginUser == null) {
            return "redirect:/login";
        }

        Seller seller = sellerService.getSellerByMemberId(loginUser.getMemberId());
        if (seller == null) {
            return "redirect:/seller/join";
        }

        model.addAttribute("sellerItemNewBean", new SellerItemNewBean());
        prepareFormModel(model);
        model.addAttribute("mode", "new"); // ⭐ 등록 모드 플래그

        return "seller/item-form";
    }


    // 🔥 판매자 상품 등록 처리 (검증 ⇒ 빈 사용)
    @PostMapping("/new")
    public String createItem(
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            @Valid @ModelAttribute("sellerItemNewBean") SellerItemNewBean bean,
            BindingResult bindingResult,
            Model model
    ) throws IOException {

        // 1) 로그인 / 판매자 여부 체크
        if (loginUser == null) {
            return "redirect:/login";
        }

        Seller seller = sellerService.getSellerByMemberId(loginUser.getMemberId());
        if (seller == null) {
            return "redirect:/seller/join";
        }

        // 기본 Bean 검증 실패 시
        if (bindingResult.hasErrors()) {
            prepareFormModel(model);
            model.addAttribute("mode", "new"); // ⭐ 에러 시에도 등록 모드 유지
            return "seller/item-form";
        }

        // sale date 처리 ⇒ saleStart/saleEnd 변환 (Bean에는 LocalDate로 받고 여기서 LocalDateTime으로 변환)
        LocalDateTime saleStartAt = null;
        if (bean.getSaleStartDate() != null) {
            saleStartAt = bean.getSaleStartDate().atStartOfDay();
        }

        // ⭐ [수정] 등록 시에도 saleEndDate 널 체크
        LocalDateTime saleEndAt = null;
        if (bean.getSaleEndDate() != null) {
            saleEndAt = bean.getSaleEndDate().atStartOfDay();
        }

        // 카테고리 조회
        Category category = categoryRepository.findById(bean.getCategoryId())
                .orElseThrow(() -> new RuntimeException("존재하지 않는 카테고리입니다."));

        // 메인 이미지 처리: 폼에 itemImageUrl 직접 입력 가능, 없으면 업로드된 파일로 처리
        String itemImageUrl = bean.getItemImageUrl();
        MultipartFile itemImageFile = bean.getItemImageFile();
        if ((itemImageUrl == null || itemImageUrl.isBlank()) && itemImageFile != null && !itemImageFile.isEmpty()) {
            itemImageUrl = s3Service.upload(itemImageFile, "item");
        }

        // ------------ ITEM 저장 ------------
        Item item = new Item();
        item.setSellerId(seller.getId());
        item.setItemName(bean.getItemName());
        item.setOriginalPrice(bean.getOriginalPrice());
        item.setItemSaleprice(bean.getItemSaleprice());
        item.setCategoryId(bean.getCategoryId());
        item.setCategory(category);
        item.setItemImageUrl(itemImageUrl);
        item.setSaleStartAt(saleStartAt);
        item.setSaleEndAt(saleEndAt);
        item.setSaleStatus("ON_SALE");

        item = itemRepository.save(item);

        // ------------ 옵션 여러 개 저장 ------------
        List<String> optionType = bean.getOptionType();
        List<String> optionValue = bean.getOptionValue();
        List<BigDecimal> additionalPrice = bean.getAdditionalPrice();
        List<Long> stock = bean.getStock();

        if (optionType != null && optionValue != null) {
            for (int i = 0; i < optionType.size(); i++) {
                String type = optionType.get(i);
                String value = optionValue.get(i);

                if (type == null || type.isBlank() || value == null || value.isBlank()) continue;

                BigDecimal addPrice =
                        (additionalPrice != null && additionalPrice.size() > i && additionalPrice.get(i) != null)
                                ? additionalPrice.get(i)
                                : BigDecimal.ZERO;

                Long stk =
                        (stock != null && stock.size() > i && stock.get(i) != null)
                                ? stock.get(i)
                                : 0L;

                HotdealOption opt = new HotdealOption();
                opt.setItemId(item.getId());
                opt.setOptionType(type);
                opt.setOptionValue(value);
                opt.setAdditionalPrice(addPrice);
                opt.setStock(stk);

                hotdealOptionRepository.save(opt);
            }
        }

        // ------------ 상세 이미지 여러 개 저장 ------------
        MultipartFile[] detailImageFiles = bean.getDetailImageFiles();
        if (detailImageFiles != null) {
            for (int i = 0; i < detailImageFiles.length; i++) {
                MultipartFile file = detailImageFiles[i];
                if (file == null || file.isEmpty()) continue;

                String url = s3Service.upload(file, "item");
                ItemDetailImage img = new ItemDetailImage();
                img.setItemId(item.getId());
                img.setImageUrl(url);
                img.setDisplayOrder((long) i);
                itemDetailImageRepository.save(img);
            }
        }

        return "redirect:/seller/item";
    }

    /**
     * 폼에 필요한 공통 모델 데이터 추가 (중복 제거)
     */
    private void prepareFormModel(Model model) {
        List<Category> categories = categoryRepository.findByCategoryIdStartingWith("H");
        model.addAttribute("categories", categories);
        // sellerItemNewBean은 컨트롤러 핸들러에서 이미 모델에 있으므로 여기서는 따로 넣지 않아도 됨.
    }

    // =====================================================
    // ✅ 판매자 상품 삭제
    //  - URL:  /seller/item/{itemId}/delete
    //  - method: GET, POST 둘 다 허용 (a 링크, form 둘 다 대응)
    // =====================================================
    @RequestMapping(value = "/{itemId}/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteItem(
            @PathVariable Long itemId,
            @SessionAttribute(value = "loginUser", required = false) Member loginUser,
            RedirectAttributes redirectAttributes
    ) {
        // 1) 로그인 체크
        if (loginUser == null) {
            return "redirect:/login";
        }

        // 2) 현재 로그인한 회원의 판매자 정보
        Seller seller = sellerService.getSellerByMemberId(loginUser.getMemberId());
        if (seller == null) {
            redirectAttributes.addFlashAttribute("error", "판매자만 상품을 삭제할 수 있습니다.");
            return "redirect:/seller/join";
        }

        // 3) 삭제 대상 상품 조회
        Item item = itemRepository.findById(itemId)
                .orElseThrow(() -> new RuntimeException("상품을 찾을 수 없습니다."));

        // 4) 소유권 체크 (본인 상품인지)
        if (!item.getSellerId().equals(seller.getId())) {
            redirectAttributes.addFlashAttribute("error", "본인이 등록한 상품만 삭제할 수 있습니다.");
            return "redirect:/seller/item";
        }

        // 5) 주문 사용 여부 체크 → 주문에 사용된 상품은 삭제 불가
        if (orderItemRepository.existsByItemId(itemId)) {
            redirectAttributes.addFlashAttribute("error", "이미 주문에 사용된 상품은 삭제할 수 없습니다.");
            return "redirect:/seller/item/" + itemId;
        }

        // 6) 자식 엔티티(옵션, 상세이미지 등) 먼저 삭제
        //    - 옵션
        List<HotdealOption> options = hotdealOptionRepository.findByItemId(item.getId());
        hotdealOptionRepository.deleteAll(options);

        //    - 상세 이미지
        List<ItemDetailImage> images = itemDetailImageRepository.findByItemId(item.getId());
        itemDetailImageRepository.deleteAll(images);

        // TODO: ItemWish(찜) 같은 다른 연관 테이블이 있으면 여기서 같이 삭제

        // 7) 마지막으로 Item 삭제
        itemRepository.delete(item);

        // 8) 성공 메시지 후 목록으로 이동
        redirectAttributes.addFlashAttribute("message", "상품이 삭제되었습니다.");
        return "redirect:/seller/item";
    }





}
