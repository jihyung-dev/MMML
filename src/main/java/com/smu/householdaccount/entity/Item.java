package com.smu.householdaccount.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "ITEM")
@ToString(exclude = {"seller", "category","hotdealOptions"})
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ITEM_ID", nullable = false)
    private Long id;

    @Column(name = "SELLER_ID", nullable = false)
    private Long sellerId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
//    @OnDelete(action = OnDeleteAction.RESTRICT) //⇒ @OnDelete가 Hibernate 전용이지만, RESTRICT를 항상 지원하는건 아니고 @ManyToOne 쪽에서 사용하는건 의미가 불명확함.
    @OnDelete(action = OnDeleteAction.CASCADE) //제거하거나 CASCADE로 변경
    @JoinColumn(name = "SELLER_ID", insertable = false, updatable = false)
    private Seller seller;

    @Size(max = 200)
    @NotNull
    @Column(name = "ITEM_NAME", nullable = false, length = 200)
    private String itemName;

    @NotNull
    @Column(name = "ORIGINAL_PRICE", nullable = false, precision = 15, scale = 2)
    private BigDecimal originalPrice;

    @NotNull
    @Column(name = "ITEM_SALEPRICE", nullable = false, precision = 15, scale = 2)
    private BigDecimal itemSaleprice;

    @Column(name = "CATEGORY_ID", nullable = false, length = 50)
    private String categoryId;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
//    @OnDelete(action = OnDeleteAction.RESTRICT)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "CATEGORY_ID", insertable = false, updatable = false)
    private Category category;

    @Size(max = 500)
    @Column(name = "ITEM_IMAGE_URL", length = 500)
    private String itemImageUrl;

    /*@ColumnDefault("0")
    @Column(name = "VIEW_COUNT")
    private Long viewCount;*/

    @Column(name = "VIEW_COUNT")
    private long viewCount = 0;  // ← 기본값 0

    /*@ColumnDefault("0")
    @Column(name = "POPULARITY_SCORE")
    private Long popularityScore;*/

    @Column(name = "POPULARITY_SCORE")
    private long popularityScore = 0;  // ← 기본값 0

    @Column(name = "SALE_START_AT")
    private LocalDate saleStartAt;

    @NotNull
    @Column(name = "SALE_END_AT", nullable = false)
    private LocalDate saleEndAt;

    /*@Size(max = 20)
    @ColumnDefault("'ON_SALE'")
    @Column(name = "SALE_STATUS", length = 20)
    private String saleStatus;*/

    @Size(max = 20)
    @Column(name = "SALE_STATUS", length = 20)
    private String saleStatus = "ON_SALE"; // ← Java에서도 기본값

    /*@ColumnDefault("SYSTIMESTAMP") //⇒ DB마다 동작 방식이 다를 수 있어서 사용 x
    @Column(name = "CREATED_AT")
    private Instant createdAt;*/

    @CreationTimestamp
    @Column(name = "CREATED_AT", updatable = false)
    private LocalDateTime createdAt;

    /*@Column(name = "UPDATED_AT")
    private Instant updatedAt;*/

    @UpdateTimestamp
    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;


    @OneToMany(mappedBy = "item")
    Set<HotdealOption> hotdealOptions=new LinkedHashSet<>();


    /**
     * 템플릿에서 사용할 포맷된 가격 문자열을 제공한다.
     * @return "1,234원" 형태의 문자열 (소수점 반올림, 천단위 콤마)
     */
    @Transient
    public String getFormattedPrice() {
        if (this.getItemSaleprice() == null) {
            return "0원";
        }
        // DecimalFormat은 인스턴스 생성 비용이 작으니 호출마다 새로 만듭니다(스레드 안전).
        DecimalFormat df = new DecimalFormat("#,###");
        BigDecimal scaled = this.getItemSaleprice().setScale(0, RoundingMode.HALF_UP); //setScale(0, RoundingMode.HALF_UP) ⇒ 소수점 반올림 처리
        // longValue() 사용 — 필요하면 toBigIntegerString() 등으로 안전하게 처리 가능
        return df.format(scaled.longValue()) + "원";
    }

}