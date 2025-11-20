package com.smu.householdaccount.entity

import jakarta.persistence.*
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size
import org.hibernate.annotations.ColumnDefault
import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import java.time.Instant

@Entity
@Table(name = "BUDGET_GROUP")
open class BudgetGroup {
    @Id
    @Column(name = "GROUP_ID", nullable = false)
    open var id: Long? = null

    @Size(max = 100)
    @NotNull
    @Column(name = "GROUP_NAME", nullable = false, length = 100)
    open var groupName: String? = null

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "OWNER_ID", nullable = false)
    open var owner: Member? = null

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    open var createdAt: Instant? = null

    @Column(name = "UPDATED_AT")
    open var updatedAt: Instant? = null

    @OneToMany(mappedBy = "group")
    open var groupMembers: MutableSet<GroupMember> = mutableSetOf()

    @OneToMany(mappedBy = "group")
    open var ledgerEntries: MutableSet<LedgerEntry> = mutableSetOf()
}