package com.smu.householdaccount.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.ColumnDefault;

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@ToString
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
    private Boolean enabled;

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "writer")
    @ToString.Exclude
    @JsonIgnore
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
    private Set<LedgerEntry> ledgerEntries = new LinkedHashSet<>();

    @OneToMany(mappedBy = "buyer")
    private Set<com.smu.householdaccount.entity.OrderMain> orderMains = new LinkedHashSet<>();

    @OneToMany(mappedBy = "member")
    private Set<com.smu.householdaccount.entity.Seller> sellers = new LinkedHashSet<>();

}