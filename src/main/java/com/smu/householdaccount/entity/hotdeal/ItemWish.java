package com.smu.householdaccount.entity.hotdeal;

import com.smu.householdaccount.entity.common.Member;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "ITEM_WISH", uniqueConstraints = @UniqueConstraint(columnNames = {"ITEM_ID", "MEMBER_ID"}))
//, uniqueConstraints = @UniqueConstraint(columnNames = {"ITEM_ID", "MEMBER_ID"}) ⇒ 에러 예방 및 명세 문서화
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"item", "member"})
@Builder
public class ItemWish {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "WISH_ID", nullable = false)
    private Long id;
    @Column(name = "ITEM_ID", nullable = false)
    private Long itemId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "ITEM_ID", insertable = false, updatable = false)
    private Item item;

    @Column(name = "MEMBER_ID", nullable = false, length = 50)
    private String memberId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "MEMBER_ID",insertable = false, updatable = false)
    private Member member;

    @CreationTimestamp
    @Column(name = "CREATED_AT", updatable = false)
    private LocalDateTime createdAt;

}