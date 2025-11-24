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

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardCommentServiceImp implements BoardCommentService {

    private final BoardPostRepository postRepository;     // 🔥 변수명 수정
    private final BoardCommentRepository commentRepository;
    private final MemberRepository memberRepository;

    @Override
    public BoardComment create(Long id, int postId, String writerId, String content, Long parentId) {

        // 게시글 존재 확인
        Optional<BoardPost> postOpt = postRepository.findById(postId);
        if (postOpt.isEmpty()) {
            throw new RuntimeException("게시글 " + postId + "을(를) 찾을 수 없습니다.");
        }

        // 작성자 존재 확인
        Optional<Member> writerOpt = memberRepository.findById(writerId);
        if (writerOpt.isEmpty()) {
            throw new RuntimeException("작성자 " + writerId + "을(를) 찾을 수 없습니다.");
        }

        BoardComment comment = new BoardComment();
        comment.setId(id);
        comment.setPost(postOpt.get());
        comment.setWriter(writerOpt.get());
        comment.setCommentContent(content);
        comment.setCreatedAt(LocalDateTime.now());

        // 부모 댓글(대댓글)
        if (parentId != null) {
            Optional<BoardComment> parentOpt = commentRepository.findById(parentId);
            if (parentOpt.isEmpty()) {
                throw new RuntimeException("부모 댓글 " + parentId + "을(를) 찾을 수 없습니다.");
            }
            comment.setParentComment(parentOpt.get());
        }

        return commentRepository.save(comment);
    }

    @Override
    @Transactional(readOnly = true)
    public List<BoardComment> findByPostId(int postId) {
        // 🔥 게시글 기준 댓글 조회
        return commentRepository.findByPost_IdOrderByCreatedAtAsc(postId);
    }

    @Override
    @Transactional(readOnly = true)
    public BoardComment findById(Long id) {
        Optional<BoardComment> optional = commentRepository.findById(id);

        if (optional.isEmpty()) {
            throw new RuntimeException("댓글 " + id + "이(가) 존재하지 않습니다.");
        }

        return optional.get();
    }

    @Override
    public void delete(Long id) {
        if (!commentRepository.existsById(id)) {
            throw new RuntimeException("삭제할 댓글 " + id + "이 존재하지 않습니다.");
        }
        commentRepository.deleteById(id);
    }
}
