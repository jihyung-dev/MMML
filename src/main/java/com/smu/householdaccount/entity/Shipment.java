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

@Getter
@Setter
@Entity
@Table(name = "SHIPMENT")
public class Shipment {
    @Id
    @Column(name = "SHIPMENT_ID", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ORDER_ID", nullable = false)
    private OrderMain order;

    @Size(max = 30)
    @Column(name = "TRACKING_NO", length = 30)
    private String trackingNo;

    @Size(max = 30)
    @Column(name = "CARRIER", length = 30)
    private String carrier;

    @Size(max = 20)
    @Column(name = "SHIPMENT_STATUS", length = 20)
    private String shipmentStatus;

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

}