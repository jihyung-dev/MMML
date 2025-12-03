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

@Getter
@Setter
@Entity
@Table(name = "BOARD_COMMENT")
@ToString(exclude = {"post", "writer", "boardComments","parentComment"})
public class BoardComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "COMMENT_ID", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "POST_ID", nullable = false)
    private BoardPost post;

    @Column(name = "WRITER_ID", nullable = false, length = 50)
    private String writerId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "WRITER_ID",insertable = false, updatable = false)
    private Member writer;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "PARENT_COMMENT_ID")
    private BoardComment parentComment;

    @Size(max = 1000)
    @NotNull
    @Column(name = "COMMENT_CONTENT", nullable = false, length = 1000)
    private String commentContent;

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "parentComment")
    private java.util.List<BoardComment> boardComments = new java.util.ArrayList<>();


}