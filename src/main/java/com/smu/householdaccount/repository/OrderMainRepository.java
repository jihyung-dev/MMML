package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.OrderMain;
import org.aspectj.weaver.ast.Or;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface OrderMainRepository extends JpaRepository<OrderMain, Long> {

    Page<OrderMain> findBySellerId(Long sellerId, Pageable pageable);

    // merchant_uid로 주문 조회
    @EntityGraph(attributePaths = "orderItems")
    Optional<OrderMain> findByMerchantUid(String merchantUid);
    boolean existsByMerchantUid(String merchantUid); // 중복 방지용

    @Override
    <S extends OrderMain> S save(S entity);

    List<OrderMain> findByBuyerId (String buyerId);



    Optional<OrderMain> findWithItemsById(Long id);

    @Query("SELECT o FROM OrderMain o " +
            "JOIN FETCH o.orderItems oi " +
            "JOIN FETCH oi.item " +
            "WHERE o.id = :orderId")
    Optional<OrderMain> findByIdWithItems(@Param("orderId") Long orderId);

}
