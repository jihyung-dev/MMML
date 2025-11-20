package com.smu.householdaccount.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.Instant;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "BUDGET_GROUP")
public class BudgetGroup {
    @Id
    @Column(name = "GROUP_ID", nullable = false)
    private Long id;

    @Size(max = 100)
    @NotNull
    @Column(name = "GROUP_NAME", nullable = false, length = 100)
    private String groupName;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "OWNER_ID", nullable = false)
    private com.smu.householdaccount.entity.Member owner;

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private Instant createdAt;

    @Column(name = "UPDATED_AT")
    private Instant updatedAt;

    @OneToMany(mappedBy = "group")
    private Set<com.smu.householdaccount.entity.GroupMember> groupMembers = new LinkedHashSet<>();

    @OneToMany(mappedBy = "group")
    private Set<com.smu.householdaccount.entity.LedgerEntry> ledgerEntries = new LinkedHashSet<>();

}