package com.smu.householdaccount.entity.common;

import com.smu.householdaccount.entity.hotdeal.OrderMain;
import com.smu.householdaccount.entity.hotdeal.PaymentTransaction;
import com.smu.householdaccount.entity.hotdeal.Seller;
import com.smu.householdaccount.entity.account.BudgetGroup;
import com.smu.householdaccount.entity.account.GroupMember;
import com.smu.householdaccount.entity.account.LedgerEntry;
import com.smu.householdaccount.entity.board.BoardComment;
import com.smu.householdaccount.entity.board.BoardLike;
import com.smu.householdaccount.entity.board.BoardPost;
import com.smu.householdaccount.entity.hotdeal.ItemWish;
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
@Table(name = "MEMBER")
public class Member {

    @Id
    @Size(max = 50)
    @Column(name = "MEMBER_ID", nullable = false, length = 50)
    private String memberId;

    @Size(max = 255)
    @NotNull
    @Column(name = "PASSWORD", nullable = false)
    private String password;

    @Size(max = 20)
    @NotNull
    @Column(name = "ROLE", nullable = false, length = 20)
    private String role; // general / admin

    @Size(max = 100)
    @NotNull
    @Column(name = "MEMBER_NAME", nullable = false, length = 100)
    private String memberName;

    @Size(max = 50)
    @NotNull
    @Column(name = "MEMBER_NICKNAME", nullable = false, length = 50)
    private String memberNickname;

    @Size(max = 255)
    @Column(name = "ADDRESS", length = 255)
    private String address;

    @Size(max = 20)
    @Column(name = "PHONE", length = 20)
    private String phone;

    @ColumnDefault("'Y'")
    @Column(name = "ENABLED", length = 1)
    private String enabled;


    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    // ====== 추가된 컬럼들 ======

    @Column(name = "GENDER", length = 1)
    private String gender;   // M/F 등, NULL 허용

    @Column(name = "AGE")
    private Integer age;     // NULL 허용

    @Size(max = 100)
    @Column(name = "email", length = 100)
    private String email;

    // ====== 공통 생성/수정 시간 처리 ======
    @PrePersist
    public void prePersist() {
        if (this.createdAt == null) {
            this.createdAt = LocalDateTime.now();
        }
        if (this.enabled == null) {
            this.enabled = "Y";
        }
    }

    @PreUpdate
    public void preUpdate() {
        this.updatedAt = LocalDateTime.now();
    }

    // ====== 연관관계들 ======

    @OneToMany(mappedBy = "writer")
    private Set<BoardComment> boardComments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<BoardLike> boardLikes = new LinkedHashSet<>();

    @OneToMany(mappedBy = "writer")
    private Set<BoardPost> boardPosts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "owner")
    private Set<BudgetGroup> budgetGroups = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<GroupMember> groupMembers = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<ItemWish> itemWishes = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<LedgerEntry> ledgerEntries = new LinkedHashSet<>();

    @OneToMany(mappedBy = "buyer")
    private Set<OrderMain> orderMains = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<PaymentTransaction> paymentTransactions = new LinkedHashSet<>();

    // 🔹 회원 1명 ↔ 판매자 0..1 (1:1 관계)
    @OneToOne(mappedBy = "member")
    private Seller seller;
}