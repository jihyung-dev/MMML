package com.smu.householdaccount.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Generated;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@ToString
@Table(name = "ITEM")
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_ITEM")
    @SequenceGenerator(name = "SEQ_ITEM",sequenceName = "SEQ_ITEM",allocationSize=1)
    @Column(name = "ITEM_ID")
    private Long id;

    @Column(name = "SELLER_BIZ_NO", nullable = false, length = 30)
    private String sellerBizNo;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "SELLER_BIZ_NO", referencedColumnName = "BIZ_NO",insertable = false, updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private Seller seller;

    @Size(max = 200)
    @NotNull
    @Column(name = "ITEM_NAME", nullable = false, length = 200)
    private String itemName;

    @NotNull
    @Column(name = "ITEM_PRICE", nullable = false, precision = 15, scale = 2)
    private BigDecimal itemPrice;

    @NotNull
    @Column(name = "ITEM_STOCK", nullable = false)
    private Long itemStock;

    @Column(name = "CATEGORY_ID", nullable = false, length = 50)
    private String categoryId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "CATEGORY_ID", insertable = false, updatable = false)
    @ToString.Exclude
    @JsonIgnore
    private Category category;

    @Column(name = "SALE_START_AT")
    private LocalDate saleStartAt;

    @Column(name = "SALE_END_AT")
    private LocalDate saleEndAt;

    @Size(max = 20)
    @ColumnDefault("'ON_SALE'")
    @Column(name = "SALE_STATUS", length = 20)
    private String saleStatus;

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "item")
    @ToString.Exclude
    @JsonIgnore
    private Set<OrderItem> orderItems = new LinkedHashSet<>();

}