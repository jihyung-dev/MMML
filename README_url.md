## 1. 🌐 전체 URL 구조 (SM Account)

서버가 제공하는 동적 리소스 기준입니다.

### **공통 (Home)**
* `/`, `/index.html` **[GET]**: 홈 화면 (로그인 전/후 분기, 인기 핫딜 썸네일, 최신 게시글 요약)

### **회원 (Member)**
* `/member/login.do` **[GET]**: 로그인 페이지
* `/member/login.do` **[POST]**: 로그인 액션
* `/member/logout.do` **[GET]**: 로그아웃
* `/member/signup.do` **[GET]**: 회원가입 양식
    * `/member/{memberId}/existId` **[GET]**: ID 중복 확인 (API)
* `/member/signup.do` **[POST]**: 회원가입 액션
* `/member/my.do` **[GET]**: 마이페이지 (대시보드)
    * `/member/my/profile.do` **[GET/POST]**: 내 정보 수정
    * `/member/my/order.do` **[GET]**: 내 주문/배송 내역 리스트
    * `/member/my/wish.do` **[GET]**: 찜한 핫딜 리스트
    * `/member/my/board.do` **[GET]**: 내가 쓴 글/댓글 리스트

### **가계부 (Ledger)**
* `/ledger/list.do` **[GET]**: 가계부 메인 (월별 달력/리스트 뷰)
    * 파라미터: `?year=2025&month=11&groupId={id}`
* `/ledger/write.do` **[GET]**: 내역 입력 폼 (수입/지출)
* `/ledger/write.do` **[POST]**: 내역 등록 액션
* `/ledger/{entryId}/detail.do` **[GET]**: 내역 상세 보기 (모달 or 페이지)
* `/ledger/edit.do` **[POST]**: 내역 수정 액션
* `/ledger/{entryId}/remove.do` **[POST]**: 내역 삭제 액션
* `/ledger/analysis.do` **[GET]**: 소비 패턴 분석 (차트/통계)
* **그룹 관리**
    * `/ledger/group/list.do` **[GET]**: 내 가계부 그룹 목록
    * `/ledger/group/add.do` **[POST]**: 새 그룹 생성
    * `/ledger/group/{groupId}/invite.do` **[POST]**: 그룹 멤버 초대

### **게시판 (Board)**
* `/board/list.do` **[GET]**: 게시글 리스트 (페이징 20)
    * 파라미터: `?category={FREE|TIP|HOTDEAL}&page=1&sort=createAt&search=...`
* `/board/{postId}/detail.do` **[GET]**: 게시글 상세
    * **좋아요**
        * `/board/{postId}/like` **[POST]**: 게시글 좋아요 토글 (ON/OFF)
    * **댓글**
        * `/board/comment/list.do` **[GET]**: 댓글 리스트 (Ajax 로딩)
        * `/board/comment/write.do` **[POST]**: 댓글/대댓글 작성
        * `/board/comment/{commentId}/remove.do` **[POST]**: 댓글 삭제
* `/board/write.do` **[GET]**: 글쓰기 폼
* `/board/write.do` **[POST]**: 글쓰기 액션
* `/board/edit.do` **[GET/POST]**: 글 수정 폼/액션
* `/board/{postId}/remove.do` **[POST]**: 글 삭제 액션

### **핫딜 & 스토어 (Hotdeal)**
* `/hotdeal/list.do` **[GET]**: 핫딜 상품 리스트
    * 파라미터: `?category={H01...}&sort={popular|latest|endSoon}`
* `/hotdeal/{itemId}/detail.do` **[GET]**: 상품 상세 (옵션 선택, 이미지, 타이머)
    * `/hotdeal/{itemId}/wish` **[POST]**: 상품 찜하기 토글
* **주문/결제**
    * `/order/form.do` **[GET]**: 주문서 작성 페이지 (상품/옵션/수량 정보 전달)
    * `/order/process.do` **[POST]**: 주문 생성 및 결제 요청 (PG 연동 시작)
    * `/order/payment/webhook` **[POST]**: PG사 결제 결과 수신 (API)
    * `/order/complete.do` **[GET]**: 주문 완료 페이지

---

## 2. 💾 SM Account – DB TABLE MAP

* **스키마(유저) 이름**: `smaccount`
* **비밀번호**: `smaccountpw`
* **특징**: 모든 PK는 `NUMBER GENERATED ALWAYS AS IDENTITY` 사용 (MEMBER, CATEGORY 제외).

### **[회원 & 공통]**

**MEMBER** (회원 정보)
* `MEMBER_ID` (PK, String): 아이디
* `PASSWORD`: 비밀번호
* `ROLE`: 권한 (ADMIN, SELLER, GENERAL)
* `MEMBER_NAME`, `MEMBER_NICKNAME` (Unique)
* `ADDRESS`, `PHONE`, `ENABLED`
* `CREATED_AT`, `UPDATED_AT`

**CATEGORY** (대분류)
* `CATEGORY_ID` (PK, String): C01, H01 등 코드값
* `CATEGORY_NAME`

**SUB_CATEGORY** (소분류)
* `SUB_ID` (PK, String)
* `CATEGORY_ID` (FK)
* `SUB_CATEGORY_NAME`

---

### **[가계부 (Ledger)]**

**BUDGET_GROUP** (가계부 그룹)
* `GROUP_ID` (PK)
* `GROUP_NAME`
* `OWNER_ID` (FK): 그룹 소유자

**GROUP_MEMBER** (그룹 멤버핑)
* `GROUP_MEMBER_ID` (PK)
* `GROUP_ID` (FK)
* `MEMBER_ID` (FK)
* `ROLE`: (OWNER, MEMBER)

**LEDGER_ENTRY** (수입/지출 내역)
* `ENTRY_ID` (PK)
* `GROUP_ID` (FK), `MEMBER_ID` (FK)
* `CATEGORY_ID` (FK)
* `ENTRY_TYPE`: (INCOME, EXPENSE)
* `ENTRY_AMOUNT`: 금액
* `OCCURRED_AT`: 발생 일자
* `PLACE_OF_USE`: 사용처
* `MEMO`

---

### **[게시판 (Board)]**

**BOARD_POST** (게시글)
* `POST_ID` (PK)
* `CATEGORY`: (자유, 팁, 핫딜정보)
* `POST_TITLE`, `POST_CONTENT`
* `WRITER_ID` (FK)
* `VIEW_CNT`

**BOARD_COMMENT** (댓글)
* `COMMENT_ID` (PK)
* `POST_ID` (FK), `WRITER_ID` (FK)
* `PARENT_COMMENT_ID` (FK): 대댓글용
* `COMMENT_CONTENT`

**BOARD_LIKE** (게시글 좋아요)
* `BOARD_LIKE_ID` (PK)
* `POST_ID` (FK)
* `MEMBER_ID` (FK)
* `UNIQUE(POST_ID, MEMBER_ID)`

---

### **[핫딜 & 커머스 (Hotdeal)]**

**SELLER** (판매자 정보)
* `SELLER_ID` (PK)
* `MEMBER_ID` (FK)
* `BIZ_NO`: 사업자번호
* `BIZ_TYPE`

**ITEM** (상품 메인)
* `ITEM_ID` (PK)
* `SELLER_ID` (FK), `CATEGORY_ID` (FK)
* `ITEM_NAME`
* `ORIGINAL_PRICE`, `ITEM_SALEPRICE`
* `ITEM_IMAGE_URL`, `VIEW_COUNT`, `POPULARITY_SCORE`
* `SALE_END_AT`: 마감 시간

**HOTDEAL_OPTION** (옵션 및 재고)
* `OPTION_ID` (PK)
* `ITEM_ID` (FK)
* `OPTION_TYPE`, `OPTION_VALUE`
* `ADDITIONAL_PRICE`
* `STOCK`: 재고 수량

**ITEM_DETAIL_IMAGE** (상세 이미지)
* `DETAIL_IMAGE_ID` (PK)
* `ITEM_ID` (FK)
* `IMAGE_URL`, `DISPLAY_ORDER`

**ITEM_WISH** (상품 찜)
* `WISH_ID` (PK)
* `ITEM_ID` (FK), `MEMBER_ID` (FK)

**ORDER_MAIN** (주문서)
* `ORDER_ID` (PK)
* `BUYER_ID` (FK)
* `TOTAL_AMOUNT`
* `ORDER_STATUS`

**ORDER_ITEM** (주문 상세 상품)
* `ORDER_ITEM_ID` (PK)
* `ORDER_ID` (FK)
* `ITEM_ID` (FK), `OPTION_ID` (FK)
* `QTY`, `PRICE`

**PAYMENT_TRANSACTION** (결제 기록)
* `TXN_ID` (PK)
* `ORDER_ID` (FK)
* `PG_TID`: PG사 거래번호
* `AMOUNT`, `TXN_STATUS`

**SHIPMENT** (배송)
* `SHIPMENT_ID` (PK)
* `ORDER_ID` (FK)
* `TRACKING_NO`, `CARRIER`, `SHIPMENT_STATUS`