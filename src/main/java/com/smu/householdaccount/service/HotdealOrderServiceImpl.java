package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.entity.OrderItem;
import com.smu.householdaccount.entity.OrderMain;
import com.smu.householdaccount.repository.MemberRepository;
import com.smu.householdaccount.repository.OrderItemRepository;
import com.smu.householdaccount.repository.OrderMainRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
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
        Long discountPrice = null;
        Long totalPrice = null;
        List<OrderItem> orderItemList = new ArrayList<>();
        for (OrderBean orderBean : orderBeans) {
            OrderItem orderItem = new OrderItem();
            orderItem.setQty(orderBean.quantity);
            orderItem.setItemId(orderBean.itemId);
            orderItem.setOtionId(orderBean.hotdealOptionId);
            orderItem.setPrice(BigDecimal.valueOf(orderBean.discountPrice));
            orderItemList.add(orderItem);
            discountPrice+=orderBean.discountPrice*orderBean.quantity;
            totalPrice+=orderBean.price*orderBean.quantity;
        }
        String merchantUid = "order-" + UUID.randomUUID();
        OrderMain orderMain = new OrderMain();
        orderMain.setBuyerId(buyer.getMemberId());
        orderMain.setTotalAmount(discountPrice);
        orderMain.setOrderStatus("BASKET");
        orderMain.setMerchantUid(merchantUid);

        OrderMain saveOderMain=orderMainRepository.save(orderMain);
        List<OrderItem> saveOrderItems=orderItemRepository.saveAll(orderItemList);
        saveOderMain.setOrderItems(saveOrderItems.stream().collect(Collectors.toSet()));
        //save(OrderMain)
        //save([]OrderItem)
        return saveOderMain;
    }
}
