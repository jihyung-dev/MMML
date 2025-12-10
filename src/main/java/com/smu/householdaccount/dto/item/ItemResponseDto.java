package com.smu.householdaccount.dto.item;

import com.smu.householdaccount.entity.hotdeal.HotdealOption;
import com.smu.householdaccount.entity.hotdeal.Item;
import com.smu.householdaccount.entity.hotdeal.ItemDetailImage;
import com.smu.householdaccount.entity.hotdeal.Seller; // ★ Seller 임포트 필수
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;

@Getter @Setter
@NoArgsConstructor
public class ItemResponseDto {
    private Long id;
    private String itemName;
    private BigDecimal price;
    private BigDecimal originalPrice;
    private String imageUrl;
    private String saleStatus;
    private Long sellerId;

    // 찜 여부
    private boolean isLiked;

    // 상세 페이지용 데이터
    private List<ItemDetailImage> images;
    private Set<HotdealOption> hotdealOptions;
    private String description;
    private long viewCount;
    private long popularityScore;
    private LocalDateTime saleStartAt;
    private LocalDateTime saleEndAt;

    // ★ [추가] 에러 해결을 위한 판매자 객체 필드
    private Seller seller;

    // 생성자 (Entity -> DTO 변환)
    public ItemResponseDto(Item item, boolean isLiked) {
        this.id = item.getId();
        this.itemName = item.getItemName();
        this.price = item.getItemSaleprice();
        this.originalPrice = item.getOriginalPrice();
        this.imageUrl = item.getItemImageUrl();
        this.saleStatus = item.getSaleStatus();
        this.sellerId = item.getSellerId();

        this.isLiked = isLiked;

        // 상세 정보 매핑
        this.images = item.getImages();
        this.hotdealOptions = item.getHotdealOptions();
        this.description = item.getDescription();
        this.viewCount = item.getViewCount();
        this.popularityScore = item.getPopularityScore();
        this.saleStartAt = item.getSaleStartAt();
        this.saleEndAt = item.getSaleEndAt();

        // ★ [추가] 엔티티에서 판매자 정보 가져오기
        this.seller = item.getSeller();
    }

    public ItemResponseDto(Item item, long daysLeft) {
    }

    public String getFormattedPrice() {
        if (this.price == null) return "0원";
        DecimalFormat df = new DecimalFormat("#,###");
        return df.format(this.price) + "원";
    }

    public String getFormattedOriginalPrice() {
        if (this.originalPrice == null) return "";
        DecimalFormat df = new DecimalFormat("#,###");
        return df.format(this.originalPrice) + "원";
    }
}