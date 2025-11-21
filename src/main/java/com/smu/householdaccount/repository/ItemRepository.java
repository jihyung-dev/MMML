package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.Item;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemRepository extends JpaRepository<Item,Long> {
    @Override
    Page<Item> findAll(Pageable pageable);

    Page<Item> findByCategoryId(String categoryId, Pageable pageable);

}
