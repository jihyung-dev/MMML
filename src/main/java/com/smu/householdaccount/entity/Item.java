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
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "ITEM")
public class Item {
    @Id
    @Column(name = "ITEM_ID", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "SELLER_ID", nullable = false)
    private Seller seller;

    @Size(max = 200)
    @NotNull
    @Column(name = "NAME", nullable = false, length = 200)
    private String name;

    @NotNull
    @Column(name = "PRICE", nullable = false, precision = 15, scale = 2)
    private BigDecimal price;

    @NotNull
    @Column(name = "STOCK", nullable = false)
    private Long stock;

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
    private Instant createdAt;

    @Column(name = "UPDATED_AT")
    private Instant updatedAt;

    @OneToMany(mappedBy = "item")
    private Set<OrderItem> orderItems = new LinkedHashSet<>();

}