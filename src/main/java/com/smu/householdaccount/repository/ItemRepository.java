package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.Item;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Optional;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {


    // 1. 상품 단건 조회 ( 상품 하나 불러오기 => 결제 페이지에서 상세 정보 띄울 때 사용 )
    Optional<Item> findById(Long id);

    // 2. 결제 가능한 상품만 조회 (상태 체크 (ON_SALE 상태인지 체크 => 품절, 판매 종료된 상품 결제 방지))
    Optional<Item> findByIdAndSaleStatus(Long id, String saleStatus);

    // 3. 판매 기간 안에 있는 상품 조회 (옵션) <아이디가 이거고, 판매 상태가 이거고, 현재 날짜가 판매 기간(판매 시작일 ≤ 오늘이고, 판매 종료일 ≥ 오늘인) 안에 있는 상품만 가져오는 것!>
    //    Id → ITEM_ID 조건
    //	  AndSaleStatus → SALE_STATUS 조건
    //	  AndSaleStartAtLessThanEqual → SALE_START_AT ≤ startDate 조건 //	  AndSaleEndAtGreaterThanEqual → SALE_END_AT ≥ endDate 조건
    // SELECT * FROM item WHERE id=? AND sale_status=? AND sale_start_at<=? AND sale_end_at>=?
    //
    Optional<Item> findByIdAndSaleStatusAndSaleStartAtLessThanEqualAndSaleEndAtGreaterThanEqual(
            Long id,
            String saleStatus,
            LocalDate saleStartAt,
            LocalDate sateSaleEndAt
    );

    // 4. 카테고리별 상품 조회 (필요하면)
//     Page<Item> findByCategoryId(String categoryId, Pageable pageable);
}