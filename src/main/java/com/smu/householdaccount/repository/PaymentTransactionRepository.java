package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.PaymentTransaction;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PaymentTransactionRepository extends JpaRepository<PaymentTransaction, Long> {

    // imp_uid로 결제 상태 확인
    Optional<PaymentTransaction> findByImpUid(String merchantUid);

    // 중복 결제 방지용 (imp_uid UNIQUE 로 전제)
    boolean existsByImpUid(String impUid);
}
