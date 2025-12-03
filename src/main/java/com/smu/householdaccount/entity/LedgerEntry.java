package com.smu.householdaccount.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "LEDGER_ENTRY")
public class LedgerEntry {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ENTRY_ID", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JsonIgnore
    @JoinColumn(name = "GROUP_ID", nullable = false)
    private BudgetGroup groupId;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "MEMBER_ID", nullable = false)
    @JsonIgnore
    private Member member;

    @Size(max = 10)
    @NotNull
    @Column(name = "ENTRY_TYPE", nullable = false, length = 10)
    private String entryType;

    @Size(max = 10)
    @Column(name = "PAY_TYPE", length = 10)
    private String payType;

    @Size(max = 10)
    @Column(name = "CARD_TYPE", length = 10)
    private String cardType;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "CATEGORY_ID", nullable = false)
//    @JsonIgnore
    private Category category;

    @NotNull
    @Column(name = "ENTRY_AMOUNT", nullable = false, precision = 15, scale = 2)
    private BigDecimal entryAmount;

    @Size(max = 3)
    @ColumnDefault("'KRW'")
    @Column(name = "CURRENCY", length = 3)
    private String currency;

    @NotNull
    @Column(name = "OCCURRED_AT", nullable = false)
    private LocalDateTime occurredAt;

    @Size(max = 200)
    @Column(name = "PLACE_OF_USE", length = 200)
    private String placeOfUse;

    @Size(max = 500)
    @Column(name = "MEMO", length = 500)
    private String memo;

    @Size(max = 20)
    @Column(name = "EXT_SRC", length = 20)
    private String extSrc;

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;
}