package com.smu.householdaccount.service.hotdeal;

import com.smu.householdaccount.entity.hotdeal.Item;
import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.entity.hotdeal.Seller;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface SellerService {

    // 🔹 판매자 페이지에서 주문 받은 내역 조회
    Page<OrderMain> getOrderMainBySeller(Long sellerId, Pageable pageable);

    // 🔹 판매자 정보 등록 (일반 로그인 상태에서 '판매자 등록' 버튼 눌렀을 때 사용)
    Seller registerSeller(Seller seller);

    // 🔹 사업자번호 중복 체크
    boolean existsByBizNo(String bizNo);

    // 🔹 memberId 기준 판매자 조회 (해당 회원이 판매자인지 확인용)
    Seller getSellerByMemberId(String memberId);

    // 🔹 사업자번호 찾기 (member + name + phone 조합)
    String findBizNo(String memberId, String memberName, String phone);

    // 🔹 판매자가 등록한 상품 목록 페이징 조회
    Page<Item> getItemBySeller(Long sellerId, Pageable pageable);
}
