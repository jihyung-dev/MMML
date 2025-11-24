package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.BoardComment;
import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.repository.BoardCommentRepository;
import com.smu.householdaccount.repository.BoardPostRepository;
import com.smu.householdaccount.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardCommentServiceImp implements BoardCommentService {

    private final BoardCommentRepository commentRepository;
    private final BoardPostRepository postRepository;
    private final MemberRepository memberRepository;

    @Override
    public BoardComment write(Long postId, String writerId, String content, Long parentId) {

        BoardPost post = postRepository.findById(postId)
                .orElseThrow(() -> new RuntimeException("게시글 없음"));

        Member writer = memberRepository.findById(writerId)
                .orElseThrow(() -> new RuntimeException("작성자 없음"));

        BoardComment comment = new BoardComment();
        comment.setPost(post);
        comment.setWriter(writer);
        comment.setCommentContent(content);

        if (parentId != null) {
            BoardComment parent = commentRepository.findById(parentId)
                    .orElseThrow(() -> new RuntimeException("부모 댓글 없음"));
            comment.setParentComment(parent);
        }

        return commentRepository.save(comment);
    }

    @Override
    public List<BoardComment> findByPost(Long postId) {
        return commentRepository.findByPost_IdOrderByCreatedAtAsc(postId);
    }

    @Override
    public void delete(Long id) {
        commentRepository.deleteById(id);
    }
}
