package com.smu.householdaccount.entity.hotdeal;

import com.smu.householdaccount.entity.common.Member;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "SELLER")
public class Seller {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // MySQL AUTO_INCREMENT
    @Column(name = "SELLER_ID", nullable = false)
    private Long id;

    @Size(max = 30)
    @NotNull
    @Column(name = "BIZ_NO", nullable = false, length = 30)
    private String bizNo; // 사업자번호, DDL에서 UNIQUE

    @Size(max = 100)
    @NotNull
    @Column(name = "BIZ_NAME", nullable = false, length = 100)
    private String bizName; // 상호명


    //main 에 유지됬던 내용, 1:1관계면 이걸 유지
    @NotNull
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "MEMBER_ID", nullable = false, unique = true)
    private Member member;
    //hodeal 유지 내용
    // 🔹 회원 1명 ↔ 판매자 0..1 (1:1 관계)_MantToOne X
    //@NotNull
    //@ManyToOne(fetch = FetchType.LAZY, optional = false)
    //@OnDelete(action = OnDeleteAction.RESTRICT)
    //@JoinColumn(name = "MEMBER_ID", nullable = false)
    //private Member member;

    @Size(max = 50)
    @Column(name = "BIZ_TYPE", length = 50)
    private String bizType; // 업태/종목 등

    @Size(max = 255)
    @Column(name = "BIZ_ADDRESS", length = 255)
    private String bizAddress;

    @Size(max = 20)
    @Column(name = "BIZ_PHONE", length = 20)
    private String bizPhone;

    @Size(max = 100)
    @Column(name = "BIZ_EMAIL", length = 100)
    private String bizEmail;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    // 생성/수정 시간
    // 🔹 회원가입 시점에 created_at 자동생성, 수정시 update_at 자동 생성
    @PrePersist
    public void prePersist() {
        if (this.createdAt == null) {
            this.createdAt = LocalDateTime.now();
        }
    }

    @PreUpdate
    public void preUpdate() {
        this.updatedAt = LocalDateTime.now();
    }


    //main에는 존재하지않음
//    @ColumnDefault("SYSTIMESTAMP")
//    @Column(name = "CREATED_AT")
//    private LocalDateTime createdAt; //오류?

//    @Column(name = "UPDATED_AT")
//    private LocalDateTime updatedAt; //오류?
//    //여기까지


    // ====== 연관관계 (판매자가 올린 상품 / 주문 등) ======

    @OneToMany(mappedBy = "seller")
    private Set<Item> items = new LinkedHashSet<>();

    @OneToMany(mappedBy = "seller")
    private Set<OrderMain> orderMains = new LinkedHashSet<>();

}