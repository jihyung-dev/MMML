package com.smu.householdaccount.specification;

//Specification<T>은 JPA Criteria API를 편리하게 래핑한 동적 쿼리 빌더 ⇒ 핫딜게시판 필터 정렬을 위해서...


import com.smu.householdaccount.entity.Item;
import jakarta.persistence.criteria.*;
import org.springframework.data.jpa.domain.Specification;

//import javax.persistence.criteria.Path;
import jakarta.persistence.criteria.Path;
import java.math.BigDecimal;
import java.time.LocalDate;

public class ItemSpecifications {

    // sellerId 조건 (null이면 null 반환)
    public static Specification<Item> hasSellerId(Long sellerId) {
        if (sellerId == null) return null;
        return (Root<Item> root, CriteriaQuery<?> query, CriteriaBuilder cb) ->
                cb.equal(root.get("seller").get("id"), sellerId);
    }

    // categoryId 조건 (null이면 null 반환)
    public static Specification<Item> hasCategoryId(String categoryId) {
        if (categoryId == null || categoryId.isBlank()) return null;
        return (root, query, cb) ->
                cb.equal(root.get("category").get("id"), categoryId);
    }

    // 이름에 키워드 포함 (null 또는 빈값이면 null)
    public static Specification<Item> nameContains(String keyword) {
        if (keyword == null || keyword.isBlank()) return null;
        return (root, query, cb) ->
                cb.like(cb.lower(root.get("itemName")), "%" + keyword.trim().toLowerCase() + "%");
    }

    // 가격범위 (min 또는 max 둘 중 하나만 있어도 동작)
    public static Specification<Item> priceBetween(BigDecimal minPrice, BigDecimal maxPrice) {
        if (minPrice == null && maxPrice == null) return null;
        return (root, query, cb) -> {
            Path<BigDecimal> p = root.get("itemSaleprice");
            if (minPrice != null && maxPrice != null) {
                return cb.between(p, minPrice, maxPrice);
            } else if (minPrice != null) {
                return cb.greaterThanOrEqualTo(p, minPrice);
            } else {
                return cb.lessThanOrEqualTo(p, maxPrice);
            }
        };
    }

    // 상태 조건 (예: "ON_SALE")
    public static Specification<Item> hasSaleStatus(String saleStatus) {
        if (saleStatus == null || saleStatus.isBlank()) return null;
        return (root, query, cb) -> cb.equal(root.get("saleStatus"), saleStatus);
    }

    // 특정 날짜(activeOn)에 판매중인지: (saleStartAt IS NULL OR saleStartAt <= activeOn) AND saleEndAt >= activeOn
    public static Specification<Item> activeOn(LocalDate activeOn) {
        if (activeOn == null) return null;
        return (root, query, cb) -> {
            Predicate startOk = cb.or(cb.isNull(root.get("saleStartAt")),
                    cb.lessThanOrEqualTo(root.get("saleStartAt"), activeOn));
            Predicate endOk = cb.greaterThanOrEqualTo(root.get("saleEndAt"), activeOn);
            return cb.and(startOk, endOk);
        };
    }

    /**
     * fetch join을 적용한 예시 스펙.
     * 주의: pageable과 함께 사용하면 query.distinct(true)를 꼭 설정해야 중복 결과를 막을 수 있음.
     */
    public static Specification<Item> fetchSellerAndCategory() {
        return (root, query, cb) -> {
            // 페이징으로 findAll(spec, pageable) 할 때 중복 row를 막으려면 distinct true 설정
            if (query.getResultType() != Long.class) { // count 쿼리일 때는 fetch 하지 않는 게 안전
                root.fetch("seller", JoinType.LEFT);
                root.fetch("category", JoinType.LEFT);
                query.distinct(true);
            }
            return cb.conjunction(); // 실제 조건은 다른 스펙에서 추가
        };
    }
}