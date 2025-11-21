-- =============================
--  SCHEMA SETUP & PERMISSIONS
-- =============================

-- 기존 사용자 삭제 및 신규 사용자 생성
DROP user smaccount cascade;
CREATE USER smaccount IDENTIFIED BY smaccountpw
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP
    QUOTA UNLIMITED ON USERS;

-- 권한 부여 (개발용 최소 권한)
GRANT CONNECT, RESOURCE TO smaccount;
GRANT CREATE VIEW TO smaccount;

-- =============================
--  SCHEMA: smaccount
--  AUTHOR: 개발지침 v3.1 적용 (LEDGER_ENTRY.PLACE_OF_USE 추가)
-- =============================

-- === Sequences ===
CREATE SEQUENCE smaccount.SEQ_GROUP        START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE smaccount.SEQ_CATEGORY     START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE smaccount.SEQ_ENTRY        START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE smaccount.SEQ_POST         START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE smaccount.SEQ_COMMENT      START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE smaccount.SEQ_ITEM         START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE smaccount.SEQ_ORDER        START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE smaccount.SEQ_SHIPMENT     START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE smaccount.SEQ_GROUP_MEMBER START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE smaccount.SEQ_BOARD_LIKE   START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE smaccount.SEQ_ORDER_ITEM   START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE smaccount.SEQ_SELLER       START WITH 1 INCREMENT BY 1;


-- === MEMBER (회원 테이블) ===
CREATE TABLE smaccount.MEMBER (
                                  member_id VARCHAR2(50) PRIMARY KEY,
                                  password  VARCHAR2(255) NOT NULL,
                                  role      VARCHAR2(20)  NOT NULL, -- 관리자, 일반회원, 판매자 등
                                  member_name VARCHAR2(100) NOT NULL, -- 컬럼명 변경
                                  member_nickname  VARCHAR2(50)  NOT NULL UNIQUE, -- 컬럼명 변경
                                  address   VARCHAR2(255),
                                  phone     VARCHAR2(20),
                                  enabled   CHAR(1) DEFAULT 'Y',
                                  created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                  updated_at TIMESTAMP
);

-- === BUDGET_GROUP (가계부 그룹) ===
CREATE TABLE smaccount.BUDGET_GROUP (
                                        group_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                        group_name VARCHAR2(100) NOT NULL, -- 컬럼명 변경
                                        owner_id VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                        created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                        updated_at TIMESTAMP
);

-- === GROUP_MEMBER (가계부 그룹 멤버) ===
CREATE TABLE smaccount.GROUP_MEMBER (
                                        group_member_id NUMBER PRIMARY KEY,
                                        group_id  NUMBER NOT NULL REFERENCES smaccount.BUDGET_GROUP(group_id),
                                        member_id VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                        role      VARCHAR2(20) NOT NULL, -- 그룹 내 역할 (e.g., OWNER, MEMBER)
                                        CONSTRAINT UQ_GROUP_MEMBER UNIQUE (group_id, member_id)
);

-- === CATEGORY (가계부/상품 공통 분류 - 대분류) ===
CREATE TABLE smaccount.CATEGORY (
                                    category_id VARCHAR2(50) PRIMARY KEY,
                                    category_name VARCHAR2(50) NOT NULL unique -- 컬럼명 변경
);

-- === SUB_CATEGORY (가계부/상품 공통 분류 - 소분류) ===
CREATE TABLE smaccount.SUB_CATEGORY (
                                        sub_id VARCHAR2(50) PRIMARY KEY,
                                        sub_category_name VARCHAR2(50) NOT NULL unique, -- 컬럼명 변경
                                        category_id VARCHAR2(50) not null REFERENCES smaccount.CATEGORY(category_id)
);

-- === LEDGER_ENTRY (가계부 내역) ===
CREATE TABLE smaccount.LEDGER_ENTRY (
                                        entry_id NUMBER PRIMARY KEY,
                                        group_id NUMBER NOT NULL REFERENCES smaccount.BUDGET_GROUP(group_id),
                                        member_id VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                        entry_type VARCHAR2(10) NOT NULL, -- 'INCOME', 'EXPENSE' - 컬럼명 변경
                                        pay_type VARCHAR2(10), -- 'CASH', 'CARD'
                                        card_type VARCHAR2(10), -- 'CREDIT', 'CHECK'
                                        category_id VARCHAR2(50) not null REFERENCES smaccount.CATEGORY(category_id),
                                        entry_amount NUMBER(15,2) NOT NULL, -- 컬럼명 변경
                                        currency VARCHAR2(3) DEFAULT 'KRW',
                                        occurred_at DATE NOT NULL,
                                        place_of_use VARCHAR2(200), -- 사용처 항목 추가
                                        memo VARCHAR2(500),
                                        ext_src VARCHAR2(20), -- 외부 API 데이터 출처
                                        created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                        updated_at TIMESTAMP
);
CREATE INDEX smaccount.IX_LEDGER_GRP_DT ON smaccount.LEDGER_ENTRY(group_id, occurred_at);


-- === BOARD_POST (게시글) ===
CREATE TABLE smaccount.BOARD_POST (
                                      post_id NUMBER PRIMARY KEY,
                                      category VARCHAR2(30) NOT NULL,
                                      post_title VARCHAR2(200) NOT NULL, -- 컬럼명 변경
                                      post_content CLOB NOT NULL,       -- 컬럼명 변경
                                      writer_id VARCHAR2(50) REFERENCES smaccount.MEMBER(member_id), -- member_id 참조 유지
                                      view_cnt NUMBER DEFAULT 0,
                                      created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                      updated_at TIMESTAMP
);

-- === BOARD_COMMENT (댓글 및 대댓글) ===
CREATE TABLE smaccount.BOARD_COMMENT (
                                         comment_id NUMBER PRIMARY KEY,
                                         post_id NUMBER NOT NULL REFERENCES smaccount.BOARD_POST(post_id) ON DELETE CASCADE,
                                         writer_id VARCHAR2(50) REFERENCES smaccount.MEMBER(member_id), -- member_id 참조 유지
                                         parent_comment_id NUMBER REFERENCES smaccount.BOARD_COMMENT(comment_id), -- 대댓글의 부모 댓글
                                         comment_content VARCHAR2(1000) NOT NULL, -- 컬럼명 변경
                                         created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                         updated_at TIMESTAMP
);

-- === BOARD_LIKE (좋아요) ===
CREATE TABLE smaccount.BOARD_LIKE (
                                      board_like_id NUMBER PRIMARY KEY,
                                      post_id NUMBER NOT NULL REFERENCES smaccount.BOARD_POST(post_id) ON DELETE CASCADE,
                                      member_id VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id) ON DELETE CASCADE, -- member_id 참조 유지
                                      CONSTRAINT UQ_BOARD_LIKE UNIQUE (post_id, member_id)
);

-- === SELLER (핫딜 판매자) ===
CREATE TABLE smaccount.SELLER (
                                  seller_id NUMBER PRIMARY KEY,
                                  biz_no VARCHAR2(30) NOT NULL UNIQUE, -- 사업자 번호 (고유키)
                                  member_id VARCHAR2(50)  NOT NULL REFERENCES smaccount.MEMBER(member_id), -- 회원 ID 참조
                                  biz_type VARCHAR2(30),
                                  created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                  updated_at TIMESTAMP
);

-- === ITEM (판매 상품) ===
CREATE TABLE smaccount.ITEM (
                                item_id NUMBER PRIMARY KEY,
                                seller_biz_no VARCHAR2(30) NOT NULL REFERENCES smaccount.SELLER(biz_no), -- SELLER의 biz_no 참조
                                item_name VARCHAR2(200) NOT NULL, -- 컬럼명 변경
                                item_price NUMBER(15,2) NOT NULL, -- 컬럼명 변경
                                item_stock NUMBER NOT NULL,       -- 컬럼명 변경
                                category_id VARCHAR2(50) NOT NULL REFERENCES smaccount.CATEGORY(category_id),
                                sale_start_at DATE,
                                sale_end_at   DATE,
                                sale_status   VARCHAR2(20) DEFAULT 'ON_SALE', -- 'ON_SALE' | 'PAUSED' | 'SOLD_OUT' | 'ENDED'
                                created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                updated_at TIMESTAMP
);

-- === ORDER_MAIN (주문 메인) ===
CREATE TABLE smaccount.ORDER_MAIN (
                                      order_id NUMBER PRIMARY KEY,
                                      buyer_id VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                      total_amount NUMBER(15,2) NOT NULL,
                                      order_status VARCHAR2(20) NOT NULL, -- 컬럼명 변경
                                      created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                      updated_at TIMESTAMP
);

-- === ORDER_ITEM (주문 상품 목록) ===
CREATE TABLE smaccount.ORDER_ITEM (
                                      order_item_id NUMBER PRIMARY KEY,
                                      order_id NUMBER NOT NULL REFERENCES smaccount.ORDER_MAIN(order_id) ON DELETE CASCADE,
                                      item_id NUMBER NOT NULL REFERENCES smaccount.ITEM(item_id),
                                      qty NUMBER NOT NULL,
                                      price NUMBER(15,2) NOT NULL, -- 주문 시점의 상품 가격 (ITEM_PRICE와 다름)
                                      CONSTRAINT UQ_ORDER_ITEM UNIQUE (order_id, item_id)
);

-- === SHIPMENT (배송 정보) ===
CREATE TABLE smaccount.SHIPMENT (
                                    shipment_id NUMBER PRIMARY KEY,
                                    order_id NUMBER NOT NULL REFERENCES smaccount.ORDER_MAIN(order_id),
                                    tracking_no VARCHAR2(30) UNIQUE, -- 가짜 송장 번호 생성용
                                    carrier VARCHAR2(30),
                                    shipment_status VARCHAR2(20), -- 컬럼명 변경
                                    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                    updated_at TIMESTAMP
);