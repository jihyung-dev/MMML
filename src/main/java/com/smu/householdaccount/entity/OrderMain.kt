package com.smu.householdaccount.entity

import jakarta.persistence.*
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size
import org.hibernate.annotations.ColumnDefault
import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import java.math.BigDecimal
import java.time.Instant

@Entity
@Table(name = "ORDER_MAIN")
open class OrderMain {
    @Id
    @Column(name = "ORDER_ID", nullable = false)
    open var id: Long? = null

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "BUYER_ID", nullable = false)
    open var buyer: Member? = null

    @NotNull
    @Column(name = "TOTAL_AMOUNT", nullable = false, precision = 15, scale = 2)
    open var totalAmount: BigDecimal? = null

    @Size(max = 20)
    @NotNull
    @Column(name = "ORDER_STATUS", nullable = false, length = 20)
    open var orderStatus: String? = null

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    open var createdAt: Instant? = null

    @Column(name = "UPDATED_AT")
    open var updatedAt: Instant? = null

    @OneToMany(mappedBy = "order")
    open var orderItems: MutableSet<OrderItem> = mutableSetOf()

    @OneToMany(mappedBy = "order")
    open var shipments: MutableSet<Shipment> = mutableSetOf()
}