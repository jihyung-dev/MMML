package com.smu.householdaccount.service.hotdeal;

import com.smu.householdaccount.entity.hotdeal.Item;
import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.entity.hotdeal.Seller;
import com.smu.householdaccount.repository.hotdeal.ItemRepository;
import com.smu.householdaccount.repository.hotdeal.OrderMainRepository;
import com.smu.householdaccount.repository.hotdeal.SellerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class SellerServiceImp implements SellerService {

    private final SellerRepository sellerRepository;
    private final ItemRepository itemRepository;
    private final OrderMainRepository orderMainRepository;

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
}
