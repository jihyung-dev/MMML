# **📘 SM Account: Project Resource & S**

chema Guide

**가계부 및 핫딜 커뮤니티 통합 서비스**의 URL 매핑 구조와 데이터베이스 테이블 명세서입니다.

## **1\. 🌐 URL 구조 (Resource Mapping)**

서버가 제공하는 동적 리소스 및 API 엔드포인트 구조입니다.

### **1.1 공통 (Common)**

| Method | URL | 설명 |
| :---- | :---- | :---- |
| GET | /, /indexhome.html | 홈 화면 (로그인 분기, 인기 핫딜 썸네일, 최신 게시글 요약) |

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

## **2\. 💾 DB Table Map (Schema: MMML)**

### **\[2.1 회원 & 공통 모듈\]**

| 테이블명 | 컬럼명 | 타입 | 제약/키 | 설명 | 비고 |
| :---- | :---- | :---- | :---- | :---- | :---- |
| **MEMBER** | MEMBER\_ID | VARCHAR(50) | **PK** | 사용자 고유 아이디 |  |
|  | PASSWORD | VARCHAR(255) | NOT NULL | 비밀번호 (BCrypt 해싱) |  |
|  | ROLE | VARCHAR(20) | NOT NULL | 권한 (ADMIN, SELLER, GENERAL) |  |
|  | MEMBER\_NAME | VARCHAR(100) | NOT NULL | 실명 |  |
|  | MEMBER\_NICKNAME | VARCHAR(50) | NOT NULL, **Unique** | 사용자 별명 |  |
|  | ADDRESS | VARCHAR(255) |  | 주소 |  |
|  | PHONE | VARCHAR(20) |  | 전화번호 |  |
|  | **ENABLED** | CHAR(1) | DEFAULT 'Y' | **계정 활성화/삭제 여부** | **추가됨** |
|  | CREATED\_AT | DATETIME |  | 생성 일시 |  |
|  | UPDATED\_AT | DATETIME |  | 최종 수정 일시 |  |
| **CATEGORY** | CATEGORY\_ID | VARCHAR(50) | **PK** | 분류 코드 (C01, H01 등) |  |
|  | CATEGORY\_NAME | VARCHAR(50) | NOT NULL, **Unique** | 분류명 |  |
| **SUB\_CATEGORY** | SUB\_ID | VARCHAR(50) | **PK** | 소분류 코드 |  |
|  | CATEGORY\_ID | VARCHAR(50) | **FK** | 대분류 참조 |  |
|  | SUB\_CATEGORY\_NAME | VARCHAR(50) | NOT NULL, **Unique** | 소분류명 |  |

### **\[2.2 가계부 모듈 (Ledger)\]**

| 테이블명 | 컬럼명 | 타입 | 제약/키 | 설명 | 비고                |
| :---- | :---- | :---- | :---- | :---- |:------------------|
| **BUDGET\_GROUP** | GROUP\_ID | BIGINT | **PK, A.I** | 그룹 고유 번호 |                   |
|  | **GROUP\_NAME** | VARCHAR(100) | NOT NULL | **그룹 이름** | **추가됨**           |
|  | OWNER\_ID | VARCHAR(50) | **FK** | 그룹 소유자 (MEMBER\_ID) |                   |
|  | CREATED\_AT | DATETIME |  | 생성 일시 |                   |
|  | UPDATED\_AT | DATETIME |  | 최종 수정 일시 |                   |
| **GROUP\_MEMBER** | GROUP\_MEMBER\_ID | BIGINT | **PK, A.I** | 멤버십 고유 ID |                   |
|  | **GROUP\_ID** | BIGINT | **FK** | **그룹 ID** | Unique Constraint |
|  | MEMBER\_ID | VARCHAR(50) | **FK** | 회원 ID |                   |
|  | ROLE | VARCHAR(20) | NOT NULL | 그룹 내 역할 (OWNER, MEMBER) |                   |
|  | CREATED\_AT | DATETIME |  | 생성 일시 |                   |
|  | UPDATED\_AT | DATETIME |  | 최종 수정 일시 |                   |
| **LEDGER\_ENTRY** | ENTRY\_ID | BIGINT | **PK, A.I** | 내역 고유 번호 |                   |
|  | GROUP\_ID | BIGINT | **FK** | 그룹 ID |                   |
|  | MEMBER\_ID | VARCHAR(50) | **FK** | 작성자 ID |                   |
|  | ENTRY\_TYPE | VARCHAR(10) | NOT NULL | 구분 (INCOME, EXPENSE) |                   |
|  | PAY\_TYPE | VARCHAR(10) |  | 결제 형태 (CASH, CARD, TRANSFER) |                   |
|  | CARD\_TYPE | VARCHAR(10) |  | 카드 종류 (CREDIT, CHECK) |                   |
|  | CATEGORY\_ID | VARCHAR(50) | **FK** | 카테고리 참조 |                   |
|  | ENTRY\_AMOUNT | DECIMAL(15, 2\) | NOT NULL | 금액 (소수점 2자리까지 허용) | 소수점제거예정           |
|  | **CURRENCY** | VARCHAR(3) | DEFAULT 'KRW' | **통화 단위** | **추가됨**           |
|  | **OCCURRED\_AT** | **DATETIME** | NOT NULL | **발생 일시 (날짜 \+ 시간)** |                   |
|  | PLACE\_OF\_USE | VARCHAR(200) |  | 사용처 |                   |
|  | **MEMO** | VARCHAR(500) |  | **메모** | **추가됨**           |
|  | EXT\_SRC | VARCHAR(20) |  | 외부 출처 (OPEN\_FIN, MYDATA) |                   |
|  | CREATED\_AT | DATETIME |  | 생성 일시 |                   |
|  | UPDATED\_AT | DATETIME |  | 최종 수정 일시 |                   |

### **\[2.3 게시판 모듈 (Board)\]**

| 테이블명 | 컬럼명 | 타입 | 제약/키 | 설명 | 비고 |
| :---- | :---- | :---- | :---- | :---- | :---- |
| **BOARD\_POST** | POST\_ID | BIGINT | **PK, A.I** | 게시글 ID |  |
|  | CATEGORY | VARCHAR(30) | NOT NULL | 말머리 (자유, 팁, 핫딜 정보) |  |
|  | POST\_TITLE | VARCHAR(200) | NOT NULL | 제목 |  |
|  | POST\_CONTENT | LONGTEXT | NOT NULL | 내용 (CLOB 대응) |  |
|  | WRITER\_ID | VARCHAR(50) | **FK** | 작성자 ID |  |
|  | VIEW\_CNT | INT | DEFAULT 0 | 조회수 |  |
|  | CREATED\_AT | DATETIME |  | 생성 일시 |  |
|  | UPDATED\_AT | DATETIME |  | 최종 수정 일시 |  |
| **BOARD\_COMMENT** | COMMENT\_ID | BIGINT | **PK, A.I** | 댓글 ID |  |
|  | POST\_ID | BIGINT | **FK** | 원본 게시글 ID |  |
|  | WRITER\_ID | VARCHAR(50) | **FK** | 작성자 ID |  |
|  | PARENT\_COMMENT\_ID | BIGINT | **FK** | 대댓글의 부모 댓글 ID |  |
|  | COMMENT\_CONTENT | VARCHAR(1000) | NOT NULL | 댓글 내용 |  |
|  | CREATED\_AT | DATETIME |  | 생성 일시 |  |
|  | UPDATED\_AT | DATETIME |  | 최종 수정 일시 |  |
| **BOARD\_LIKE** | BOARD\_LIKE\_ID | BIGINT | **PK, A.I** | 좋아요 기록 ID |  |
|  | POST\_ID | BIGINT | **FK** | 게시글 ID |  |
|  | MEMBER\_ID | VARCHAR(50) | **FK** | 회원 ID | Unique Constraint |

### **\[2.4 핫딜 & 커머스 모듈 (Hotdeal)\]**

| 테이블명 | 컬럼명 | 타입 | 제약/키 | 설명 | 비고 |
| :---- | :---- | :---- | :---- | :---- | :---- |
| **SELLER** | SELLER\_ID | BIGINT | **PK, A.I** | 판매자 고유 번호 |  |
|  | BIZ\_NO | VARCHAR(30) | NOT NULL, **Unique** | 사업자 등록 번호 |  |
|  | MEMBER\_ID | VARCHAR(50) | **FK** | 회원 ID |  |
|  | BIZ\_TYPE | VARCHAR(30) |  | 업종 분류 |  |
|  | CREATED\_AT | DATETIME |  | 생성 일시 |  |
|  | UPDATED\_AT | DATETIME |  | 최종 수정 일시 |  |
| **ITEM** | ITEM\_ID | BIGINT | **PK, A.I** | 상품 ID |  |
|  | SELLER\_ID | BIGINT | **FK** | 판매자 참조 |  |
|  | ITEM\_NAME | VARCHAR(200) | NOT NULL | 상품명 |  |
|  | ORIGINAL\_PRICE | DECIMAL(15,2) | NOT NULL | 정가 (할인 전 금액) |  |
|  | ITEM\_SALEPRICE | DECIMAL(15,2) | NOT NULL | 실제 판매가 (할인 금액) |  |
|  | CATEGORY\_ID | VARCHAR(50) | **FK** | 핫딜 카테고리 참조 |  |
|  | **ITEM\_IMAGE\_URL** | VARCHAR(500) |  | **메인 썸네일 이미지 URL** | **추가됨** |
|  | **VIEW\_COUNT** | INT | DEFAULT 0 | **조회수** | **추가됨** |
|  | POPULARITY\_SCORE | INT | DEFAULT 0 | 인기 순위 산정 점수 |  |
|  | **SALE\_START\_AT** | DATE |  | **판매 시작 일자** | **추가됨** |
|  | **SALE\_END\_AT** | DATE | NOT NULL | **판매 종료 일자** | **추가됨** |
|  | **SALE\_STATUS** | VARCHAR(20) | DEFAULT 'ON\_SALE' | **판매 상태** | **추가됨** |
|  | CREATED\_AT | DATETIME |  | 생성 일시 |  |
|  | UPDATED\_AT | DATETIME |  | 최종 수정 일시 |  |
| **HOTDEAL\_OPTION** | OPTION\_ID | BIGINT | **PK, A.I** | 옵션 ID |  |
|  | ITEM\_ID | BIGINT | **FK** | 상품 ID |  |
|  | OPTION\_TYPE | VARCHAR(100) | NOT NULL | 옵션명 |  |
|  | OPTION\_VALUE | VARCHAR(100) | NOT NULL | 옵션값 |  |
|  | **ADDITIONAL\_PRICE** | DECIMAL(15,2) | DEFAULT 0 | **추가 금액** | **추가됨** |
|  | STOCK | INT | NOT NULL | 재고 수량 |  |
| **ORDER\_MAIN** | ORDER\_ID | BIGINT | **PK, A.I** | 주문 ID |  |
|  | BUYER\_ID | VARCHAR(50) | **FK** | 구매자 ID |  |
|  | TOTAL\_AMOUNT | DECIMAL(15,2) | NOT NULL | 총 결제 금액 |  |
|  | ORDER\_STATUS | VARCHAR(20) | NOT NULL | 주문 상태 |  |
|  | MERCHANT\_UID | VARCHAR(100) | **Unique** | 상점 주문 고유 번호 |  |
|  | CREATED\_AT | DATETIME |  | 생성 일시 |  |
|  | UPDATED\_AT | DATETIME |  | 최종 수정 일시 |  |
| **PAYMENT\_TRANSACTION** | TXN\_ID | BIGINT | **PK, A.I** | 거래 ID |  |
|  | ORDER\_ID | BIGINT | **FK** | 주문 ID |  |
|  | MEMBER\_ID | VARCHAR(50) | **FK** | 결제 시도 회원 |  |
|  | PG\_TID | VARCHAR(100) | **Unique** | PG사 거래 번호 |  |
|  | **IMP\_UID** | VARCHAR(100) | **Unique** | **포트원 거래 고유 번호** | **추가됨** |
|  | AMOUNT | DECIMAL(15,2) | NOT NULL | 결제 금액 |  |
|  | TXN\_STATUS | VARCHAR(20) | NOT NULL | 결제 상태 |  |
|  | **PAY\_METHOD** | VARCHAR(20) |  | **결제 수단** | **추가됨** |
|  | **REQUEST\_TIME** | DATETIME |  | **결제 요청 시각** | **추가됨** |
|  | **RESPONSE\_TIME** | DATETIME |  | **결제 응답 시각** | **추가됨** |
|  | **RAW\_DATA** | TEXT |  | **PG사 원본 데이터** | **추가됨** |
| **SHIPMENT** | SHIPMENT\_ID | BIGINT | **PK, A.I** | 배송 ID |  |
|  | ORDER\_ID | BIGINT | **FK** | 주문 ID |  |
|  | TRACKING\_NO | VARCHAR(30) | **Unique** | 운송장 번호 |  |
|  | **CARRIER** | VARCHAR(30) |  | **택배사 정보** | **추가됨** |
|  | **SHIPMENT\_STATUS** | VARCHAR(20) |  | **배송 상태** | **추가됨** |
|  | CREATED\_AT | DATETIME |  | 생성 일시 |  |
|  | UPDATED\_AT | DATETIME |  | 최종 수정 일시 |  |

