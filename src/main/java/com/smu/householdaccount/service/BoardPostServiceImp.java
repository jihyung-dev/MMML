package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.repository.BoardPostRepository;
import com.smu.householdaccount.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@Transactional
public class BoardPostServiceImp implements BoardPostService {

    private final BoardPostRepository boardPostRepository;
    private final MemberRepository memberRepository;

    /**
     * 게시글 작성
     */
    @Override
    public BoardPost create(String category, String title, String content, String loginUserId) {

        Member writer = memberRepository.findById(loginUserId)
                .orElseThrow(() -> new RuntimeException("존재하지 않는 회원입니다."));

        BoardPost post = new BoardPost();
        post.setCategory(category);
        post.setPostTitle(title);
        post.setPostContent(content);
        post.setWriter(writer);
        post.setCreatedAt(LocalDateTime.now());
        post.setUpdatedAt(LocalDateTime.now());
        post.setViewCnt(0L);

        return boardPostRepository.save(post);
    }

    /**
     * 게시글 전체 조회 (최신순)
     */
    @Override
    public Page<BoardPost> findAll(Pageable pageable) {
        return boardPostRepository.findAllByOrderByCreatedAtDesc(pageable);
    }

    /**
     * 게시글 상세 조회
     */
    @Override
    public BoardPost findById(Long id) {
        return boardPostRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("게시글을 찾을 수 없습니다."));
    }

    /**
     * 게시글 수정 (작성자 본인만)
     */
    @Override
    public BoardPost update(Long id, String category, String title, String content, String loginUserId) {

        BoardPost post = findById(id);

        // 본인인지 확인
        if (!post.getWriter().getMemberId().equals(loginUserId)) {
            throw new RuntimeException("본인만 게시글을 수정할 수 있습니다.");
        }

        post.setCategory(category);
        post.setPostTitle(title);
        post.setPostContent(content);
        post.setUpdatedAt(LocalDateTime.now());

        return post;  // JPA가 자동 flush 반영
    }

    /**
     * 게시글 삭제 (작성자 본인만)
     */
    @Override
    public void delete(Long id, String loginUserId) {

        BoardPost post = findById(id);

        if (!post.getWriter().getMemberId().equals(loginUserId)) {
            throw new RuntimeException("본인만 게시글을 삭제할 수 있습니다.");
        }

        boardPostRepository.delete(post);
    }

    /**
     * 조회수 증가
     */
    @Override
    public void increaseViewCount(Long id) {
        BoardPost post = findById(id);
        post.setViewCnt(post.getViewCnt() + 1);
    }

    /**
     * 검색: 제목 or 내용 (최신순)
     */
    @Override
    public Page<BoardPost> search(String keyword, Pageable pageable) {

        return boardPostRepository
                .findByPostTitleContainingOrPostContentContainingOrderByCreatedAtDesc(
                        keyword, keyword, pageable
                );
    }
}
