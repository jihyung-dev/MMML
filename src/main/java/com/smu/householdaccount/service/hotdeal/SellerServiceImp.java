package com.smu.householdaccount.service.hotdeal;

import com.smu.householdaccount.dto.SellerItemNewBean;
import com.smu.householdaccount.entity.account.Category;
import com.smu.householdaccount.entity.hotdeal.*;
import com.smu.householdaccount.repository.account.CategoryRepository;
import com.smu.householdaccount.repository.hotdeal.*;
import com.smu.householdaccount.service.common.S3Service;
import jakarta.persistence.EntityManager;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class SellerServiceImp implements SellerService {

    private final SellerRepository sellerRepository;
    private final ItemRepository itemRepository;
    private final OrderMainRepository orderMainRepository;
    private final HotdealOptionRepository hotdealOptionRepository;
    private final CategoryRepository categoryRepository;
    private final ItemDetailImageRepository itemDetailImageRepository;
    private final S3Service s3Service;
    private final EntityManager em;

    /**
     * 판매자 페이지에서 주문 받은 내역 조회
     */
    @Transactional(readOnly = true)
    @Override
    public Page<OrderMain> getOrderMainBySeller(Long sellerId, Pageable pageable) {
        return orderMainRepository.findBySellerId(sellerId, pageable);
    }

    /**
     * 판매자 정보 등록
     * - 전제: 이미 MEMBER 로 일반 로그인된 상태
     * - 같은 member_id 로 이미 SELLER 가 있으면 예외 던져서 중복 등록 방지
     */
    @Override
    public Seller registerSeller(Seller seller) {

        // 방어 코드: member 가 반드시 있어야 함
        if (seller.getMember() == null) {
            throw new IllegalArgumentException("판매자 등록 시 회원 정보(Member)는 필수입니다.");
        }

        String memberId = seller.getMember().getMemberId();

        // 이미 이 회원으로 등록된 SELLER 가 있는지 확인
        boolean alreadySeller = sellerRepository.findByMember_MemberId(memberId).isPresent();
        if (alreadySeller) {
            throw new IllegalStateException("이미 판매자로 등록된 회원입니다.");
        }

        // bizNo 중복 체크 (DDL 에 UNIQUE 있지만, 서비스 레벨에서도 한 번 더 확인)
        if (existsByBizNo(seller.getBizNo())) {
            throw new IllegalStateException("이미 사용 중인 사업자번호입니다.");
        }

        // createdAt / updatedAt 은 엔티티 @PrePersist / @PreUpdate 에서 처리
        return sellerRepository.save(seller);
    }

    /**
     * 사업자번호 중복 체크
     */
    @Transactional(readOnly = true)
    @Override
    public boolean existsByBizNo(String bizNo) {
        return sellerRepository.existsByBizNo(bizNo);
    }

    /**
     * memberId 기준 판매자 조회
     * - 로그인한 회원이 판매자인지 확인할 때 사용
     */
    @Transactional(readOnly = true)
    @Override
    public Seller getSellerByMemberId(String memberId) {
        return sellerRepository.findByMember_MemberId(memberId)
                .orElse(null);
    }

    /**
     * 판매자가 등록한 상품 목록 페이징 조회
     */
    @Transactional(readOnly = true)
    @Override
    public Page<Item> getItemBySeller(Long sellerId, Pageable pageable) {
        return itemRepository.findBySellerId(sellerId, pageable);
    }


    @Override
    public void updateSeller(String memberId, Seller updatedSeller) {
        // 1) memberId 기준으로 기존 판매자 조회
        Seller existingSeller = sellerRepository.findByMember_MemberId(memberId)
                .orElseThrow(() -> new IllegalStateException("등록된 판매자 정보가 없습니다."));

        // 2) 필드 업데이트
        existingSeller.setBizNo(updatedSeller.getBizNo());
        existingSeller.setBizName(updatedSeller.getBizName());
        existingSeller.setBizPhone(updatedSeller.getBizPhone());
        existingSeller.setBizAddress(updatedSeller.getBizAddress());
        existingSeller.setUpdatedAt(java.time.LocalDateTime.now());

        // 3) 저장
        sellerRepository.save(existingSeller);
    }

    /**
     * 사업자번호 찾기
     * - memberId + memberName + phone 으로 SELLER 조회 후 bizNo 반환
     */
    @Transactional(readOnly = true)
    @Override
    public String findBizNo(String memberId, String memberName, String phone) {
        return sellerRepository
                .findByMember_MemberIdAndMember_MemberNameAndMember_Phone(memberId, memberName, phone)
                .map(Seller::getBizNo)
                .orElse(null);
    }


    @Transactional
    public void modifyItem(SellerItemNewBean bean,Long itemId) throws IOException {
        // 2) 수정 대상 상품 조회
//        Item item = itemRepository.findById(itemId)
//                .orElseThrow(() -> new RuntimeException("상품을 찾을 수 없습니다."));
        Item item=em.find(Item.class,itemId);
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
        System.out.println(item);
        // 8) 기본 상품 정보 갱신
        item.setItemName(bean.getItemName());
        item.setOriginalPrice(bean.getOriginalPrice());
        item.setItemSaleprice(bean.getItemSaleprice());
        item.setCategoryId(bean.getCategoryId());
        item.setItemImageUrl(itemImageUrl);
        item.setSaleStartAt(saleStartAt);
        item.setSaleEndAt(saleEndAt);
        // item.setSaleStatus(...); // 필요하면 상태 변경도 여기서 처리
        System.out.println(bean);
        System.out.println(item);
//        item=itemRepository.save(item);
//        em.persist(item);
        itemRepository.update(item);

        // =================================================
        // 9) 옵션 전체 재설정
        //    - 기존 옵션들 삭제 후, 폼에서 넘어온 값 기준으로 다시 저장
        // =================================================
        // 9-1) 기존 옵션 삭제
//        hotdealOptionRepository.deleteAll(existingOptions); // ⭐ 전체 삭제 후 재등록
        if(item.getHotdealOptions()!=null && !item.getHotdealOptions().isEmpty()){
            hotdealOptionRepository.deleteAllByItemId(item.getId());
        }
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
//            itemDetailImageRepository.deleteAll(oldImages);
            if(item.getDetailImages()!=null && !item.getDetailImages().isEmpty()){
                itemDetailImageRepository.deleteAllByItemId(item.getId());
            }

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

    }
}
