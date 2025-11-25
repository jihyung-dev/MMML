
package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Seller;
import com.smu.householdaccount.repository.SellerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class SellerServiceImp implements SellerService {

    private final SellerRepository sellerRepository;

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
}
