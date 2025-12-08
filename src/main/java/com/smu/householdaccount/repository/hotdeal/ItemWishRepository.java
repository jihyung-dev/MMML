package com.smu.householdaccount.repository.hotdeal;

import com.smu.householdaccount.entity.hotdeal.ItemWish;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ItemWishRepository extends JpaRepository<ItemWish, Long> {

    Optional<ItemWish> findByItemIdAndMemberId(Long itemId, String memberId); //특정 회원이 특정 상품을 찜했는지. 단건 조회의 의미로 사용함.

    long countByItemId(Long itemId); // 특정 아이템의 찜 개수

    void deleteByItemId(Long itemId); //찜 기록 삭제. 상품이 삭제되었을 때 찜 기록도 같이 삭제

    void deleteByItemIdAndMemberId(Long itemId, String memberId); // 찜 취소

    // 존재 여부만 체크할 땐 boolean
//    boolean existsByItem_IdAndMember_MemberId(Long itemId, String memberId);
    boolean existsByItemIdAndMemberId(Long itemId, String memberId);

    // 아이템에 달린 모든 찜을 가져올 때
    List<ItemWish> findByItem_Id(Long itemId);

    // 🔹 내 찜 목록 조회 (최신순 정렬은 Pageable로 처리)
    Page<ItemWish> findByMemberMemberId(String memberId, Pageable pageable);
}
