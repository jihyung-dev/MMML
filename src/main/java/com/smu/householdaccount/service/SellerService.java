package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.entity.OrderMain;
import com.smu.householdaccount.entity.Seller;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface SellerService {
    // 판매자 페이지에서 주문 받은 내역 (OrderMain)
    Page<OrderMain> getOrderMainBySeller(Long sellerId, Pageable pageable);

    // 🔹 판매자 정보 등록 (회원가입 시 사용)
    Seller registerSeller(Seller seller);

    // 🔹 사업자번호 중복 체크
    boolean existsByBizNo(String bizNo);

    // 🔹 판매자 상세 조회
    Seller getSellerByMemberId(String memberId);

    // 🤑 (판매자 상세 페이지에 들어가는 내용) 페이징으로 판매자 상품 조회
    Page<Item> getItemBySeller(Long sellerId, Pageable pageable);
}
