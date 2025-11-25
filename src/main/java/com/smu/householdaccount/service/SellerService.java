package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Seller;

public interface SellerService {

    // 🔹 판매자 정보 등록 (회원가입 시 사용)
    Seller registerSeller(Seller seller);

    // 🔹 사업자번호 중복 체크
    boolean existsByBizNo(String bizNo);

    // 🔹 판매자 상세 조회
    Seller getSellerByMemberId(String memberId);
}
