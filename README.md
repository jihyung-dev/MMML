전체 URL 구조를 시각적으로 한 번에 (서버가 제공하는 동적 리소스)

/,/index.html [GET]: 홈화면 (로그인,회원가입,카테고리별 인기정보글, 최신 내가한 질문)
MyService
 내정보 조회 ()

/info/list.do?page=1&sort=createAt [GET] : 정보글 리스트(페이징 20)
/info/list.do?page=1&sort=createAt&search=엔터티+생성+법&field=title&tag=jpa [GET] : 정보글 검색(페이징 20)
/info/{id}/detail.do [GET]: 정보 상세
    //정보 좋아요
    /info/{id}/like [POST] : 정보 좋아요 (memberId는 로그인 세션)
    /info/{like_id}/like [REMOVE] : 정보 삭제
    //정보 댓글
    /info/comment/list.do?page=1&sort=createAt [GET] : 정보 댓글 리스트(페이징 20)
    /info/comment/write.do [POST] :  정보 댓글 작성
    /info/comment/{commentId}/remove.do [REMOVE] : 정보 댓글 삭제
        //정보 댓글 좋아요
        /info/comment/{comment_id}/like [POST] : 정보 좋아요 (memberId는 로그인 세션)
        /info/comment/{comment_id}/like [REMOVE] : 정보 삭제
/info/write.do [GET]: 정보 작성 폼
/info/write.do [POST]: 정보 작성 액션 
/info/edit.do [GET]: 정보 수정 폼
/info/edit.do [POST]: 정보 수정 액션 
/info/{id}/remove.do [GET] : 정보 삭제 액션

/qna/list.do?page=1&sort=createAt [GET] : 질문글 리스트(페이징 20)
/qna/list.do?page=1&sort=createAt&search=엔터티생성&field=title&tag=jpa [GET] : 질문글 검색(페이징 20)
/qna/{id}/detail.do [GET]: 질문 상세
    //질문상세에서 리액션(공감,어려움,흥미로움,도움됨 {'EMPATHY','CONFUSING','INTERESTING','HELPFUL'})
    /qna/{id}/{react}/recation [POST] : 질문 공감 (memberId는 로그인 세션)
    /qna/{id}/recation [REMOVE] : 질문 삭제
    //질문상세 댓글 
    /qna/comment/list.do?page=1&sort=createAt [GET] : 질문 댓글 리스트(페이징 20)
    /qna/comment/write.do [POST] : 질문 댓글 작성
    /qna/{comment_id}/comment [REMOVE] : 질문 댓글 삭제
        //정보 댓글 채택(해당 게시)  ({qna_post.id,qna_comment.id}<-qna_adopt : 채택글이 게시글 번호를 참조하는 것은 역정규화 )
        /qna/{id}/{comment_id}/comment/adopt [PUT] : 질문 채택 
        /qna/{id}/{comment_id}/comment/adopt [REMOVE] : 질문 채택 취소
        //정보 댓글 좋아요
        /info/comment/{comment_id}/like [POST] : 정보 좋아요 (memberId는 로그인 세션)
        /info/comment/{comment_id}/like [REMOVE] : 정보 삭제

/qna/write.do [GET]: 질문 작성 폼
/qna/write.do [POST]: 질문 작성 액션
/qna/edit.do [GET]: 질문 수정 폼
/qna/edit.do [POST]: 질문 수정 액션
    /qna/{id}/remove.do [GET] : 질문 삭제 액션

/tag/list.do [GET]: 게시글 검색, 게시글 등록시 태그 검색  

/user/login.do [GET]: 로그인페이지
/user/login.do [POST]: 로그인액션
/user/logout.do [GET]: 로그아웃
/user/signup.do [GET]: 회원가입 양식
    /user/[memberId]/existId [GET] : id가 존재하는지 조회
/user/signup.do [POST]: 회원가입 액션
/user/my.do : 로그인한 유저의 활동내역 (memberId는 로그인 세션)
    //정보게시글 활동 내역
    /info/writer/list.do?page=1&sort=createAt&row=5 [[GET] : 로그인한 유저가 작성한 정보 리스트(Top 5)
    /info/writer/like [POST] :로그인한 유저가 '좋아요'를 한 정보 게시글의 리스트(Top 5)
    //정보게시글 댓글 활동내역
    /info/comment/writer/list.do?page=1&sort=createAt&row=5 [GET] : 로그인한 유저가 작성한 정보 게시글의 댓글 리스트(Top 5)
    /info/comment/writer/like [POST] :로그인한 유저가 '좋아요'를 한 정보 게시글의 댓글 리스트(Top 5)
    //질문게시글 활동 내역
    /qna/writer/list.do?page=1&sort=createAt&row=5 [GET] : 로그인한 유저가 작성한 질문 리스트(Top 5)
    /qna/writer/recation [POST] :로그인한 유저가 '좋아요'를 한 질문 게시글의 리스트(Top 5)
    //질문게시글 댓글 활동내역
    /qna/comment/writer/list.do?page=1&sort=createAt&row=5 [GET] : 로그인한 유저가 작성한 질문 게시글의 댓글 리스트(Top 5)
    /qna/comment/writer/like [POST] :로그인한 유저가 '좋아요'를 한 질문 게시글의 댓글 리스트(Top 5)

•	스키마(유저) 이름: km_coding
•	비밀번호: km_codingpw
•	모든 테이블 생성 시: km_coding.TABLE_NAME
•	MEMBER_ID만 직접 사용, 나머지 PK는 모두 GENERATED ALWAYS AS IDENTITY 사용
•	INFO_POST_TAG / QNA_POST_TAG는 PK: TAG_MAP_ID(단일 키)로 생성하여 복합키 제거


km_coding – DB TABLE MAP (Simple + 역할 요약)

MEMBER 역할: 사이트 모든 기능의 공통 사용자 정보 저장.

MEMBER (
MEMBER_ID (PK)
EMAIL
PASSWORD
NICKNAME
CREATED_AT
UPDATED_AT
)

TAG 역할: 정보공유/질문 게시판에서 사용하는 공통 태그 목록.

TAG (
TAG_ID (PK)
NAME
)

INFO_POST 역할: 정보공유 게시판의 게시글 저장.

INFO_POST (
POST_ID (PK)
MEMBER_ID (FK)
TITLE
CONTENT
CREATED_AT
UPDATED_AT
)

INFO_LIKE 역할: 정보공유 게시글에 대한 좋아요 기록.

INFO_LIKE (
LIKE_ID (PK)
POST_ID (FK)
MEMBER_ID (FK)
POST_ID+MEMBER_ID (UK)
)


INFO_COMMENT 역할: 정보공유 게시글의 댓글/대댓글 저장.

INFO_COMMENT (
COMMENT_ID (PK)
POST_ID (FK)
MEMBER_ID (FK)
CONTENT
PARENT_ID (FK)
CREATED_AT
)

INFO_COMMENT_LIKE 역할: 정보공유 댓글(답변)에 대한 좋아요 기록.

INFO_COMMENT_LIKE (
LIKE_ID (PK)
COMMENT_ID (FK)
MEMBER_ID (FK)
COMMENT_ID+MEMBER_ID (UK)
)


INFO_POST_TAG 역할: 정보공유 게시글과 태그의 N:N 매핑.

INFO_POST_TAG (
MAP_ID (PK)
POST_ID (FK)
TAG_ID (FK)
POST_ID+TAG_ID (UK)
)



QNA_POST 역할: 질문 게시판의 질문 글 저장.

QNA_POST (
POST_ID (PK)
MEMBER_ID (FK)
TITLE
CONTENT
CREATED_AT
UPDATED_AT
)

QNA_COMMENT 역할: 질문 글의 답변/댓글/대댓글 저장.

QNA_COMMENT (
COMMENT_ID (PK)
POST_ID (FK)
MEMBER_ID (FK)
CONTENT
PARENT_ID (FK)
CREATED_AT
)

QNA_COMMENT_LIKE 역할: 질문 댓글(답변)에 대한 좋아요 기록.

QNA_COMMENT_LIKE (
LIKE_ID (PK)
COMMENT_ID (FK)
MEMBER_ID (FK)
COMMENT_ID+MEMBER_ID (UK)

)


QNA_ADOPT 역할: 질문에서 채택된 답변을 저장(질문당 1개).

QNA_ADOPT (
ADOPT_ID (PK)
POST_ID (FK)
COMMENT_ID (FK)
POST_ID+COMMENT_ID (UK)
CREATED_AT
)

QNA_POST_TAG 역할: 질문 게시글과 태그의 N:N 매핑.

QNA_POST_TAG (
MAP_ID (PK)
TAG_ID (FK)
POST_ID (FK)
TAG_ID+POST_ID (UK)
)

전체 구조 요약(역할 포함)

MEMBER
- 모든 게시판/댓글/좋아요/채택의 사용자

TAG
- 공통 태그 목록

INFO_POST
- 정보공유 게시글

INFO_COMMENT
- 정보공유 댓글/대댓글

INFO_LIKE
- 정보공유 게시글 좋아요

INFO_POST_TAG
- 정보공유 게시글 ↔ 태그 연결

QNA_POST
- 질문글 저장

QNA_COMMENT
- 답변/댓글/대댓글 저장

QNA_COMMENT_LIKE
- 댓글(답변) 좋아요 기록

QNA_ADOPT
- 채택 정보(질문당 1개)

QNA_POST_TAG
- 질문 ↔ 태그 연결