package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
    @Override
    <S extends OrderItem> List<S> saveAll(Iterable<S> entities);
}
