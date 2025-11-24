
package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.BoardLike;
import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.repository.BoardLikeRepository;
import com.smu.householdaccount.repository.BoardPostRepository;
import com.smu.householdaccount.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardLikeServiceImp implements BoardLikeService {

    private final BoardLikeRepository boardLikeRepository;
    private final BoardPostRepository postRepository;
    private final MemberRepository memberRepository;

    @Override
    public void like(Long likeId, int postId, String memberId) {

        // 이미 눌렀으면 무시
        if (isLiked(postId, memberId)) {
            return;
        }

        BoardPost post = postRepository.findById(postId)
                .orElseThrow(() -> new RuntimeException("게시글 " + postId + " 없음"));

        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new RuntimeException("회원 " + memberId + " 없음"));

        BoardLike like = new BoardLike();
        like.setId(likeId);
        like.setPost(post);
        like.setMember(member);

        boardLikeRepository.save(like);
    }

    @Override
    public void unlike(int postId, String memberId) {
        Optional<BoardLike> optional =
                boardLikeRepository.findByPost_IdAndMember_MemberId(postId, memberId);

        optional.ifPresent(boardLikeRepository::delete);
    }

    @Override
    public boolean isLiked(int postId, String memberId) {
        return boardLikeRepository
                .findByPost_IdAndMember_MemberId(postId, memberId)
                .isPresent();
    }

    @Override
    public long countLikes(int postId) {
        return boardLikeRepository.countByPost_Id(postId);
    }
}
