package com.smu.householdaccount.entity.hotdeal;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Getter
@Setter
@Entity
@Table(name = "ITEM_DETAIL_IMAGE", uniqueConstraints = @UniqueConstraint(columnNames = {"ITEM_ID", "DISPLAY_ORDER"}))
public class ItemDetailImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DETAIL_IMAGE_ID", nullable = false)
    private Long id;

    @Column(name = "ITEM_ID", nullable = false)
    private Long itemId;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "ITEM_ID", insertable = false, updatable = false)
    private Item item;

    @Size(max = 500)
    @NotNull
    @Column(name = "IMAGE_URL", nullable = false, length = 500)
    private String imageUrl;

    @NotNull
    @Column(name = "DISPLAY_ORDER", nullable = false)
    private Long displayOrder;

}