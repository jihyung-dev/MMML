package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.ItemDetailImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Repository
public interface ItemDetailImageRepository extends JpaRepository<ItemDetailImage, Long> {
    List<ItemDetailImage> findByItemId(Long itemId);

    List<ItemDetailImage> findByItemIdOrderByDisplayOrderAsc(Long itemId);
}
