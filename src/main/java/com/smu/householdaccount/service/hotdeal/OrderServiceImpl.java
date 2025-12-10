package com.smu.householdaccount.service.hotdeal;

import com.smu.householdaccount.dto.HotdealOrderBean;
import com.smu.householdaccount.entity.hotdeal.HotdealOption;
import com.smu.householdaccount.entity.hotdeal.Item;
import com.smu.householdaccount.entity.hotdeal.OrderItem;
import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.entity.hotdeal.OrderStatus;
import com.smu.householdaccount.repository.hotdeal.HotdealOptionRepository;
import com.smu.householdaccount.repository.hotdeal.ItemRepository;
import com.smu.householdaccount.repository.hotdeal.OrderItemRepository;
import com.smu.householdaccount.repository.hotdeal.OrderMainRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Slf4j
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@Service
public class OrderServiceImpl implements OrderService{

    private final OrderMainRepository orderMainRepository;
    private final ItemRepository itemRepository;
    private final OrderItemRepository orderItemRepository;
    private final HotdealOptionRepository hotdealOptionRepository;
    private Item item;

    @Override
    @Transactional
    public OrderMain createHotdealOrder(String buyerId, Long itemId, Long optionId, int qty) {

        //1. 재고 체크, 감소
        /*var opt= hotdealOptionRepository.findById(optionId)
                .orElseThrow(() -> new IllegalArgumentException("옵션 없음"));
        if(opt.getStock() < qty){
            throw new IllegalStateException("재고 부족");
        }
        opt.setStock(opt.getStock()-qty);
        hotdealOptionRepository.save(opt); // 옵션 재고 업데이트*/
        //└─ 밑에 confirmPayment()로 이동


        //2. OrderMain 생성
        String merchantUid = "order-" + UUID.randomUUID();
        OrderMain order = new OrderMain();
        order.setMerchantUid(merchantUid);

        BigDecimal totalAmount = calculatePrice(itemId, optionId, qty);
        order.setTotalAmount(totalAmount.longValue());

        // [수정] 주문 상태 READY → PENDING으로 설정
        order.setOrderStatus("PENDING");
        order.setBuyerId(buyerId);
        OrderMain saved=orderMainRepository.save(order);


        //3. OrderItem 저장
        OrderItem oi=new OrderItem();
//        oi.setOrderId(saved.getId());
        oi.setItem(item);
        oi.setItemId(itemId);
        oi.setOptionId(optionId);
        oi.setQty((long) qty);
        oi.setPrice(totalAmount);
        oi.setOrder(saved); //OrderItem.serOrder() 사용 ⇒ OrderMain 객체 연결
        orderItemRepository.save(oi);

        return saved;
    }
    @Transactional
    @Override
    public OrderMain createHotdealOrder(HotdealOrderBean hotdealOrderBean) {
        // 1) item 존재 여부(최소 1개 아이템) 확인
        if (hotdealOrderBean.getOptionId() == null || hotdealOrderBean.getOptionId().isEmpty()) {
            throw new IllegalArgumentException("옵션이 비어있습니다.");
        }

        // 옵션 목록 조회 (이미 service에서 options 변수로 조회하셨던 로직과 유사)
        List<HotdealOption> options = hotdealOptionRepository.findAllById(hotdealOrderBean.getOptionId());
        if (options == null || options.isEmpty()) {
            throw new IllegalArgumentException("삭제된 아이템 옵션 입니다.");
        }

        // --- 성능 개선: 모든 itemId를 모아서 한 번에 Item들을 조회 ---
        Set<Long> itemIds = options.stream()
                .map(HotdealOption::getItemId)
                .collect(Collectors.toSet());

        List<Item> items = itemRepository.findAllById(itemIds); // 한 번에 조회
        Map<Long, Item> itemMap = items.stream()
                .collect(Collectors.toMap(Item::getId, Function.identity()));

        // 검사: 모든 option의 item이 존재하는지 확인
        for (HotdealOption option : options) {
            if (!itemMap.containsKey(option.getItemId())) {
                throw new IllegalStateException("옵션에 연결된 상품이 없습니다. itemId=" + option.getItemId());
            }
        }

        // 주문아이템 생성 및 총액 계산
        List<OrderItem> orderItems = new ArrayList<>();
        long totalAmount = 0L;

        for (int i = 0; i < options.size(); i++) {
            HotdealOption option = options.get(i);
            long additionalPrice = option.getAdditionalPrice() != null ? option.getAdditionalPrice().longValue() : 0L;
            long quantity = hotdealOrderBean.getQuantity().get(i); // 가정: quantity 리스트 길이 == options 길이
            long salePrice = itemMap.get(option.getItemId()).getItemSaleprice().longValue();

            long amount = (additionalPrice + salePrice) * quantity;
            totalAmount += amount;

            // OrderItem 생성
            OrderItem orderItem = new OrderItem();


            // 반드시 item 엔티티를 세팅해서 템플릿에서 oi.item.itemName을 바로 사용할 수 있게 함
            Item item = itemMap.get(option.getItemId());
            orderItem.setItem(item);
            orderItem.setOption(option);

            orderItem.setItemId(option.getItemId());
            orderItem.setQty(hotdealOrderBean.getQuantity().get(i));
            orderItem.setPrice(BigDecimal.valueOf(amount));

            orderItems.add(orderItem);
        }

        // OrderMain 생성 및 저장
        OrderMain orderMain = new OrderMain();
        orderMain.setBuyerId(hotdealOrderBean.getBuyerId());
        orderMain.setTotalAmount(totalAmount);
        orderMain.setSellerId(hotdealOrderBean.getSellerId());
        orderMain.setOrderStatus("PENDING");
        orderMain.setMerchantUid("order-" + UUID.randomUUID());
        orderMain = orderMainRepository.save(orderMain);

        // OrderItem에 주문 설정 (양방향 설정)
        for (OrderItem orderItem : orderItems) {
            orderItem.setOrder(orderMain); // order.setOrder(...) 내부에서 orderId도 세팅됨
        }

        orderItemRepository.saveAll(orderItems);

        return orderMain;
    }


    @Override
    @Transactional
    public void cancelOrderByMerchantUid(String merchantUid) {
        var optOrder = orderMainRepository.findByMerchantUid(merchantUid)
                .orElseThrow(() -> new IllegalArgumentException("주문 없음"));

        // 💡 [보완] 재고 복구 로직은 confirmPayment 후의 'PAID' 주문을 취소할 때만 필요

        // PENDING 상태인 경우: 재고 복구 없이 상태만 CANCELED로 변경
        if("PENDING".equals(optOrder.getOrderStatus())){
            optOrder.setOrderStatus("CANCELED");
            orderMainRepository.save(optOrder);
        }

        // PAID 상태인 경우: PG사 결제 취소 API 호출 후, DB 상태 변경 및 재고 복구 로직 수행 (별도 구현 필요)
        else if ("PAID".equals(optOrder.getOrderStatus())) {
            // (1) PG사 결제 취소 API 호출
            // (2) 재고 복구 로직 실행
            optOrder.setOrderStatus("REFUNDED");
            orderMainRepository.save(optOrder);
        }

        // 재고 복구: 주문에 포함된 orderItems를 읽어와 옵션 재고를 복구해야 함.
        // (생략) -> 필요하면 orderItemRepository.findByOrderId(...) 후 각각 hotdealOptionRepository로 복구 구현
    }

    @Override
    @Transactional
    public boolean confirmPayment(String merchantUid, String impUid, String pgTid, long amount) {
        // 결제확인 로직: 이미 결제 트랜잭션이 기록되어 있는지, amount 일치 여부 확인 등 (주문 조회 및 유효성 검사 _MerchantUid, 금액 등)
        var maybeOrder = orderMainRepository.findByMerchantUid(merchantUid);
        if (maybeOrder.isEmpty()) return false;
        OrderMain order = maybeOrder.get();

        //1-1. 상태확인 : 이미 처리된 주문이 아닌지 확인
        if(!"PENDING".equals(order.getOrderStatus())){
            log.warn("이미 처리된 주문입니다.");
            return false;
        }

        //1-2. 금액 일치확인
        if(order.getTotalAmount()!=amount){
            throw new IllegalArgumentException("결제된 금액(" + amount + ")과 주문 금액(" + order.getTotalAmount() + ") 불일치 합니다.");
        }


        //2. 재고 차감 및 동시성 제어
        for(OrderItem item : order.getOrderItems()){
            Long optionId = item.getOptionId();
            int qty = item.getQty().intValue();

            // 2-1. 옵션 조회 시 Lock 획득 (이전 단계에서 구현한 Lock이 Repository에 있다고 가정)
            var opt = hotdealOptionRepository.findById(optionId)
                    .orElseThrow(() -> new IllegalArgumentException("옵션 없음"));

            // 2-2. 최종 재고 확인 및 차감
            if (opt.getStock() < qty) {
                // 🛑 재고 부족 발생 시: 주문을 'OUT_OF_STOCK' 등으로 변경하고 결제를 취소해야 함 (PG사 API 연동 필요)
                order.setOrderStatus("OUT_OF_STOCK");
                orderMainRepository.save(order);
                throw new IllegalStateException("결제 도중 재고 부족 발생.");
            }
            opt.setStock(opt.getStock() - qty);
            hotdealOptionRepository.save(opt); // 재고 업데이트 (Lock 내에서 안전하게)
        }

        // 결제 트랜잭션 테이블에 기록하는 로직을 여기에 추가하세요.

        //4. 주문 상태를 'PAID'로 변경하여 완료 처리
        order.setOrderStatus("PAID");
        orderMainRepository.save(order);

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

    //주문수정
    @Override
    @Transactional
    public void cancelPendingOrder(String merchantUid) {
        // 1. 주문 찾기
        OrderMain order = orderMainRepository.findByMerchantUid(merchantUid)
                .orElseThrow(() -> new IllegalArgumentException("유효하지 않은 주문입니다: " + merchantUid));

        // 2. 주문 상태 확인 (PENDING 상태만 수정 가능)
        // OrderStatus Entity/Enum을 사용한다고 가정
        if (order.getOrderStatus() == null || !order.getOrderStatus().equals(OrderStatus.PENDING.name())) {
            // OrderStatus가 Enum 타입이면 .toString()을 사용하여 상태를 표시하거나, Enum의 이름을 그대로 사용합니다.
            String currentStatus = order.getOrderStatus() != null ? order.getOrderStatus().toString() : "NULL";
            throw new IllegalStateException("주문 수정이 불가능한 상태입니다. 현재 상태: " + currentStatus);
        }

        // 3. 재고 복구
        Set<OrderItem> orderItems = order.getOrderItems(); // OrderMain과 OrderItem이 연관되어 있다고 가정
        if (orderItems != null) {
            for (OrderItem orderItem : orderItems) {
                // 옵션이 존재하는 상품의 재고만 복구
                if (orderItem.getOption() != null) {
                    HotdealOption option = hotdealOptionRepository.findById(orderItem.getOption().getId())
                            .orElseThrow(() -> new IllegalStateException("옵션 정보를 찾을 수 없습니다."));

                    // 재고 증가 (주문 수량만큼)
                    option.setStock(option.getStock() + orderItem.getQty());
                    hotdealOptionRepository.save(option);
                }
            }
        }

        // 4. 주문 상태 변경
        order.setOrderStatus(OrderStatus.CANCELED.name()); // 주문을 취소 상태로 변경
        orderMainRepository.save(order);
    }

    @Transactional(readOnly = true)
    public OrderMain getOrderWithItems(String merchantUid) {
        return orderMainRepository.findByMerchantUid(merchantUid)
                .orElseThrow(() -> new NoSuchElementException("Order not found: " + merchantUid));
    }
}

