package com.smu.householdaccount.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;
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
    private String role;

    @Size(max = 100)
    @NotNull
    @Column(name = "MEMBER_NAME", nullable = false, length = 100)
    private String memberName;

    @Size(max = 50)
    @NotNull
    @Column(name = "MEMBER_NICKNAME", nullable = false, length = 50)
    private String memberNickname;

    @Size(max = 255)
    @Column(name = "ADDRESS")
    private String address;

    @Size(max = 20)
    @Column(name = "PHONE", length = 20)
    private String phone;

    @ColumnDefault("'Y'")
    @Column(name = "ENABLED")
    private String enabled;


    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

//   @PrePersist, @PreUpdate 두개추가 회원가입시 자동 createdAt 넣어줌, 정보수정시 자동 updatedAt
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

    @OneToMany(mappedBy = "member")
    private Set<Seller> sellers = new LinkedHashSet<>();

}