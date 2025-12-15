package com.smu.householdaccount.repository.hotdeal;

import com.smu.householdaccount.entity.hotdeal.ItemDetailImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemDetailImageRepository extends JpaRepository<ItemDetailImage, Long> {
    List<ItemDetailImage> findByItemId(Long itemId);

    List<ItemDetailImage> findByItemIdOrderByDisplayOrderAsc(Long itemId);

    // ✅ [추가] 특정 상품의 상세 이미지 전체 삭제
    //    - 수정 시 기존 이미지를 모두 지우고 새로 저장할 때 사용
    @Modifying(clearAutomatically = true)
    @Query("DELETE FROM ItemDetailImage i WHERE i.itemId=:itemId")
    void deleteAllByItemId(Long itemId);

}
