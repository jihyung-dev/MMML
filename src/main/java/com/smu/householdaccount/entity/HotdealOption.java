package com.smu.householdaccount.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.math.BigDecimal;
import jakarta.persistence.Transient;

import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "HOTDEAL_OPTION")
@ToString(exclude = {"item","orderItems"})
public class HotdealOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "OPTION_ID", nullable = false)
    private Long id;

    @Column(name = "ITEM_ID", nullable = false)
    private Long itemId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "ITEM_ID", insertable = false, updatable = false)
    private Item item;

    @Size(max = 100)
    @NotNull
    @Column(name = "OPTION_TYPE", nullable = false, length = 100)
    private String optionType;

    @Size(max = 100)
    @NotNull
    @Column(name = "OPTION_VALUE", nullable = false, length = 100)
    private String optionValue;

    @ColumnDefault("0")
    @Column(name = "ADDITIONAL_PRICE", precision = 15, scale = 2)
    private BigDecimal additionalPrice;

    @NotNull
    @Column(name = "STOCK", nullable = false)
    private Long stock;

    @OneToMany(mappedBy = "option")
    private Set<OrderItem> orderItems = new LinkedHashSet<>();


    @Transient
    public String getFormattedAdditionalPrice() {
        if (this.getAdditionalPrice() == null) return "";
        if (this.getAdditionalPrice().compareTo(BigDecimal.ZERO) == 0) return "";
        DecimalFormat df = new DecimalFormat("#,###");
        BigDecimal scaled = this.getAdditionalPrice().setScale(0, RoundingMode.HALF_UP);
        return "(+" + df.format(scaled.longValue()) + "원)";
    }

}