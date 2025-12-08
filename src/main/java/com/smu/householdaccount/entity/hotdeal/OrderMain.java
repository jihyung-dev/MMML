package com.smu.householdaccount.entity.hotdeal;

import com.smu.householdaccount.entity.common.Member;
import jakarta.persistence.*;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.*;
import org.springframework.data.annotation.CreatedDate;

import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "ORDER_MAIN")
@ToString(exclude = {"buyer", "seller", "orderItems", "paymentTransactions", "shipments"})
public class  OrderMain {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ORDER_ID", nullable = false)
    private Long id;

    @Column(name = "BUYER_ID", nullable = false, length = 50)
    private String buyerId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "BUYER_ID", insertable = false, updatable = false)
    private Member buyer;

    @Column(name = "SELLER_ID")
    private Long sellerId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "SELLER_ID", insertable = false, updatable = false)
    private Seller seller;

    @NotNull
    @Column(name = "TOTAL_AMOUNT", nullable = false, precision = 15, scale = 2)
    private Long totalAmount;
    /* BASKET: 장바구니
  PENDING : 결제창에서 사용자 입력 진행중
  SUCCESS : PGTK 승인 완료 (돈 나감)
  FAILED : 잔액부족, 비밀번호 오류 등 실패
  CANCELED : 결제 후 환불/취소됨
*/
    @Size(max = 20)
    @NotNull
    @Column(name = "ORDER_STATUS", nullable = false, length = 20)
    private String orderStatus;

    //@ColumnDefault("SYSTIMESTAMP")
    @CreationTimestamp
    @Column(name = "CREATED_AT")
    @CreatedDate
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "order")
    private Set<OrderItem> orderItems = new LinkedHashSet<>();

    @OneToMany(mappedBy = "order")
    private Set<PaymentTransaction> paymentTransactions = new LinkedHashSet<>();

    @OneToMany(mappedBy = "order")
    private Set<Shipment> shipments = new LinkedHashSet<>();

    @Column(name = "MERCHANT_UID")
    private String merchantUid;
}