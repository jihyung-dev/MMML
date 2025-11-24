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

@Service
@RequiredArgsConstructor
@Transactional
public class BoardPostServiceImp implements BoardPostService {

    private final BoardPostRepository boardPostRepository;
    private final MemberRepository memberRepository;

    @Override
    public BoardPost create(String writerId, String category, String postTitle, String postContent) {

        Member writer = memberRepository.findById(writerId)
                .orElseThrow(() -> new RuntimeException("작성자 없음: " + writerId));

        BoardPost post = new BoardPost();
        post.setWriter(writer);
        post.setCategory(category);
        post.setPostTitle(postTitle);
        post.setPostContent(postContent);
        post.setViewCnt(0L);

        return boardPostRepository.save(post);
    }

    @Override
    public Page<BoardPost> findAll(Pageable pageable) {
        return boardPostRepository.findAll(pageable);
    }

    @Override
    public BoardPost findById(Long id) {
        return boardPostRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("게시글 없음: " + id));
    }

    @Override
    public BoardPost update(Long id, String category, String postTitle, String postContent) {
        BoardPost post = findById(id);
        post.setCategory(category);
        post.setPostTitle(postTitle);
        post.setPostContent(postContent);
        return post;
    }

    @Override
    public void delete(Long id) {
        boardPostRepository.deleteById(id);
    }

    @Override
    public void increaseViewCount(Long id) {
        BoardPost post = findById(id);
        post.setViewCnt(post.getViewCnt() + 1);
    }

    @Override
    public Page<BoardPost> search(String keyword, Pageable pageable) {
        return boardPostRepository.findByPostTitleContainingOrPostContentContaining(keyword, keyword, pageable);
    }
}
