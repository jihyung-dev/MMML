package com.smu.householdaccount.entity

import jakarta.persistence.*
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size
import org.hibernate.annotations.ColumnDefault
import org.hibernate.annotations.OnDelete
import org.hibernate.annotations.OnDeleteAction
import java.time.Instant

@Entity
@Table(name = "BOARD_POST")
open class BoardPost {
    @Id
    @Column(name = "POST_ID", nullable = false)
    open var id: Long? = null

    @Size(max = 30)
    @NotNull
    @Column(name = "CATEGORY", nullable = false, length = 30)
    open var category: String? = null

    @Size(max = 200)
    @NotNull
    @Column(name = "POST_TITLE", nullable = false, length = 200)
    open var postTitle: String? = null

    @NotNull
    @Lob
    @Column(name = "POST_CONTENT", nullable = false)
    open var postContent: String? = null

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "WRITER_ID")
    open var writer: Member? = null

    @ColumnDefault("0")
    @Column(name = "VIEW_CNT")
    open var viewCnt: Long? = null

    @ColumnDefault("SYSTIMESTAMP")
    @Column(name = "CREATED_AT")
    open var createdAt: Instant? = null

    @Column(name = "UPDATED_AT")
    open var updatedAt: Instant? = null

    @OneToMany(mappedBy = "post")
    open var boardComments: MutableSet<BoardComment> = mutableSetOf()

    @OneToMany(mappedBy = "post")
    open var boardLikes: MutableSet<BoardLike> = mutableSetOf()
}