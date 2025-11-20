package com.smu.householdaccount.entity

import jakarta.persistence.*
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size
import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction

@Entity
@Table(name = "SUB_CATEGORY")
open class SubCategory {
    @Id
    @Size(max = 50)
    @Column(name = "SUB_ID", nullable = false, length = 50)
    open var subId: String? = null

    @Size(max = 50)
    @NotNull
    @Column(name = "SUB_CATEGORY_NAME", nullable = false, length = 50)
    open var subCategoryName: String? = null

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "CATEGORY_ID", nullable = false)
    open var category: Category? = null
}