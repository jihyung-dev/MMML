package com.smu.householdaccount.service.hotdeal;

import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.entity.hotdeal.OrderMain;
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