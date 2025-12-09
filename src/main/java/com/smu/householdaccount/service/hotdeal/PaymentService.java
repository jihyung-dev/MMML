package com.smu.householdaccount.service.hotdeal;

import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.entity.hotdeal.PaymentTransaction;

import java.util.Map;

public interface PaymentService {
    boolean verifyAndRecord(String merchantUid, String impUid, Long amount);

    /**
     * 결제 요청을 처리하고 결과를 반영합니다.
     * @param orderMain 주문 메인 Entity
     * @param paymentReq 결제 요청에 필요한 데이터 (ex: imp_uid, merchant_uid 등)
     * @return 결제 거래 기록 Entity (성공 또는 실패)
     */
    PaymentTransaction processPayment(OrderMain orderMain, Map<String, Object> paymentReq);

    /**
     * 주문을 'CANCELED' 상태로 업데이트하고 재고를 복구하는 메서드
     * @param orderId 취소할 주문 ID
     * @param reason 취소 사유
     */
    void cancelOrderAfterFailure(Long orderId, String reason);

    OrderMain findOrderByMerchantUid(String merchantUid);
}
