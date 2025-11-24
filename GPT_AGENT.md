# **📘 SM Account Project Development Guide**

이 문서는 **Spring Boot \+ JPA \+ Oracle** 기반의 가계부 및 핫딜 커머스 통합 웹 애플리케이션 개발을 위한 공식 가이드입니다.

## **1\. 🛠 기술 스택 및 환경 (Tech Stack)**

* **Language**: Java 21+
* **Framework**: Spring Boot 3.5.7
* **Build Tool**: Maven
* **Database**: Oracle Database 21c (XE)
* **ORM**: Spring Data JPA (Hibernate)
* **View Engine**: Thymeleaf
* **Test**: JUnit 5, Mockito
* **API Integration**: Open Banking API (Sandbox)

## **2\. 🏗 아키텍처 및 패키지 구조 (Architecture)**

### **2.1 계층형 아키텍처 (Layered Architecture)**

1. **Presentation Layer (controller)**: HTTP 요청 처리, 입력 검증(Validation), View/JSON 응답.
2. **Service Layer (service)**: 비즈니스 로직 실행, 트랜잭션 관리 (@Transactional).
3. **Domain Layer (entity, repository)**: JPA 엔티티 정의 및 DB 접근 인터페이스.
4. **Infrastructure Layer (infra)**: 외부 API(오픈뱅킹), 이메일, 파일 업로드 등 구현.

### **2.2 패키지 구조 예시**

com.smaccount  
├── common          \# 전역 예외 처리, 공통 DTO, 유틸리티  
├── config          \# Security, JPA, Swagger 설정  
├── member          \# 회원 도메인 (Member)  
├── ledger          \# 가계부 도메인 (BudgetGroup, LedgerEntry)  
├── board           \# 게시판 도메인 (Post, Comment, Like)  
├── hotdeal         \# 핫딜/상거래 도메인 (Item, Order, Payment, Shipment)  
│   ├── controller  
│   ├── service  
│   ├── repository  
│   ├── entity  
│   └── dto  
└── infra           \# 외부 연동 (OpenBank)

## **3\. 💾 데이터베이스 모델링 (Schema & Entity)**

**핵심 원칙**:

1. **복합키 금지**: 모든 테이블은 단일 Surrogate PK (NUMBER)를 사용한다. 기존 복합키는 UNIQUE 제약조건으로 대체한다.
2. **ID 생성 전략**: Oracle 12c+ 기능을 활용하여 **GENERATED ALWAYS AS IDENTITY** 전략을 사용한다.
    * JPA 매핑: @GeneratedValue(strategy \= GenerationType.IDENTITY)
3. **식별자 명명**: 테이블명\_id (예: member\_id, order\_id).

### **3.1 공통 & 회원 모듈 (Common & Member)**

| 테이블명 | 설명 | 주요 컬럼 및 특징 |
| :---- | :---- | :---- |
| **MEMBER** | 사용자 정보 | member\_id (PK, String), role (ADMIN/SELLER/GENERAL), member\_nickname (Unique) |
| **CATEGORY** | 대분류 | category\_id (PK, String \- Cxx/Hxx), category\_name |
| **SUB\_CATEGORY** | 소분류 | sub\_id (PK, String), category\_id (FK) |

### **3.2 가계부 모듈 (Ledger)**

| 테이블명 | 설명 | 주요 컬럼 및 특징 |
| :---- | :---- | :---- |
| **BUDGET\_GROUP** | 가계부 그룹 | group\_id (PK, Identity), owner\_id (FK) |
| **GROUP\_MEMBER** | 그룹 멤버십 | group\_member\_id (PK, Identity), role (OWNER/MEMBER), UNIQUE(group\_id, member\_id) |
| **LEDGER\_ENTRY** | 수입/지출 내역 | entry\_id (PK, Identity), amount, entry\_type (INCOME/EXPENSE), ext\_src (오픈뱅킹 연동 여부) |

### **3.3 게시판 모듈 (Board)**

| 테이블명 | 설명 | 주요 컬럼 및 특징 |
| :---- | :---- | :---- |
| **BOARD\_POST** | 게시글 | post\_id (PK, Identity), category (자유/팁/핫딜), view\_cnt |
| **BOARD\_COMMENT** | 댓글 | comment\_id (PK, Identity), parent\_comment\_id (대댓글용 자기참조) |
| **BOARD\_LIKE** | 좋아요 | board\_like\_id (PK, Identity), UNIQUE(post\_id, member\_id) |

### **3.4 핫딜 & 커머스 모듈 (Hotdeal & Commerce)**

| 테이블명 | 설명 | 주요 컬럼 및 특징 |
| :---- | :---- | :---- |
| **SELLER** | 판매자 정보 | seller\_id (PK, Identity), biz\_no (Unique), member\_id (FK) |
| **ITEM** | 상품 메인 | item\_id (PK, Identity), original\_price vs item\_saleprice, sale\_end\_at (타이머용) |
| **HOTDEAL\_OPTION** | 상품 옵션 | option\_id (PK, Identity), additional\_price, stock (재고 관리 핵심) |
| **ITEM\_DETAIL\_IMAGE** | 상세 이미지 | detail\_image\_id (PK, Identity), display\_order |
| **ITEM\_WISH** | 찜하기 | wish\_id (PK, Identity), UNIQUE(item\_id, member\_id) |
| **ORDER\_MAIN** | 주문 헤더 | order\_id (PK, Identity), total\_amount, order\_status |
| **ORDER\_ITEM** | 주문 상세 | order\_item\_id (PK, Identity), option\_id (FK), price, qty, UNIQUE(order, item, option) |
| **PAYMENT\_TRANSACTION** | 결제 기록 | txn\_id (PK, Identity), pg\_tid (PG사 거래번호), txn\_status |
| **SHIPMENT** | 배송 정보 | shipment\_id (PK, Identity), tracking\_no |

## **4\. 🚀 주요 기능 및 개발 가이드**

### **4.1 가계부 서비스 (Ledger Service)**

* **조회**: 월별(occurred\_at), 카테고리별 조회 기능. GROUP BY를 활용한 통계 쿼리 작성 (@Query).
* **오픈금융 연동**: 외부 API에서 데이터를 가져올 때 ext\_src \= 'OPEN\_FIN'으로 마킹하여 저장. 중복 저장 방지 로직 필수.
* **엑셀 다운로드**: Apache POI 라이브러리를 사용하여 조회된 LedgerEntry 리스트를 엑셀로 변환.

### **4.2 게시판 서비스 (Board Service)**

* **계층형 댓글**: parent\_comment\_id가 NULL이면 루트 댓글, 값이 있으면 대댓글로 렌더링. (재귀적 구조보다는 2단계 깊이 제한 권장).
* **좋아요**: 토글(Toggle) 방식으로 구현. BOARD\_LIKE 테이블에 insert/delete 수행 시 BOARD\_POST.like\_count (필요 시) 동기화 혹은 count(\*) 조회.

### **4.3 핫딜 & 커머스 서비스 (Hotdeal Service)**

* **상품 리스트**:
    * 정렬: 최신순(created\_at), 인기순(popularity\_score), 마감임박순(sale\_end\_at).
    * 남은 시간: 서버 시간(LocalDateTime)과 sale\_end\_at의 차이를 계산하여 View에 전달.
* **주문 프로세스 (트랜잭션 보장)**:
    1. **주문 생성**: ORDER\_MAIN 및 ORDER\_ITEM 저장.
    2. **재고 차감**: HOTDEAL\_OPTION.stock 감소 (재고 부족 시 예외 발생 및 롤백 \- Pessimistic Lock 고려).
    3. **결제 시도**: PAYMENT\_TRANSACTION에 'PENDING' 상태로 기록.
    4. **결제 확정**: PG사 성공 응답 시 PAYMENT\_TRANSACTION 상태 'SUCCESS' 변경 및 ORDER\_MAIN 상태 'PAID' 변경.

### **4.4 JPA & DB 설정 (application.yml)**

spring:  
datasource:  
url: jdbc:oracle:thin:@localhost:1521:xe  
username: smaccount  
password: smaccountpw  
driver-class-name: oracle.jdbc.OracleDriver  
jpa:  
hibernate:  
ddl-auto: validate \# 운영 시 validate, 초기 개발 시 update  
properties:  
hibernate.format\_sql: true  
hibernate.default\_batch\_fetch\_size: 100 \# N+1 문제 완화

## **5\. 🧪 테스트 가이드 (Testing)**

* **단위 테스트 (Unit Test)**: JUnit5 \+ Mockito
    * Service 계층의 비즈니스 로직 검증.
    * 외부 API (오픈뱅킹) 호출은 Mocking 처리.
* **통합 테스트 (Integration Test)**: @SpringBootTest
    * 실제 DB(또는 H2)와 연동하여 전체 플로우 검증.
    * @Transactional을 사용하여 테스트 후 데이터 롤백.
* **Repository 테스트**: @DataJpaTest
    * 커스텀 쿼리(@Query) 및 조회 로직 검증.

## **6\. 📝 더미 데이터 활용**

개발 초기 단계에서 UI 및 로직 테스트를 위해 제공된 SQL 스크립트(\*\_dummy\_data.sql)를 반드시 순서대로 실행하여 데이터를 적재하십시오.

1. MEMBER (100명)
2. CATEGORY & SUB\_CATEGORY
3. SELLER (10명)
4. BUDGET\_GROUP & GROUP\_MEMBER
5. LEDGER\_ENTRY (300건)
6. BOARD\_POST, COMMENT, LIKE
7. ITEM, OPTION, IMAGE, WISH
8. ORDER, TRANSACTION, SHIPMENT