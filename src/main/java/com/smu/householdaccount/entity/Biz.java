package com.smu.householdaccount.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "BIZ")
public class Biz {
    @Id
    @Column(name = "BIZ_ID", nullable = false)
    private Long id;

    @Size(max = 20)
    @Column(name = "BIZ_NO", nullable = false, length = 20)
    private String bizNo;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "SELLER_ID")
    private Member seller;

    @Size(max = 30)
    @Column(name = "BIZ_TYPE", length = 30)
    private String bizType;

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private Instant createdAt;

    @Column(name = "UPDATED_AT")
    private Instant updatedAt;

}