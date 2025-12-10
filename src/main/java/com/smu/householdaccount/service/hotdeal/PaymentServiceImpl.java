package com.smu.householdaccount.service.hotdeal;

import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.entity.hotdeal.PaymentTransaction;
import com.smu.householdaccount.repository.hotdeal.OrderMainRepository;
import com.smu.householdaccount.repository.hotdeal.PaymentTransactionRepository;
import com.smu.householdaccount.repository.hotdeal.SellerRepository;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import java.time.LocalDateTime;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@Service
public class PaymentServiceImpl implements PaymentService{

    private final OrderMainRepository orderMainRepository;
    private SellerRepository sellerRepository;
    private final PaymentTransactionRepository paymentTransactionRepository;
    // 재고 복구 로직이 필요하다면 ItemService 또는 HotdealOptionRepository 필요


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

    @Override
    @Transactional
    public PaymentTransaction processPayment(OrderMain orderMain, Map<String, Object> paymentReq) {

        // 1. OrderMain 상태를 PENDING 등으로 임시 업데이트 (Optional)
        //orderMain.setOrderStatus("PENDING");
        //orderMainRepository.save(orderMain);

        PaymentTransaction transaction;

        try {
            // 2. 외부 PG사/API 호출 로직 (아임포트 등)
            boolean isSuccess = callExternalPaymentApi(paymentReq); // 외부 API 호출 가정

            if (isSuccess) {
                // 3. 결제 성공: 최종 상태 및 거래 기록 저장
                orderMain.setOrderStatus("COMPLETED");
                orderMainRepository.save(orderMain);

                transaction = buildSuccessfulTransaction(orderMain, paymentReq);
            } else {
                // 4. 결제 실패: 주문을 CANCELED 상태로 전환
                // 이 로직은 결제 API의 응답을 받은 직후에 처리됩니다.
                cancelOrderAfterFailure(orderMain.getId(), "Payment API Failure");

                transaction = buildFailedTransaction(orderMain, paymentReq);
            }

        } catch (Exception e) {
            // 5. 네트워크 오류, 타임아웃 등 예외 발생 시: 주문을 CANCELED 상태로 전환
            // 이 예외 처리 덕분에 결제 중단(멈춤) 상황을 커버할 수 있습니다.
            cancelOrderAfterFailure(orderMain.getId(), "Payment Exception/Timeout: " + e.getMessage());

            // 임시 실패 거래 기록 생성 및 저장 (선택 사항)
            transaction = buildFailedTransaction(orderMain, paymentReq);
            transaction.setTxnStatus("FAILED_BY_EXCEPTION");

        }

        return paymentTransactionRepository.save(transaction);
    }


    @Override
    @Transactional
    public void cancelOrderAfterFailure(Long orderId, String reason) {
        OrderMain order = orderMainRepository.findById(orderId)
                .orElseThrow(() -> new EntityNotFoundException("Order not found: " + orderId));

        // **핵심: 주문 상태를 CANCELED로 변경**
        order.setOrderStatus("CANCELED");
        order.setUpdatedAt(LocalDateTime.now());
        orderMainRepository.save(order);

        // **중요: HOTDEAL_OPTION 재고 복구 로직 추가 (선택 사항)**
        // 주문 상품(ORDER_ITEM)에 기록된 수량만큼 HOTDEAL_OPTION의 stock을 다시 증가시켜야 합니다.
        // 예를 들어, HotdealOptionRepository와 OrderItemRepository를 사용하여 재고를 원자적으로 복구하는 로직이 이 위치에 포함됩니다.
        restoreItemStock(orderId);

        System.out.println("Order " + orderId + " has been successfully CANCELED. Reason: " + reason);
//        log.error("오류가 있나?~? [Payment Failure Cleanup] Order ID: {}, Reason: {}", orderId, reason);
    }

    @Override
    public OrderMain findOrderByMerchantUid(String merchantUid) {
        return null;
    }

    // ---------------------------------------------------------------------------------
    // 2. 헬퍼 메서드 (Helper Methods) 임시 정의
    // ---------------------------------------------------------------------------------
    // 이 메서드들은 실제 구현 내용이 없으므로, 컴파일 오류를 막기 위해 임시로 선언합니다.

    private boolean callExternalPaymentApi(Map<String, Object> paymentReq) {
        // 실제로는 외부 PG사 API 호출 로직이 들어갑니다.
        // 현재는 항상 true를 반환하도록 임시 설정합니다.
        return true;
    }

    private PaymentTransaction buildSuccessfulTransaction(OrderMain orderMain, Map<String, Object> paymentReq) {
        // 결제 성공 시 PaymentTransaction 객체를 생성하는 로직이 들어갑니다.
        return new PaymentTransaction();
    }

    private PaymentTransaction buildFailedTransaction(OrderMain orderMain, Map<String, Object> paymentReq) {
        // 결제 실패 시 PaymentTransaction 객체를 생성하는 로직이 들어갑니다.
        return new PaymentTransaction();
    }

    private void restoreItemStock(Long orderId) {
        // OrderItem을 조회하여 HotdealOption의 stock을 복구하는 로직이 들어갑니다.
        // 현재는 출력만 하도록 임시 설정합니다.
        System.out.println("Restoring stock for Order: " + orderId);
    }

}
