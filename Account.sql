DROP user smaccount cascade;
CREATE USER smaccount IDENTIFIED BY smaccountpw
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP
    QUOTA UNLIMITED ON USERS;
--
-- -- 2. 권한 부여 (개발용 최소 권한)
 GRANT CONNECT, RESOURCE TO smaccount;
--
-- -- (선택) 테이블 생성 전 제약조건 뷰를 보기 위해 필요할 수 있음
GRANT CREATE VIEW TO smaccount;

-- =============================
--  SCHEMA: smaccount
--  AUTHOR: 개발지침 v1.1 적용
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
CREATE SEQUENCE smaccount.SEQ_BIZ   START WITH 1 INCREMENT BY 1;


-- === MEMBER ===
CREATE TABLE smaccount.MEMBER (
                                  member_id VARCHAR2(50) PRIMARY KEY,
                                  password  VARCHAR2(255) NOT NULL,
                                  role      VARCHAR2(20)  NOT NULL,
                                  name      VARCHAR2(100) NOT NULL,
                                  address   VARCHAR2(255),
                                  phone     VARCHAR2(20),
                                  enabled   CHAR(1) DEFAULT 'Y',
                                  created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                  updated_at TIMESTAMP
);

-- === BUDGET_GROUP ===
CREATE TABLE smaccount.BUDGET_GROUP (
                                        group_id NUMBER PRIMARY KEY,
                                        name     VARCHAR2(100) NOT NULL,
                                        owner_id VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                        created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                        updated_at TIMESTAMP
);

-- === GROUP_MEMBER (단일 PK + UNIQUE(group, member)) ===
CREATE TABLE smaccount.GROUP_MEMBER (
                                        group_member_id NUMBER PRIMARY KEY,
                                        group_id  NUMBER NOT NULL REFERENCES smaccount.BUDGET_GROUP(group_id),
                                        member_id VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                        role      VARCHAR2(20) NOT NULL,
                                        CONSTRAINT UQ_GROUP_MEMBER UNIQUE (group_id, member_id)
);

-- === CATEGORY ===
CREATE TABLE smaccount.CATEGORY (
                                    category_id VARCHAR2(50) PRIMARY KEY,
                                    name VARCHAR2(50) NOT NULL unique
);

CREATE TABLE smaccount.SUB_CATEGORY (

                                    sub_id VARCHAR2(50) PRIMARY KEY,
                                    name VARCHAR2(50) NOT NULL unique,
                                    category_id VARCHAR2(50) not null REFERENCES smaccount.CATEGORY(category_id)
);

-- === LEDGER_ENTRY ===
CREATE TABLE smaccount.LEDGER_ENTRY (
                                        entry_id NUMBER PRIMARY KEY,
                                        group_id NUMBER NOT NULL REFERENCES smaccount.BUDGET_GROUP(group_id),
                                        member_id VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                        type VARCHAR2(10) NOT NULL,
                                        pay_type VARCHAR2(10),
                                        card_type VARCHAR2(10),
                                        category_id VARCHAR2(50) not null REFERENCES smaccount.CATEGORY(category_id),
                                        amount NUMBER(15,2) NOT NULL,
                                        currency VARCHAR2(3) DEFAULT 'KRW',
                                        occurred_at DATE NOT NULL,
                                        memo VARCHAR2(500),
                                        ext_src VARCHAR2(20),
                                        created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                        updated_at TIMESTAMP
);
CREATE INDEX smaccount.IX_LEDGER_GRP_DT ON smaccount.LEDGER_ENTRY(group_id, occurred_at);

-- === BOARD ===
CREATE TABLE smaccount.BOARD_POST (
                                      post_id NUMBER PRIMARY KEY,
                                      category VARCHAR2(30) NOT NULL,
                                      title VARCHAR2(200) NOT NULL,
                                      content CLOB NOT NULL,
                                      writer_id VARCHAR2(50) REFERENCES smaccount.MEMBER(member_id),
                                      view_cnt NUMBER DEFAULT 0,
                                      created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                      updated_at TIMESTAMP
);

CREATE TABLE smaccount.BOARD_COMMENT (
                                         comment_id NUMBER PRIMARY KEY,
                                         post_id NUMBER NOT NULL REFERENCES smaccount.BOARD_POST(post_id) ON DELETE CASCADE,
                                         writer_id VARCHAR2(50) REFERENCES smaccount.MEMBER(member_id),
                                         content VARCHAR2(1000) NOT NULL,
                                         created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                         updated_at TIMESTAMP
);

-- 단일 PK + UNIQUE(post, member)
CREATE TABLE smaccount.BOARD_LIKE (
                                      board_like_id NUMBER PRIMARY KEY,
                                      post_id NUMBER NOT NULL REFERENCES smaccount.BOARD_POST(post_id) ON DELETE CASCADE,
                                      member_id VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id) ON DELETE CASCADE,
                                      CONSTRAINT UQ_BOARD_LIKE UNIQUE (post_id, member_id)
);

-- === HOTDEAL ===
CREATE TABLE smaccount.Biz (
                                  biz_id NUMBER PRIMARY KEY,
                                  biz_no VARCHAR2(30) NOT NULL UNIQUE,
                                  seller_id VARCHAR2(50)  NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                  biz_type VARCHAR2(30),
                                  created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                  updated_at TIMESTAMP
);

-- v1.1: 판매기간/판매상태 추가
-- sale_status 예: 'ON_SALE' | 'PAUSED' | 'SOLD_OUT' | 'ENDED'
CREATE TABLE smaccount.ITEM (
                                item_id NUMBER PRIMARY KEY,
                                seller_id VARCHAR2(50) NOT NULL REFERENCES smaccount.Biz(biz_no),
                                name VARCHAR2(200) NOT NULL,
                                price NUMBER(15,2) NOT NULL,
                                stock NUMBER NOT NULL,
                                sale_start_at DATE,
                                sale_end_at   DATE,
                                sale_status   VARCHAR2(20) DEFAULT 'ON_SALE',
                                created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                updated_at TIMESTAMP
);

CREATE TABLE smaccount.ORDER_MAIN (
                                      order_id NUMBER PRIMARY KEY,
                                      buyer_id VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                      total_amount NUMBER(15,2) NOT NULL,
                                      status VARCHAR2(20) NOT NULL,
                                      created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                      updated_at TIMESTAMP
);

-- 단일 PK + UNIQUE(order, item)
CREATE TABLE smaccount.ORDER_ITEM (
                                      order_item_id NUMBER PRIMARY KEY,
                                      order_id NUMBER NOT NULL REFERENCES smaccount.ORDER_MAIN(order_id) ON DELETE CASCADE,
                                      item_id NUMBER NOT NULL REFERENCES smaccount.ITEM(item_id),
                                      qty NUMBER NOT NULL,
                                      price NUMBER(15,2) NOT NULL,
                                      CONSTRAINT UQ_ORDER_ITEM UNIQUE (order_id, item_id)
);

CREATE TABLE smaccount.SHIPMENT (
                                    shipment_id NUMBER PRIMARY KEY,
                                    order_id NUMBER NOT NULL REFERENCES smaccount.ORDER_MAIN(order_id),
                                    tracking_no VARCHAR2(30) UNIQUE,
                                    carrier VARCHAR2(30),
                                    status VARCHAR2(20),
                                    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
                                    updated_at TIMESTAMP
);

