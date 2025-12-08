package com.smu.householdaccount.service;



import com.smu.householdaccount.entity.OrderMain;
import com.smu.householdaccount.repository.ItemRepository;
import com.smu.householdaccount.repository.OrderMainRepository;
import com.smu.householdaccount.repository.SellerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import java.math.BigDecimal;

@RequiredArgsConstructor(onConstructor_ = @Autowired)
@Service
public class PaymentServiceImpl implements PaymentService{

    private final OrderMainRepository orderMainRepository;
    private SellerRepository sellerRepository;


    @Override
    public boolean verifyAndRecord(String merchantUid, String impUid, Long amount) {

        // 1) 조회: 주문 정보 (merchantUid로 주문 찾기)
        OrderMain order = orderMainRepository.findByMerchantUid(merchantUid).orElse(null);
        if(order == null) return false;
        if(order.getTotalAmount().compareTo(amount) != 0) return false;

        // 2) PG사(이니시스)로 최종검증 (예: 거래조회 API 호출)
        // INIAPI는 JSON 전송 불가 -> form-data (key=value)로 POST
        MultiValueMap<String, String> form = new LinkedMultiValueMap<>();
//        form.add("mid", sellerRepositorypayment-interceptor.seller_id);
        form.add("merchant_uid", merchantUid);
        form.add("imp_uid", impUid);
        // 필요한 추가 필드(주문번호, 인증 토큰 등) 추가

        return false;
    }
}
