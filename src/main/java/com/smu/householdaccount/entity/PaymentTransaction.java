package com.smu.householdaccount.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "PAYMENT_TRANSACTION")
public class PaymentTransaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TXN_ID", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "ORDER_ID", nullable = false)
    private OrderMain order;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID", nullable = false)
    private Member member;

    @Size(max = 100)
    @Column(name = "PG_TID", length = 100)
    private String pgTid;

    @NotNull
    @Column(name = "AMOUNT", nullable = false, precision = 15, scale = 2)
    private BigDecimal amount;

    @Size(max = 20)
    @NotNull
    @Column(name = "TXN_STATUS", nullable = false, length = 20)
    private String txnStatus;

    @Size(max = 20)
    @Column(name = "PAY_METHOD", length = 20)
    private String payMethod;

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "REQUEST_TIME")
    private LocalDateTime requestTime;

    @Column(name = "RESPONSE_TIME")
    private LocalDateTime responseTime;

    @Lob
    @Column(name = "RAW_DATA")
    private String rawData;

}