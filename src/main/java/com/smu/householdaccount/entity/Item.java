package com.smu.householdaccount.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "ITEM")
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ITEM_ID", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "SELLER_ID", nullable = false)
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

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "CATEGORY_ID", nullable = false)
    private Category category;

    @Size(max = 500)
    @Column(name = "ITEM_IMAGE_URL", length = 500)
    private String itemImageUrl;

    @ColumnDefault("0")
    @Column(name = "VIEW_COUNT")
    private Long viewCount;

    @ColumnDefault("0")
    @Column(name = "POPULARITY_SCORE")
    private Long popularityScore;

    @Column(name = "SALE_START_AT")
    private LocalDate saleStartAt;

    @NotNull
    @Column(name = "SALE_END_AT", nullable = false)
    private LocalDate saleEndAt;

    @Size(max = 20)
    @ColumnDefault("'ON_SALE'")
    @Column(name = "SALE_STATUS", length = 20)
    private String saleStatus;

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private Instant createdAt;

    @Column(name = "UPDATED_AT")
    private Instant updatedAt;

}