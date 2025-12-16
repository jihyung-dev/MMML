package com.smu.householdaccount.service.hotdeal;

import com.smu.householdaccount.entity.hotdeal.ItemWish;
import com.smu.householdaccount.repository.hotdeal.ItemRepository;
import com.smu.householdaccount.repository.hotdeal.ItemWishRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class ItemWishServiceImpl implements ItemWishService{

    private final ItemWishRepository itemWishRepository;
    private final ItemRepository itemRepository; // Item 엔티티 조회용

    @Override
    @Transactional
    public boolean toggleWish(Long itemId, String memberId) {
        // 존재하면 삭제
        boolean exist=itemWishRepository.existsByItemIdAndMemberId(itemId, memberId);

        if (exist) {
            itemWishRepository.deleteByItemIdAndMemberId(itemId, memberId);
            return false;
        }
        // 없으면 추가
//        Item item = itemRepository.findById(itemId)
//                .orElseThrow(() -> new IllegalArgumentException("No item with id: " + itemId));

        ItemWish wish = ItemWish.builder()
                .itemId(itemId)
                .memberId(memberId)
                .build();
        System.out.println(wish);
        itemWishRepository.save(wish);
        return true;
    }

    @Override
    @Transactional(readOnly = true)
    public boolean isWished(Long itemId, String memberId) {
        return itemWishRepository.existsByItemIdAndMemberId(itemId, memberId);
    }

    // ▼▼▼ [추가] Top 3 미리보기 구현 ▼▼▼
    @Override
    @Transactional(readOnly = true)
    public List<Map<String, Object>> getTop3WishList(String memberId) {
        // 1. 최신순으로 3개만 조회 (PageRequest 사용)
        PageRequest pageRequest = PageRequest.of(0, 3, Sort.by(Sort.Direction.DESC, "createdAt"));

        Page<ItemWish> wishPage = itemWishRepository.findByMemberMemberId(memberId, pageRequest);

        // 2. JS에서 쓸 수 있는 JSON 형태(Map)로 변환
        return wishPage.getContent().stream().map(w -> {
            Map<String, Object> map = new HashMap<>();
            map.put("title", w.getItem().getItemName());       // 상품명
            map.put("price", w.getItem().getItemSaleprice());  // 할인가
            map.put("link", "/hotdeal/" + w.getItem().getId()); // 이동 링크
            // 이미지 필요하면: map.put("img", w.getItem().getItemImageUrl());
            return map;
        }).collect(Collectors.toList());
    }


}
