package com.smu.householdaccount.repository.hotdeal;

import com.smu.householdaccount.entity.hotdeal.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
    @Override
    <S extends OrderItem> List<S> saveAll(Iterable<S> entities);

    // ✅ [추가] 특정 상품에 대한 주문 존재 여부 체크
    //    - true : 주문이 1건 이상 있음 → 삭제 불가
    //    - false: 주문 없음 → 삭제 가능
    boolean existsByItemId(Long itemId);


}
