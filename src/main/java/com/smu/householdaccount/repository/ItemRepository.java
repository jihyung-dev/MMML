package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.Item;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;
import java.util.List;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long>, JpaSpecificationExecutor<Item> {
    @Override
    List<Item> findAllById(Iterable<Long> longs);

    // sellerId로 조회 (페이징)
    @EntityGraph(attributePaths = {"seller","category"})
    Page<Item> findBySeller_Id(Long sellerId, Pageable pageable);

    @EntityGraph(attributePaths = {"category","hotdealOptions"})
    Page<Item> findBySellerId(Long sellerId, Pageable pageable);

    // categoryId는 String (DDL 기준). 필요하면 타입 맞춰 변경.
    @EntityGraph(attributePaths = {"seller","category"})
    Page<Item> findByCategoryId(String categoryId, Pageable pageable);

    // 상태별 인기 top N
    List<Item> findTop10BySaleStatusOrderByPopularityScoreDesc(String saleStatus);

    // 조회수 원자적 증가
    @Modifying(clearAutomatically = true)
    @Query("UPDATE Item i SET i.viewCount = i.viewCount + 1 WHERE i.id = :id")
    int incrementViewCount(@Param("id") Long id);

    // 인기점수 증감
    @Modifying(clearAutomatically = true)
    @Query("UPDATE Item i SET i.popularityScore = i.popularityScore + :delta WHERE i.id = :id")
    int addPopularityScore(@Param("id") Long id, @Param("delta") long delta);

    // 현재 세일 중 (예시 쿼리)
    @Query("SELECT i FROM Item i WHERE (i.saleStartAt IS NULL OR i.saleStartAt <= :now) AND i.saleEndAt >= :now")
    Page<Item> findCurrentlyOnSale(@Param("now") LocalDateTime now, Pageable pageable);

    // 옵션/이미지 함께 페치해서 단건 조회하고 싶다면 entity graph 사용
    @EntityGraph(attributePaths = {"images", "hotdealOptions"})
    Optional<Item> findWithImagesAndOptionsById(Long id);


    // 상세 조회 (단건) — fetch join 대신 사용; service에서 연관 초기화 수행
    @EntityGraph(attributePaths = {"seller","category","hotdealOptions","images","wishes"})
    @Override
    Optional<Item> findById(Long id);
    @EntityGraph(attributePaths = {"category","hotdealOptions"})
    Optional<Item> findWithCategoryWithHotdealOptionsById(Long id);
    // 1. 상품 단건 조회 ( 상품 하나 불러오기 => 결제 페이지에서 상세 정보 띄울 때 사용 )
//    Optional<Item> findById(Long id);

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
            LocalDateTime saleStartAt,
            LocalDateTime sateSaleEndAt
    );

    // 4. 카테고리별 상품 조회 (필요하면)
//     Page<Item> findByCategoryId(String categoryId, Pageable pageable);


}

