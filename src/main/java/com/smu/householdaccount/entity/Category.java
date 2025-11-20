package com.smu.householdaccount.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "CATEGORY")
public class Category {
    @Id
    @Size(max = 50)
    @Column(name = "CATEGORY_ID", nullable = false, length = 50)
    private String categoryId;

    @Size(max = 50)
    @NotNull
    @Column(name = "CATEGORY_NAME", nullable = false, length = 50)
    private String categoryName;

    @OneToMany(mappedBy = "category")
    private Set<com.smu.householdaccount.entity.Item> items = new LinkedHashSet<>();

    @OneToMany(mappedBy = "category")
    private Set<com.smu.householdaccount.entity.LedgerEntry> ledgerEntries = new LinkedHashSet<>();

    @OneToMany(mappedBy = "category")
    private Set<com.smu.householdaccount.entity.SubCategory> subCategories = new LinkedHashSet<>();

}