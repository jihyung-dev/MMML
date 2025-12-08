package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.HotdealOption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface HotdealOptionRepository extends JpaRepository<HotdealOption, Long> {

    // 1. 결제창에서 사용 가능한 옵션 목록 불러오기 (특정 상품의 옵션 리스트 조회)
    // itemId만 쳐도 해당하는 id의 옵션들을 불러올 수 있게 하는 것!
    List<HotdealOption> findByItemId(Long itemId);

    @Override
    List<HotdealOption> findAllById(Iterable<Long> longs);
}