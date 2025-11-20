package com.smu.householdaccount.entity

import jakarta.persistence.*
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size
import org.hibernate.annotations.ColumnDefault
import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import java.time.Instant

@Entity
@Table(name = "SELLER")
open class Seller {
    @Id
    @Column(name = "SELLER_ID", nullable = false)
    open var id: Long? = null

    @Size(max = 30)
    @NotNull
    @Column(name = "BIZ_NO", nullable = false, length = 30)
    open var bizNo: String? = null

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID", nullable = false)
    open var member: Member? = null

    @Size(max = 30)
    @Column(name = "BIZ_TYPE", length = 30)
    open var bizType: String? = null

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    open var createdAt: Instant? = null

    @Column(name = "UPDATED_AT")
    open var updatedAt: Instant? = null

    @OneToMany(mappedBy = "sellerBizNo")
    open var items: MutableSet<Item> = mutableSetOf()
}