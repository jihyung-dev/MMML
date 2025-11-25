package com.smu.householdaccount.repository;

import com.smu.householdaccount.entity.Item;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Optional;
import java.util.List;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long>, JpaSpecificationExecutor<Item> {

    // sellerId로 조회 (페이징)
    @EntityGraph(attributePaths = {"seller","category"})
    Page<Item> findBySeller_Id(Long sellerId, Pageable pageable);

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
    Page<Item> findCurrentlyOnSale(@Param("now") LocalDate now, Pageable pageable);

    // 상세 조회 (단건) — fetch join 대신 사용; service에서 연관 초기화 수행
    @EntityGraph(attributePaths = {"seller","category"})
    @Override
    Optional<Item> findById(Long id);
}

