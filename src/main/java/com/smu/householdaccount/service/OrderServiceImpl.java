package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.HotdealOption;
import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.entity.OrderItem;
import com.smu.householdaccount.entity.OrderMain;
import com.smu.householdaccount.repository.HotdealOptionRepository;
import com.smu.householdaccount.repository.ItemRepository;
import com.smu.householdaccount.repository.OrderItemRepository;
import com.smu.householdaccount.repository.OrderMainRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Optional;
import java.util.UUID;

@RequiredArgsConstructor(onConstructor_ = @Autowired)
@Service
public class OrderServiceImpl implements OrderService{

    private final OrderMainRepository orderMainRepository;
    private final ItemRepository itemRepository;
    private final OrderItemRepository orderItemRepository;
    private final HotdealOptionRepository hotdealOptionRepository;

    @Override
    @Transactional
    public OrderMain createHotdealOrder(String buyerId, Long itemId, Long optionId, int qty) {

        //1. 재고 체크, 감소
        var opt= hotdealOptionRepository.findById(optionId)
                .orElseThrow(() -> new IllegalArgumentException("옵션 없음"));
        if(opt.getStock() < qty){
            throw new IllegalStateException("재고 부족");
        }
        opt.setStock(opt.getStock()-qty);
        hotdealOptionRepository.save(opt);


        //2. OrderMain 생성??
        String merchantUid = "order-" + UUID.randomUUID();
        OrderMain order = new OrderMain();
        order.setMerchantUid(merchantUid);

        BigDecimal totalAmount = calculatePrice(itemId, optionId, qty);
        order.setTotalAmount(totalAmount.longValue());
        order.setOrderStatus("READY");
        order.setBuyerId(buyerId);
        OrderMain saved=orderMainRepository.save(order);


        //3. OrderItem 저장
        OrderItem oi=new OrderItem();
        oi.setOrderId(saved.getId());
        oi.setItemId(itemId);
        oi.setOptionId(optionId);
        oi.setQty((long) qty);
        oi.setPrice(totalAmount);
        orderItemRepository.save(oi);

        return saved;
    }

    @Override
    @Transactional
    public void cancelOrderByMerchantUid(String merchantUid) {
        var optOrder = orderMainRepository.findByMerchantUid(merchantUid)
                .orElseThrow(() -> new IllegalArgumentException("주문 없음"));
        // 상태 변경(예: CANCELED) 및 재고 복구 등 비즈니스 로직 추가
        optOrder.setOrderStatus("CANCELED");
        orderMainRepository.save(optOrder);

        // 재고 복구: 주문에 포함된 orderItems를 읽어와 옵션 재고를 복구해야 함.
        // (생략) -> 필요하면 orderItemRepository.findByOrderId(...) 후 각각 hotdealOptionRepository로 복구 구현
    }

    @Override
    @Transactional
    public boolean confirmPayment(String merchantUid, String impUid, String pgTid, long amount) {
        // 결제확인 로직: 이미 결제 트랜잭션이 기록되어 있는지, amount 일치 여부 확인 등
        var maybeOrder = orderMainRepository.findByMerchantUid(merchantUid);
        if (maybeOrder.isEmpty()) return false;
        OrderMain order = maybeOrder.get();

        // 예: 결제 성공이면 상태 변경
        order.setOrderStatus("PAID");
        orderMainRepository.save(order);

        // 결제 트랜잭션 테이블에 기록하는 로직을 여기에 추가하세요.
        return true;
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<OrderMain> findByMerchantUid(String merchantUid) {
        return orderMainRepository.findByMerchantUid(merchantUid);
    }

    @Override
    public BigDecimal calculatePrice(Long itemId, Long optionId, int qty) {
        Item item = itemRepository.findById(itemId)
                .orElseThrow(() -> new RuntimeException("상품 없음"));

        BigDecimal basePrice = item.getItemSaleprice(); // BigDecimal 타입 가정
        if (basePrice == null) basePrice = BigDecimal.ZERO;

        BigDecimal additional = BigDecimal.ZERO;
        if (optionId != null) {
            HotdealOption opt = hotdealOptionRepository.findById(optionId)
                    .orElseThrow(() -> new RuntimeException("옵션 없음"));
            if (opt.getAdditionalPrice() != null) {
                additional = opt.getAdditionalPrice();
            }
        }

        BigDecimal unitPrice = basePrice.add(additional);
        BigDecimal total = unitPrice.multiply(BigDecimal.valueOf(qty));
        // 화폐 단위 반올림 정책 필요하면 setScale(...) 사용
        total = total.setScale(0, RoundingMode.HALF_UP); // 원 단위 반올림
        return total;
    }
}
