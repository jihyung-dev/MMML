package com.smu.householdaccount.service.hotdeal;

import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.repository.hotdeal.OrderMainRepository;
import com.smu.householdaccount.repository.hotdeal.PaymentTransactionRepository;
import com.smu.householdaccount.repository.hotdeal.SellerRepository;
import jakarta.persistence.EntityNotFoundException;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

// Mockito를 사용하여 테스트 환경을 확장합니다.
@ExtendWith(MockitoExtension.class)
class PaymentServiceImplTest {

    // 테스트 대상 Service에 Mock 객체들을 주입합니다.
    @InjectMocks
    PaymentServiceImpl paymentService;

    // Service가 의존하는 Repository들을 Mock 객체로 만듭니다.
    @Mock
    OrderMainRepository orderMainRepository;
    @Mock
    SellerRepository sellerRepository;
    @Mock
    PaymentTransactionRepository paymentTransactionRepository;
    // Mock 객체화 필요: private void restoreItemStock(Long orderId) 내부에서 사용되는 Repository들
    // ...

    // restoreItemStock 메서드를 Mock 처리합니다.
    private void restoreItemStock(Long orderId) {
        // 실제 재고 복구 로직 대신 아무것도 하지 않도록 Mock 처리
    }

    // restoreItemStock 메서드가 Service에 정의된 헬퍼 메서드이므로,
    // 실제 테스트에서는 private 메서드에 직접 접근하기 어려워 별도의 처리(예: Reflection)가 필요하지만,
    // 여기서는 테스트 코드를 간결하게 만들기 위해 Service 내부에 있다고 가정합니다.

    @Test
    void 주문_취소_실패_시_CANCELED로_상태가_변경되어야_한다() {
        // 1. Given (테스트를 위한 준비)
        Long testOrderId = 100L;
        String initialStatus = "PENDING";

        // 가상의 OrderMain 객체 생성 (Lombok의 @Data 사용 가정)
        OrderMain mockOrder = new OrderMain();
        mockOrder.setId(testOrderId);
        mockOrder.setOrderStatus(initialStatus);
        mockOrder.setCreatedAt(LocalDateTime.now().minusMinutes(5));

        // Repository의 findById 호출 시 mockOrder를 반환하도록 설정 (Stubbing)
        when(orderMainRepository.findById(testOrderId)).thenReturn(Optional.of(mockOrder));

        // 2. When (테스트 대상 메서드 실행)
        String reason = "Payment API Failure";
        // restoreItemStock은 private 메서드이거나 Mockito로 처리하기 어려우므로,
        // 실제 구현 로직이 Service 내부에 있을 경우 Mocking이 필요합니다.
        // 현재는 System.out.println만 하므로 무시합니다.

        paymentService.cancelOrderAfterFailure(testOrderId, reason);

        // 3. Then (결과 검증)

        // a. 주문 상태가 CANCELED로 변경되었는지 확인
        assertEquals("CANCELED", mockOrder.getOrderStatus(), "주문 상태가 CANCELED로 변경되어야 합니다.");

        // b. orderMainRepository.save(order)가 정확히 한 번 호출되었는지 확인
        verify(orderMainRepository, times(1)).save(mockOrder);

        // c. 업데이트 시간이 변경되었는지 확인
        assertNotNull(mockOrder.getUpdatedAt(), "업데이트 시간이 설정되어야 합니다.");

        // d. 재고 복구 메서드(restoreItemStock)가 호출되었는지 확인 (실제 restoreItemStock 로직이 Service에 있다면 verify가 필요)
        // 현재 코드 상 restoreItemStock은 private 헬퍼 메서드로 가정하고, save 호출 여부만 검증합니다.
    }

    @Test
    void 존재하지_않는_주문ID일_경우_예외가_발생해야_한다() {
        // 1. Given
        Long nonExistentOrderId = 999L;

        // findById 호출 시 Empty Optional 반환 설정
        when(orderMainRepository.findById(nonExistentOrderId)).thenReturn(Optional.empty());

        // 2. When & 3. Then
        // EntityNotFoundException이 발생하는지 검증
        assertThrows(EntityNotFoundException.class, () -> {
            paymentService.cancelOrderAfterFailure(nonExistentOrderId, "Test reason");
        }, "존재하지 않는 주문ID에 대해서는 EntityNotFoundException이 발생해야 합니다.");

        // 예외 발생 시 save 메서드가 호출되지 않았는지 확인
        verify(orderMainRepository, never()).save(any(OrderMain.class));
    }
}