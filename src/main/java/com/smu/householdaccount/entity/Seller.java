package com.smu.householdaccount.entity;

import jakarta.persistence.*;
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
@Table(name = "SELLER")
public class Seller {
    @Id
    @Size(max = 50)
    @Column(name = "SELLER_ID", nullable = false, length = 50)
    private String sellerId;

    @MapsId
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "SELLER_ID", nullable = false)
    private Member member;

    @Size(max = 30)
    @Column(name = "BIZ_TYPE", length = 30)
    private String bizType;

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private Instant createdAt;

    @Column(name = "UPDATED_AT")
    private Instant updatedAt;

    @OneToMany(mappedBy = "seller")
    private Set<Item> items = new LinkedHashSet<>();

}