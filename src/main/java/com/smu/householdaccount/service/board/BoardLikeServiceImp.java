package com.smu.householdaccount.service.board;

import com.smu.householdaccount.entity.board.BoardLike;
import com.smu.householdaccount.entity.board.BoardPost;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.repository.board.BoardLikeRepository;
import com.smu.householdaccount.repository.board.BoardPostRepository;
import com.smu.householdaccount.repository.common.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardLikeServiceImp implements BoardLikeService {

    private final BoardLikeRepository boardLikeRepository;
    private final BoardPostRepository boardPostRepository;
    private final MemberRepository memberRepository;

    /**
     * 좋아요 추가 (중복 방지)
     */
    @Override
    public void like(Long postId, String loginUserId) {

        BoardPost post = boardPostRepository.findById(postId)
                .orElseThrow(() -> new RuntimeException("게시글을 찾을 수 없습니다."));

        Member member = memberRepository.findById(loginUserId)
                .orElseThrow(() -> new RuntimeException("로그인된 사용자를 찾을 수 없습니다."));

        // 중복 좋아요 방지
        boolean alreadyLiked = boardLikeRepository
                .findByPost_IdAndMember_MemberId(postId, loginUserId)
                .isPresent();

        if (alreadyLiked) {
            return; // 이미 눌렀으면 무시
        }

        BoardLike like = new BoardLike();
        like.setPost(post);
        like.setPostId(post.getId());                // ✅ FK 컬럼
        like.setMember(member);
        like.setMemberId(member.getMemberId());      // ✅ FK 컬럼

        boardLikeRepository.save(like);
    }

    /**
     * 좋아요 취소
     */
    @Override
    public void unlike(Long postId, String loginUserId) {

        BoardLike like = boardLikeRepository
                .findByPost_IdAndMember_MemberId(postId, loginUserId)
                .orElse(null);

        if (like != null) {
            boardLikeRepository.delete(like);
        }
    }

    /**
     * 특정 글을 로그인한 유저가 좋아요 눌렀는지 확인
     */
    @Override
    @Transactional(readOnly = true)
    public boolean isLiked(Long postId, String loginUserId) {
        return boardLikeRepository
                .findByPost_IdAndMember_MemberId(postId, loginUserId)
                .isPresent();
    }

    /**
     * 좋아요 수 조회
     */
    @Override
    @Transactional(readOnly = true)
    public long countLikes(Long postId) {
        return boardLikeRepository.countByPost_Id(postId);
    }
}
