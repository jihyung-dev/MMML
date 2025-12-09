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
            return "seller/item-form";
        }


        // sale date 처리 ⇒ saleStart/saleEnd 변환 (Bean에는 LocalDate로 받고 여기서 LocalDateTime으로 변환)
        LocalDateTime saleStartAt = null;
        if (bean.getSaleStartDate() != null) {
            saleStartAt = bean.getSaleStartDate().atStartOfDay();
        }
        LocalDateTime saleEndAt = bean.getSaleEndDate().atStartOfDay();


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
}