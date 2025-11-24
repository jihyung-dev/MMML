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

@Service
@RequiredArgsConstructor
@Transactional
public class BoardLikeServiceImp implements BoardLikeService {

    private final BoardLikeRepository boardLikeRepository;
    private final BoardPostRepository postRepository;
    private final MemberRepository memberRepository;

    @Override
    public void like(Long postId, String memberId) {

        if (isLiked(postId, memberId)) return;

        BoardPost post = postRepository.findById(postId)
                .orElseThrow(() -> new RuntimeException("게시글 없음"));

        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new RuntimeException("회원 없음"));

        BoardLike like = new BoardLike();
        like.setPost(post);
        like.setMember(member);

        boardLikeRepository.save(like);
    }

    @Override
    public void unlike(Long postId, String memberId) {
        boardLikeRepository.findByPost_IdAndMember_MemberId(postId, memberId)
                .ifPresent(boardLikeRepository::delete);
    }

    @Override
    public boolean isLiked(Long postId, String memberId) {
        return boardLikeRepository.findByPost_IdAndMember_MemberId(postId, memberId).isPresent();
    }

    @Override
    public long countLikes(Long postId) {
        return boardLikeRepository.countByPost_Id(postId);
    }
}
