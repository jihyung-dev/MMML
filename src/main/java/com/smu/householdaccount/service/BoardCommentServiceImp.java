package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.BoardComment;
import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.repository.BoardCommentRepository;
import com.smu.householdaccount.repository.BoardPostRepository;
import com.smu.householdaccount.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardCommentServiceImp implements BoardCommentService {

    private final BoardCommentRepository commentRepository;
    private final BoardPostRepository postRepository;
    private final MemberRepository memberRepository;

    /**
     * 댓글 / 대댓글 생성
     */
    @Override
    public BoardComment create(Long postId,
                               String content,
                               Long parentCommentId,
                               String loginUserId) {

        BoardPost post = postRepository.findById(postId)
                .orElseThrow(() -> new RuntimeException("게시글이 존재하지 않습니다."));

        Member writer = memberRepository.findById(loginUserId)
                .orElseThrow(() -> new RuntimeException("로그인 사용자를 찾을 수 없습니다."));

        BoardComment comment = new BoardComment();
        comment.setPost(post);
        comment.setWriter(writer);
        comment.setCommentContent(content);
        comment.setCreatedAt(LocalDateTime.now());
        comment.setUpdatedAt(LocalDateTime.now());

        // 대댓글이면 부모 설정
        if (parentCommentId != null) {
            BoardComment parent = commentRepository.findById(parentCommentId)
                    .orElseThrow(() -> new RuntimeException("부모 댓글이 존재하지 않습니다."));
            comment.setParentComment(parent);
        }

        return commentRepository.save(comment);
    }

    /**
     * 댓글 삭제 (본인만 가능)
     */
    @Override
    public void delete(Long commentId, String loginUserId) {

        BoardComment comment = commentRepository.findById(commentId)
                .orElseThrow(() -> new RuntimeException("댓글이 존재하지 않습니다."));

        if (comment.getWriter() == null ||
                !comment.getWriter().getMemberId().equals(loginUserId)) {
            throw new RuntimeException("본인 댓글만 삭제할 수 있습니다.");
        }

        commentRepository.delete(comment);
    }

    /**
     * 특정 게시글의 부모 댓글 페이지네이션
     * page: 0부터 시작
     * size: 한 페이지당 부모 댓글 수
     */
    @Override
    @Transactional(readOnly = true)
    public Page<BoardComment> getParentComments(Long postId, int page, int size) {
        PageRequest pageable = PageRequest.of(
                page,
                size,
                Sort.by(Sort.Direction.ASC, "createdAt")
        );

        return commentRepository.findByPost_IdAndParentCommentIsNull(postId, pageable);
    }
}
