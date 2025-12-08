package com.smu.householdaccount.entity.hotdeal;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "ORDER_ITEM")
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ORDER_ITEM_ID", nullable = false)
    private Long id;

    @Column(name = "ORDER_ID", nullable = false)
    private Long orderId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "ORDER_ID",insertable = false, updatable = false)
    private OrderMain order;

    @Column(name = "ITEM_ID", nullable = false)
    private Long itemId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ITEM_ID", insertable = false, updatable = false)
    private Item item;

    @Column(name = "OPTION_ID")
    private Long optionId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "OPTION_ID",insertable = false, updatable = false)
    private HotdealOption option;

    @NotNull
    @Column(name = "QTY", nullable = false)
    private Long qty;

    @NotNull
    @Column(name = "PRICE", nullable = false, precision = 15, scale = 2)
    private BigDecimal price;

}