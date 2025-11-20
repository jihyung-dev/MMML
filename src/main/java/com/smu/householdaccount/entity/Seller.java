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
import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "SELLER")
public class Seller {
    @Id
    @Column(name = "SELLER_ID", nullable = false)
    private Long id;

    @Size(max = 30)
    @NotNull
    @Column(name = "BIZ_NO", nullable = false, length = 30)
    private String bizNo;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID", nullable = false)
    private Member member;

    @Size(max = 30)
    @Column(name = "BIZ_TYPE", length = 30)
    private String bizType;

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "sellerBizNo")
    private Set<Item> items = new LinkedHashSet<>();

}