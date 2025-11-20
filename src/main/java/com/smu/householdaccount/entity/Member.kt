package com.smu.householdaccount.entity

import jakarta.persistence.*
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size
import org.hibernate.annotations.ColumnDefault
import java.time.Instant

@Entity
@Table(name = "MEMBER")
open class Member {
    @Id
    @Size(max = 50)
    @Column(name = "MEMBER_ID", nullable = false, length = 50)
    open var memberId: String? = null

    @Size(max = 255)
    @NotNull
    @Column(name = "PASSWORD", nullable = false)
    open var password: String? = null

    @Size(max = 20)
    @NotNull
    @Column(name = "ROLE", nullable = false, length = 20)
    open var role: String? = null

    @Size(max = 100)
    @NotNull
    @Column(name = "MEMBER_NAME", nullable = false, length = 100)
    open var memberName: String? = null

    @Size(max = 50)
    @NotNull
    @Column(name = "MEMBER_NICKNAME", nullable = false, length = 50)
    open var memberNickname: String? = null

    @Size(max = 255)
    @Column(name = "ADDRESS")
    open var address: String? = null

    @Size(max = 20)
    @Column(name = "PHONE", length = 20)
    open var phone: String? = null

    @ColumnDefault("'Y'")
    @Column(name = "ENABLED")
    open var enabled: Boolean? = null

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    open var createdAt: Instant? = null

    @Column(name = "UPDATED_AT")
    open var updatedAt: Instant? = null

    @OneToMany(mappedBy = "writer")
    open var boardComments: MutableSet<BoardComment> = mutableSetOf()

    @OneToMany(mappedBy = "member")
    open var boardLikes: MutableSet<BoardLike> = mutableSetOf()

    @OneToMany(mappedBy = "writer")
    open var boardPosts: MutableSet<BoardPost> = mutableSetOf()

    @OneToMany(mappedBy = "owner")
    open var budgetGroups: MutableSet<BudgetGroup> = mutableSetOf()

    @OneToMany(mappedBy = "member")
    open var groupMembers: MutableSet<GroupMember> = mutableSetOf()

    @OneToMany(mappedBy = "member")
    open var ledgerEntries: MutableSet<LedgerEntry> = mutableSetOf()

    @OneToMany(mappedBy = "buyer")
    open var orderMains: MutableSet<OrderMain> = mutableSetOf()

    @OneToMany(mappedBy = "member")
    open var sellers: MutableSet<Seller> = mutableSetOf()
}