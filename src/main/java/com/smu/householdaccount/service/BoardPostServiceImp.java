package com.smu.householdaccount.service;

import com.smu.householdaccount.entity.BoardPost;
import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.repository.BoardPostRepository;
import com.smu.householdaccount.repository.MemberRepository;
import com.smu.householdaccount.service.BoardPostService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardPostServiceImp implements BoardPostService{

    private final BoardPostRepository boardPostRepository;
    private final MemberRepository memberRepository;

    @Override
    public BoardPost create(int id, String writerId, String category,String postTitle, String postContent) {
        Optional<Member> optional = memberRepository.findById(writerId);

        if (optional.isEmpty()) {
            throw new RuntimeException("작성자 " + writerId + "을(를) 찾을 수 없습니다.");
        }

        Member writer = optional.get();// 안전하게 가져오기
        BoardPost post=new BoardPost();
        post.setId(id);
        post.setWriter(writer);
        post.setCategory(category);
        post.setPostTitle(postTitle);
        post.setPostContent(postContent);
        post.setViewCnt(0L);
        post.setCreatedAt(LocalDateTime.now());

        return boardPostRepository.save(post);
    }


    /**
     * 페이징 목록 조회
     */
    @Override
    @Transactional(readOnly = true)
    public Page<BoardPost> findAll(Pageable pageable) {
        return boardPostRepository.findAll(pageable);
    }


    /**
     * 게시글 단건 조회
     */
    @Override
    @Transactional(readOnly = true)
    public BoardPost findById(int id) {
        Optional<BoardPost> optional = boardPostRepository.findById(id);

        if (optional.isEmpty()) {
            throw new RuntimeException("게시글 " + id + "이 존재하지 않습니다.");
        }

        return optional.get();
    }


    /**
     * 게시글 수정 (Dirty Checking)
     */
    @Override
    public BoardPost update(int id, String category, String title, String content) {
        Optional<BoardPost> optional = boardPostRepository.findById(id);

        if (optional.isEmpty()) {
            throw new RuntimeException("게시글 " + id + "이 존재하지 않습니다.");
        }

        BoardPost post = optional.get();

        post.setCategory(category);
        post.setPostTitle(title);
        post.setPostContent(content);
        post.setUpdatedAt(LocalDateTime.now());

        return post;
    }


    /**
     * 게시글 삭제
     */
    @Override
    public void delete(int id) {
        boardPostRepository.deleteById(id);
    }



    /**
     * 조회수 증가
     */
    @Override
    public void increaseViewCount(int id) {
        Optional<BoardPost> optional = boardPostRepository.findById(id);

        if (optional.isEmpty()) {
            throw new RuntimeException("게시글 " + id + "이 존재하지 않습니다.");
        }

        BoardPost post = optional.get();

        post.setViewCnt(post.getViewCnt() + 1);
    }

    @Override
    public Page<BoardPost> search(String keyword, Pageable pageable) {
        if(keyword==null|| keyword.isBlank()){
            return boardPostRepository.findAll(pageable);
        }



        return boardPostRepository.findByPostTitleContainingOrPostContentContaining(keyword, keyword, pageable);
    }
}
