package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.Item;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface HotdealService {
    // /hotDeal/list.do?page=1&size=20&sort=createdAt,DESC
    //판매중인 아이템을 카테고리별로 조회 (날짜순,인기순)+page
    Page<Item> readItemByCategory(String category, Pageable pageable);
    Page<Item> readItems( Pageable pageable);
    //판매중인 아이템 검색 (제목,내용,)  (날짜순,인기순)+page

    // /hotDeal/{id}/read.do
    //아이템 상세 + (item_img)

    //주문(OderMain+OrderItem)
    //주문
    //주문내역조회

    //후기,질문

}
