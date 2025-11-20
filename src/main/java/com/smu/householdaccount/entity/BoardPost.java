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

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;
@ToString(exclude = {"writer", "boardComments", "boardLikes"})
@Getter
@Setter
@Entity
@Table(name = "BOARD_POST")
public class BoardPost {
    @Id
    @Column(name = "POST_ID", nullable = false)
    private int id;

    @Size(max = 30)
    @NotNull
    @Column(name = "CATEGORY", nullable = false, length = 30)
    private String category;

    @Size(max = 200)
    @NotNull
    @Column(name = "POST_TITLE", nullable = false, length = 200)
    private String postTitle;

    @NotNull
    @Lob
    @Column(name = "POST_CONTENT", nullable = false)
    private String postContent;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "WRITER_ID")
    private com.smu.householdaccount.entity.Member writer;

    @ColumnDefault("0")
    @Column(name = "VIEW_CNT")
    private Long viewCnt;

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "post")
    private Set<BoardComment> boardComments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "post")
    private Set<BoardLike> boardLikes = new LinkedHashSet<>();

}