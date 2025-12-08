package com.smu.householdaccount.service.hotdeal;

import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.entity.hotdeal.OrderItem;
import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.repository.common.MemberRepository;
import com.smu.householdaccount.repository.hotdeal.OrderItemRepository;
import com.smu.householdaccount.repository.hotdeal.OrderMainRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor(onConstructor_ = @Autowired)
public class HotdealOrderServiceImpl implements HotdealOrderService {

    private final MemberRepository memberRepository;
    private final OrderMainRepository orderMainRepository;
    private final OrderItemRepository orderItemRepository;

    @Override
    public Member getBuyerDefaultInfo(String memberId) {
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new RuntimeException("회원 정보를 찾을 수 없습니다."));
        return member;
    }

    @Override
    public OrderMain createBasket(List<OrderBean> orderBeans, Member buyer) {
//        Long discountPrice = null;
//        Long totalPrice = null;
        //[수정] 금액 변수 초기값 0L 설정
        Long discountPrice = 0L;
        Long totalPrice = 0L;

        List<OrderItem> orderItemList = new ArrayList<>();

        for (OrderBean orderBean : orderBeans) {
            OrderItem orderItem = new OrderItem();
            orderItem.setQty(orderBean.quantity);
            orderItem.setItemId(orderBean.itemId);
            orderItem.setOptionId(orderBean.hotdealOptionId);
            orderItem.setPrice(BigDecimal.valueOf(orderBean.discountPrice));
            orderItemList.add(orderItem);

            //1. 연산 가능
            discountPrice += orderBean.discountPrice * orderBean.quantity;
            totalPrice += orderBean.price * orderBean.quantity;
        }

        String merchantUid = "order-" + UUID.randomUUID();
        OrderMain orderMain = new OrderMain();
        orderMain.setBuyerId(buyer.getMemberId());
        orderMain.setTotalAmount(discountPrice);
        orderMain.setOrderStatus("BASKET");
        orderMain.setMerchantUid(merchantUid);

        //2. OrderMain 먼저 저장하고 ID 할당 받음
        OrderMain saveOrderMain=orderMainRepository.save(orderMain);

        //3. 저장된 OrderMain 객체를 OrderItem에 연결
        for(OrderItem orderItem:orderItemList){
            orderItem.setOrder(saveOrderMain);
        }

        //4. OrderItem 저장
        List<OrderItem> saveOrderItems=orderItemRepository.saveAll(orderItemList);

        //5. OrderMain 객체에도 OrderItems 컬렉션 업데이트
        //saveOrderMain.setOrderItems(saveOrderItems.stream().collect(Collectors.toSet()));
        saveOrderMain.setOrderItems(new HashSet<>(saveOrderItems));
        //save(OrderMain)
        //save([]OrderItem)
        return saveOrderMain;
    }
}
