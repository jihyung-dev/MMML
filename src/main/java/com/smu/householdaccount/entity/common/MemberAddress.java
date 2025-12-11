package com.smu.householdaccount.entity.common;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.*;

import java.time.Instant;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "MEMBER_ADDRESS")
@ToString(exclude = {"member"})
@JsonIgnoreProperties({"member"})
public class MemberAddress {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "address_id", nullable = false)
    private Long id;

    @Column(name = "MEMBER_ID", nullable = false, length = 50)
    private String memberId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "member_id", insertable = false, updatable = false)
    private Member member;

    @Size(max = 50)
    @NotNull
    @Column(name = "address_name", nullable = false, length = 50)
    private String addressName;

    @Size(max = 100)
    @NotNull
    @Column(name = "recipient_name", nullable = false, length = 100)
    private String recipientName;

    @Size(max = 255)
    @NotNull
    @Column(name = "address_line1", nullable = false)
    private String addressLine1;

    @Size(max = 255)
    @Column(name = "address_line2")
    private String addressLine2;

    @Size(max = 10)
    @NotNull
    @Column(name = "zipcode", nullable = false, length = 10)
    private String zipcode;

    @Size(max = 20)
    @Column(name = "phone", length = 20)
    private String phone;

    @ColumnDefault("b'0'")
    @Column(name = "is_default")
    private Boolean isDefault;

    @Size(max = 255)
    @Column(name = "request_message")
    private String requestMessage;

    @CreationTimestamp
    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

}