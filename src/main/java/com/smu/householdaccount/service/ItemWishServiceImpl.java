package com.smu.householdaccount.service;

import com.smu.householdaccount.service.ItemWishService;
import com.smu.householdaccount.entity.Item;
import com.smu.householdaccount.entity.ItemWish;
import com.smu.householdaccount.repository.ItemRepository;
import com.smu.householdaccount.repository.ItemWishRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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


}
