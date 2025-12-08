package com.smu.householdaccount.repository.hotdeal;

import com.smu.householdaccount.entity.hotdeal.ItemDetailImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemDetailImageRepository extends JpaRepository<ItemDetailImage, Long> {
    List<ItemDetailImage> findByItemId(Long itemId);

    List<ItemDetailImage> findByItemIdOrderByDisplayOrderAsc(Long itemId);
}
