package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.hotdeal.OrderItem;
import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.repository.hotdeal.OrderItemRepository;
import com.smu.householdaccount.repository.hotdeal.OrderMainRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@SpringBootTest
@Rollback(false)
class OrderItemRepositoryTest {
    @Autowired
    private OrderItemRepository orderItemRepository;
    @Autowired
    private OrderMainRepository orderMainRepository;

    @Test
    void saveAll() {
        String merchantUid = "order-" + UUID.randomUUID();


        String loginUserId="U034";
        Long totalPrice=180000L;
        OrderMain orderMain = new OrderMain();
        orderMain.setMerchantUid(merchantUid);
        orderMain.setBuyerId(loginUserId);
        orderMain.setTotalAmount(totalPrice);
        orderMain.setUpdatedAt(LocalDateTime.now());
        orderMain.setCreatedAt(LocalDateTime.now());
        orderMain.setOrderStatus("BASKET");
        OrderMain saveOrderMain =orderMainRepository.save(orderMain);


        OrderItem orderItem=new OrderItem();
        orderItem.setOrderId(saveOrderMain.getId());
        orderItem.setItemId(1L);
        orderItem.setOptionId(3L);
        orderItem.setPrice(BigDecimal.valueOf(10000));
        orderItem.setQty(3L);
        OrderItem orderItem2=new OrderItem();

        orderItem2.setOrderId(saveOrderMain.getId());
        orderItem2.setItemId(2L);
        orderItem2.setOptionId(6L);
        orderItem2.setPrice(BigDecimal.valueOf(30000));
        orderItem2.setQty(5L);
        List<OrderItem> orderItemList=List.of(orderItem,orderItem2);
        orderItemRepository.saveAll(orderItemList);

    }
}