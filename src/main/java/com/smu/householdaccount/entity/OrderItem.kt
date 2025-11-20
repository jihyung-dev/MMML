package com.smu.householdaccount.entity

import jakarta.persistence.*
import jakarta.validation.constraints.NotNull
import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import java.math.BigDecimal

@Entity
@Table(name = "ORDER_ITEM")
open class OrderItem {
    @Id
    @Column(name = "ORDER_ITEM_ID", nullable = false)
    open var id: Long? = null

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "ORDER_ID", nullable = false)
    open var order: OrderMain? = null

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ITEM_ID", nullable = false)
    open var item: Item? = null

    @NotNull
    @Column(name = "QTY", nullable = false)
    open var qty: Long? = null

    @NotNull
    @Column(name = "PRICE", nullable = false, precision = 15, scale = 2)
    open var price: BigDecimal? = null
}