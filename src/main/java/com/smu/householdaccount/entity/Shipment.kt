package com.smu.householdaccount.entity

import jakarta.persistence.*
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size
import org.hibernate.annotations.ColumnDefault
import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import java.time.Instant

@Entity
@Table(name = "SHIPMENT")
open class Shipment {
    @Id
    @Column(name = "SHIPMENT_ID", nullable = false)
    open var id: Long? = null

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ORDER_ID", nullable = false)
    open var order: OrderMain? = null

    @Size(max = 30)
    @Column(name = "TRACKING_NO", length = 30)
    open var trackingNo: String? = null

    @Size(max = 30)
    @Column(name = "CARRIER", length = 30)
    open var carrier: String? = null

    @Size(max = 20)
    @Column(name = "SHIPMENT_STATUS", length = 20)
    open var shipmentStatus: String? = null

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    open var createdAt: Instant? = null

    @Column(name = "UPDATED_AT")
    open var updatedAt: Instant? = null
}