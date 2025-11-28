
package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.entity.Seller;
import com.smu.householdaccount.repository.ItemRepository;
import com.smu.householdaccount.repository.SellerRepository;
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
    private final ItemRepository itemRepository; // for 🤑 추가

    /**
     * 판매자 정보 등록
     */
    @Override
    public Seller registerSeller(Seller seller) {
        return sellerRepository.save(seller);
    }

    /**
     * 사업자번호 중복 체크
     */
    @Override
    public boolean existsByBizNo(String bizNo) {
        return sellerRepository.existsByBizNo(bizNo);
    }

    /**
     * 판매자 조회
     */
    @Override
    public Seller getSellerByMemberId(String memberId) {
        return sellerRepository.findByMember_MemberId(memberId).orElse(null);
    }

//    for 🤑 (판매자 상세 페이지)
    @Override
    public Page<Item> getItemBySeller(Long sellerId, Pageable pageable) {
        // sellerId는 이미 알고 있으므로 Seller 객체를 찾을 필요 없이 바로 Item 조회
        // 2️⃣ 해당 seller 가 등록한 Item 들을 페이징으로 조회
        return itemRepository.findBySellerId(sellerId, pageable);
    }

    @Transactional(readOnly = true)
    @Override
    public String findBizNo(String memberId, String memberName, String phone) {
        return sellerRepository
                .findByMember_MemberIdAndMember_MemberNameAndMember_Phone(memberId, memberName, phone)
                .map(Seller::getBizNo)
                .orElse(null);
    }






}
