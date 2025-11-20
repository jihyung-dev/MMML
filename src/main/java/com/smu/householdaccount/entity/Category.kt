package com.smu.householdaccount.entity

import jakarta.persistence.*
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size

@Entity
@Table(name = "CATEGORY")
open class Category {
    @Id
    @Size(max = 50)
    @Column(name = "CATEGORY_ID", nullable = false, length = 50)
    open var categoryId: String? = null

    @Size(max = 50)
    @NotNull
    @Column(name = "CATEGORY_NAME", nullable = false, length = 50)
    open var categoryName: String? = null

    @OneToMany(mappedBy = "category")
    open var items: MutableSet<Item> = mutableSetOf()

    @OneToMany(mappedBy = "category")
    open var ledgerEntries: MutableSet<LedgerEntry> = mutableSetOf()

    @OneToMany(mappedBy = "category")
    open var subCategories: MutableSet<SubCategory> = mutableSetOf()
}