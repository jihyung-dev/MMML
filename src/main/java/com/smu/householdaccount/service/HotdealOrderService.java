package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.entity.OrderMain;
import lombok.Data;

import java.util.List;

public interface HotdealOrderService {
    // 결제창용 구매자 기본 정보 조회 == loginUser
    Member getBuyerDefaultInfo(String memberId);
    @Data
    class OrderBean{
        Long quantity;
        Long price;
        Long discountPrice;
        Long hotdealOptionId;
        Long itemId;
    }
    OrderMain createBasket(List<OrderBean> OrderBeans, Member buyer);


}