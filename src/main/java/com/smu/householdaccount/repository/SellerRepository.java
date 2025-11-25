package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.Seller;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SellerRepository extends JpaRepository<Seller, Long> {
    boolean existsByBizNo(String bizNo);
}


