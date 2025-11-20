package com.smu.householdaccount.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Getter
@Setter
@Entity
@Table(name = "SUB_CATEGORY")
public class SubCategory {
    @Id
    @Size(max = 50)
    @Column(name = "SUB_ID", nullable = false, length = 50)
    private String subId;

    @Size(max = 50)
    @NotNull
    @Column(name = "SUB_CATEGORY_NAME", nullable = false, length = 50)
    private String subCategoryName;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "CATEGORY_ID", nullable = false)
    private Category category;

}