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
@Table(name = "LEDGER_ENTRY")
open class LedgerEntry {
    @Id
    @Column(name = "ENTRY_ID", nullable = false)
    open var id: Long? = null

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "GROUP_ID", nullable = false)
    open var group: BudgetGroup? = null

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID", nullable = false)
    open var member: Member? = null

    @Size(max = 10)
    @NotNull
    @Column(name = "ENTRY_TYPE", nullable = false, length = 10)
    open var entryType: String? = null

    @Size(max = 10)
    @Column(name = "PAY_TYPE", length = 10)
    open var payType: String? = null

    @Size(max = 10)
    @Column(name = "CARD_TYPE", length = 10)
    open var cardType: String? = null

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "CATEGORY_ID", nullable = false)
    open var category: Category? = null

    @NotNull
    @Column(name = "ENTRY_AMOUNT", nullable = false, precision = 15, scale = 2)
    open var entryAmount: BigDecimal? = null

    @Size(max = 3)
    @ColumnDefault("'KRW'")
    @Column(name = "CURRENCY", length = 3)
    open var currency: String? = null

    @NotNull
    @Column(name = "OCCURRED_AT", nullable = false)
    open var occurredAt: LocalDate? = null

    @Size(max = 200)
    @Column(name = "PLACE_OF_USE", length = 200)
    open var placeOfUse: String? = null

    @Size(max = 500)
    @Column(name = "MEMO", length = 500)
    open var memo: String? = null

    @Size(max = 20)
    @Column(name = "EXT_SRC", length = 20)
    open var extSrc: String? = null

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    open var createdAt: Instant? = null

    @Column(name = "UPDATED_AT")
    open var updatedAt: Instant? = null
}