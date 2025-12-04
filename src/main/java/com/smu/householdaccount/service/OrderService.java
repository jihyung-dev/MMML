package com.smu.householdaccount.service;


import com.smu.householdaccount.entity.OrderMain;

import java.math.BigDecimal;
import java.util.Optional;

public interface OrderService { //핫딜 전용 service(주문 생성, 재고 체크/예약, OrderItem 생성, 결제 확인 로직 등)

    //주문 생성(결제 전 단계) - 주문레코드 + 주문아이템 생성, 재고 예약 등
    //반환: 생성된 OrderMain 엔티티 또는 orderId*/
    OrderMain createHotdealOrder(String buyerId, Long itemId, Long optionId, int qty);


    //주문 취소(주문 상태만 변경, 또는 PG 취소 연동 포함)
    void cancelOrderByMerchantUid(String merchantUid);


    //결제 확정: 클라이언트에서 imp_uid/pg_tid 등을 전달하면 서버에서 PG 검증 후 결제기록 저장 및 주문 상태 변경
    //반환: 결제 성공 여부
    boolean confirmPayment(String merchantUid, String impUid, String pgTid, long amount);


    //주문 조회(merchantUid 기준)
    Optional<OrderMain> findByMerchantUid(String merchantUid);


    //최종결제금액
    BigDecimal calculatePrice(Long itemId, Long optionId, int qty);

}
