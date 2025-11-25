# **📘 SM Account: Project Resource & S**

chema Guide

**가계부 및 핫딜 커뮤니티 통합 서비스**의 URL 매핑 구조와 데이터베이스 테이블 명세서입니다.

## **1\. 🌐 URL 구조 (Resource Mapping)**

서버가 제공하는 동적 리소스 및 API 엔드포인트 구조입니다.

### **1.1 공통 (Common)**

| Method | URL | 설명 |
| :---- | :---- | :---- |
| GET | /, /index.html | 홈 화면 (로그인 분기, 인기 핫딜 썸네일, 최신 게시글 요약) |

### **1.2 회원 (Member)**

| Method | URL | 설명 |
| :---- | :---- | :---- |
| GET | /member/login.do | 로그인 페이지 이동 |
| POST | /member/login.do | 로그인 처리 (Spring Security) |
| GET | /member/logout.do | 로그아웃 처리 |
| GET | /member/signup.do | 회원가입 페이지 이동 |
| GET | /member/{memberId}/existId | 아이디 중복 확인 (AJAX API) |
| POST | /member/signup.do | 회원가입 처리 |
| GET | /member/my.do | 마이페이지 (대시보드) |
| GET | /member/my/profile.do | 내 정보 수정 페이지 |
| POST | /member/my/profile.do | 내 정보 수정 처리 |
| GET | /member/my/order.do | 내 주문/배송 내역 리스트 |
| GET | /member/my/wish.do | 찜한 핫딜 상품 리스트 |
| GET | /member/my/board.do | 내가 작성한 글/댓글 리스트 |

### **1.3 가계부 (Ledger)**

| Method | URL | 설명 | 파라미터 예시 |
| :---- | :---- | :---- | :---- |
| GET | /ledger/list.do | 가계부 메인 (월별/달력 뷰) | ?year=2025\&month=11\&groupId=1 |
| GET | /ledger/write.do | 내역 입력 폼 (수입/지출) |  |
| POST | /ledger/write.do | 내역 등록 처리 |  |
| GET | /ledger/{entryId}/detail.do | 내역 상세 보기 (모달) |  |
| POST | /ledger/edit.do | 내역 수정 처리 |  |
| POST | /ledger/{entryId}/remove.do | 내역 삭제 처리 |  |
| GET | /ledger/analysis.do | 소비 패턴 분석 (차트/통계) | ?period=month |
| GET | /ledger/group/list.do | 내 가계부 그룹 목록 |  |
| POST | /ledger/group/add.do | 새 그룹 생성 |  |
| POST | /ledger/group/{groupId}/invite.do | 그룹 멤버 초대 |  |

### **1.4 게시판 (Board)**

| Method | URL | 설명 | 파라미터 예시 |
| :---- | :---- | :---- | :---- |
| GET | /board/list.do | 게시글 리스트 | ?category=TIP\&page=1\&sort=new |
| GET | /board/{postId}/detail.do | 게시글 상세 화면 |  |
| POST | /board/{postId}/like | 게시글 좋아요 토글 (API) |  |
| GET | /board/comment/list.do | 댓글 리스트 조회 (AJAX) | ?postId=10 |
| POST | /board/comment/write.do | 댓글/대댓글 작성 (API) |  |
| POST | /board/comment/{id}/remove.do | 댓글 삭제 (API) |  |
| GET | /board/write.do | 글쓰기 폼 이동 |  |
| POST | /board/write.do | 글쓰기 처리 |  |
| GET | /board/edit.do | 글 수정 폼 이동 |  |
| POST | /board/edit.do | 글 수정 처리 |  |
| POST | /board/{postId}/remove.do | 글 삭제 처리 |  |

### **1.5 핫딜 & 스토어 (Hotdeal)**

| Method | URL | 설명 | 파라미터 예시 |
| :---- | :---- | :---- | :---- |
| GET | /hotdeal/list.do | 핫딜 상품 리스트 | ?cat=H01\&sort=popular |
| GET | /hotdeal/{itemId}/detail.do | 상품 상세 (옵션, 이미지, 타이머) |  |
| POST | /hotdeal/{itemId}/wish | 상품 찜하기 토글 (API) |  |
| GET | /order/form.do | 주문서 작성 페이지 | ?itemId=5\&optId=2 |
| POST | /order/process.do | 주문 생성 및 결제 요청 |  |
| POST | /order/payment/webhook | PG사 결제 결과 수신 (Webhook) |  |
| GET | /order/complete.do | 주문 완료(성공) 페이지 |  |

## **2\. 💾 DB Table Map (Schema: smaccount)**

* **유저명**: smaccount
* **비밀번호**: smaccountpw
* **PK 전략**: MEMBER, CATEGORY 제외 모든 테이블 **NUMBER GENERATED ALWAYS AS IDENTITY** 사용.

### **\[회원 & 공통 모듈\]**

#### **MEMBER (회원 정보)**

* MEMBER\_ID (PK, VARCHAR2): 사용자 아이디 (수동 입력)
* PASSWORD: 비밀번호 (BCrypt 암호화)
* ROLE: 권한 (ADMIN, SELLER, GENERAL)
* MEMBER\_NAME: 실명
* MEMBER\_NICKNAME: 별명 (Unique)
* ADDRESS, PHONE, ENABLED
* CREATED\_AT, UPDATED\_AT

#### **CATEGORY (대분류)**

* CATEGORY\_ID (PK, VARCHAR2): 분류 코드 (예: C01, H01)
* CATEGORY\_NAME: 분류명

#### **SUB\_CATEGORY (소분류)**

* SUB\_ID (PK, VARCHAR2): 소분류 코드
* CATEGORY\_ID (FK): 대분류 참조
* SUB\_CATEGORY\_NAME: 소분류명

### **\[가계부 모듈 (Ledger)\]**

#### **BUDGET\_GROUP (가계부 그룹)**

* GROUP\_ID (PK, Identity): 그룹 고유 번호
* GROUP\_NAME: 그룹 이름
* OWNER\_ID (FK): 그룹 소유자

#### **GROUP\_MEMBER (그룹 멤버십)**

* GROUP\_MEMBER\_ID (PK, Identity)
* GROUP\_ID (FK)
* MEMBER\_ID (FK)
* ROLE: 그룹 내 권한 (OWNER, MEMBER)
* *Unique Constraint*: (GROUP\_ID, MEMBER\_ID)

#### **LEDGER\_ENTRY (수입/지출 내역)**

* ENTRY\_ID (PK, Identity)
* GROUP\_ID (FK), MEMBER\_ID (FK)
* CATEGORY\_ID (FK): 지출/수입 카테고리
* ENTRY\_TYPE: 구분 (INCOME, EXPENSE)
* ENTRY\_AMOUNT: 금액
* OCCURRED\_AT: 발생 일자
* PLACE\_OF\_USE: 사용처
* MEMO: 메모
* EXT\_SRC: 외부 데이터 출처 (예: OPEN\_FIN)

### **\[게시판 모듈 (Board)\]**

#### **BOARD\_POST (게시글)**

* POST\_ID (PK, Identity)
* CATEGORY: 말머리 (자유, 가계부 팁, 핫딜 정보)
* POST\_TITLE: 제목
* POST\_CONTENT: 내용 (CLOB)
* WRITER\_ID (FK): 작성자
* VIEW\_CNT: 조회수

#### **BOARD\_COMMENT (댓글)**

* COMMENT\_ID (PK, Identity)
* POST\_ID (FK)
* WRITER\_ID (FK)
* PARENT\_COMMENT\_ID (FK): 대댓글용 부모 ID (Self Reference)
* COMMENT\_CONTENT: 내용

#### **BOARD\_LIKE (좋아요)**

* BOARD\_LIKE\_ID (PK, Identity)
* POST\_ID (FK)
* MEMBER\_ID (FK)
* *Unique Constraint*: (POST\_ID, MEMBER\_ID) \- 중복 좋아요 방지

### **\[핫딜 & 커머스 모듈 (Hotdeal)\]**

#### **SELLER (판매자 정보)**

* SELLER\_ID (PK, Identity)
* MEMBER\_ID (FK): 회원 정보 연결
* BIZ\_NO: 사업자 등록 번호 (Unique)
* BIZ\_TYPE: 업종

#### **ITEM (상품 메인)**

* ITEM\_ID (PK, Identity)
* SELLER\_ID (FK)
* CATEGORY\_ID (FK): 핫딜 카테고리
* ITEM\_NAME: 상품명
* ORIGINAL\_PRICE: 정가
* ITEM\_SALEPRICE: 판매가 (할인가)
* ITEM\_IMAGE\_URL: 썸네일 이미지 URL
* VIEW\_COUNT, POPULARITY\_SCORE: 인기 지표
* SALE\_END\_AT: 판매 종료 시각 (타이머용)

#### **HOTDEAL\_OPTION (상품 옵션)**

* OPTION\_ID (PK, Identity)
* ITEM\_ID (FK)
* OPTION\_TYPE: 옵션명 (색상, 사이즈 등)
* OPTION\_VALUE: 옵션값 (Red, XL 등)
* ADDITIONAL\_PRICE: 추가 금액
* **STOCK**: 재고 수량 (주문 시 차감 대상)

#### **ITEM\_DETAIL\_IMAGE (상세 이미지)**

* DETAIL\_IMAGE\_ID (PK, Identity)
* ITEM\_ID (FK)
* IMAGE\_URL: 이미지 경로
* DISPLAY\_ORDER: 표시 순서

#### **ITEM\_WISH (상품 찜)**

* WISH\_ID (PK, Identity)
* ITEM\_ID (FK)
* MEMBER\_ID (FK)
* *Unique Constraint*: (ITEM\_ID, MEMBER\_ID)

#### **ORDER\_MAIN (주문서 헤더)**

* ORDER\_ID (PK, Identity)
* BUYER\_ID (FK): 구매자
* TOTAL\_AMOUNT: 총 결제 금액
* ORDER\_STATUS: 주문 상태 (PAID, SHIPPED, DELIVERED, CANCELED)

#### **ORDER\_ITEM (주문 상세 품목)**

* ORDER\_ITEM\_ID (PK, Identity)
* ORDER\_ID (FK)
* ITEM\_ID (FK)
* OPTION\_ID (FK)
* QTY: 구매 수량
* PRICE: 구매 당시 단가

#### **PAYMENT\_TRANSACTION (결제 기록)**

* TXN\_ID (PK, Identity)
* ORDER\_ID (FK)
* PG\_TID: PG사 거래 고유 번호 (Unique)
* AMOUNT: 결제 금액
* TXN\_STATUS: 결제 상태 (SUCCESS, FAILED, CANCELED)

#### **SHIPMENT (배송 정보)**

* SHIPMENT\_ID (PK, Identity)
* ORDER\_ID (FK)
* TRACKING\_NO: 운송장 번호 (Unique)
* CARRIER: 택배사
* SHIPMENT\_STATUS: 배송 상태