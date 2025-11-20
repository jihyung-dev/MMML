package com.smu.householdaccount.entity

import jakarta.persistence.*
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size
import org.hibernate.annotations.ColumnDefault
import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import java.math.BigDecimal
import java.time.Instant
import java.time.LocalDate

@Entity
@Table(name = "ITEM")
open class Item {
    @Id
    @Column(name = "ITEM_ID", nullable = false)
    open var id: Long? = null

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "SELLER_BIZ_NO", nullable = false, referencedColumnName = "BIZ_NO")
    open var sellerBizNo: Seller? = null

    @Size(max = 200)
    @NotNull
    @Column(name = "ITEM_NAME", nullable = false, length = 200)
    open var itemName: String? = null

    @NotNull
    @Column(name = "ITEM_PRICE", nullable = false, precision = 15, scale = 2)
    open var itemPrice: BigDecimal? = null

    @NotNull
    @Column(name = "ITEM_STOCK", nullable = false)
    open var itemStock: Long? = null

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "CATEGORY_ID", nullable = false)
    open var category: Category? = null

    @Column(name = "SALE_START_AT")
    open var saleStartAt: LocalDate? = null

    @Column(name = "SALE_END_AT")
    open var saleEndAt: LocalDate? = null

    @Size(max = 20)
    @ColumnDefault("'ON_SALE'")
    @Column(name = "SALE_STATUS", length = 20)
    open var saleStatus: String? = null

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    open var createdAt: Instant? = null

    @Column(name = "UPDATED_AT")
    open var updatedAt: Instant? = null

    @OneToMany(mappedBy = "item")
    open var orderItems: MutableSet<OrderItem> = mutableSetOf()
}