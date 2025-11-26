-- =============================
--  SCHEMA SETUP & PERMISSIONS
-- =============================

-- 기존 사용자 삭제 및 신규 사용자 생성 (모든 것을 지웁니다.)
DROP USER smaccount CASCADE;
CREATE USER smaccount IDENTIFIED BY smaccountpw -- 비밀번호는 임시로 mmmlpw로 설정
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP
    QUOTA UNLIMITED ON USERS;

-- 권한 부여 (개발용 최소 권한)
GRANT CONNECT, RESOURCE TO smaccount;
GRANT CREATE VIEW TO smaccount;

-- =============================
--  SCHEMA: smaccount (최종 확정 스키마)
--  AUTHOR: 최종 DDL (V7.2 - 인덱스 및 스키마 경로 수정),
--  테이블 컬럼 추가 : PAYMENT_TRANSACTION : imp_uid(uk), ORDER_MAIN : merchant_uid(uk)
-- =============================

-- 외래 키 체크는 Oracle에서는 DB 레벨에서 처리되므로 별도의 SET FOREIGN_KEY_CHECKS는 불필요합니다.

-- === MEMBER (회원 테이블 - ID 수동 지정) ===
CREATE TABLE smaccount.MEMBER (
                                  member_id       VARCHAR2(50) PRIMARY KEY,
                                  password        VARCHAR2(255) NOT NULL,
                                  role            VARCHAR2(20) NOT NULL,
                                  member_name     VARCHAR2(100) NOT NULL,
                                  member_nickname VARCHAR2(50) NOT NULL UNIQUE,
                                  address         VARCHAR2(255),
                                  phone           VARCHAR2(20),
                                  enabled         CHAR(1) DEFAULT 'Y',
                                  created_at      TIMESTAMP DEFAULT SYSTIMESTAMP,
                                  updated_at      TIMESTAMP
);

-- === BUDGET_GROUP (가계부 그룹) ===
CREATE TABLE smaccount.BUDGET_GROUP (
                                        group_id        NUMBER GENERATED ALWAYS AS IDENTITY,
                                        group_name      VARCHAR2(100) NOT NULL,
                                        owner_id        VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                        created_at      TIMESTAMP DEFAULT SYSTIMESTAMP,
                                        updated_at      TIMESTAMP,
                                        CONSTRAINT PK_BUDGET_GROUP PRIMARY KEY (group_id)
);

-- === GROUP_MEMBER (가계부 그룹 멤버) ===
CREATE TABLE smaccount.GROUP_MEMBER (
                                        group_member_id NUMBER GENERATED ALWAYS AS IDENTITY,
                                        group_id        NUMBER NOT NULL REFERENCES smaccount.BUDGET_GROUP(group_id),
                                        member_id       VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                        role            VARCHAR2(20) NOT NULL,
                                        created_at      TIMESTAMP DEFAULT SYSTIMESTAMP,
                                        updated_at      TIMESTAMP,
                                        CONSTRAINT PK_GROUP_MEMBER PRIMARY KEY (group_member_id),
                                        CONSTRAINT UQ_GROUP_MEMBER UNIQUE (group_id, member_id)
);

-- === CATEGORY (대분류 - ID 수동 지정) ===
CREATE TABLE smaccount.CATEGORY (
                                    category_id     VARCHAR2(50) PRIMARY KEY,
                                    category_name   VARCHAR2(50) NOT NULL UNIQUE
);

-- === SUB_CATEGORY (소분류) ===
CREATE TABLE smaccount.SUB_CATEGORY (
                                        sub_id            VARCHAR2(50) PRIMARY KEY,
                                        sub_category_name VARCHAR2(50) NOT NULL UNIQUE,
                                        category_id       VARCHAR2(50) NOT NULL REFERENCES smaccount.CATEGORY(category_id)
);

-- === LEDGER_ENTRY (가계부 내역) ===
CREATE TABLE smaccount.LEDGER_ENTRY (
                                        entry_id        NUMBER GENERATED ALWAYS AS IDENTITY,
                                        group_id        NUMBER NOT NULL REFERENCES smaccount.BUDGET_GROUP(group_id),
                                        member_id       VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                        entry_type      VARCHAR2(10) NOT NULL,
                                        pay_type        VARCHAR2(10),
                                        card_type       VARCHAR2(10),
                                        category_id     VARCHAR2(50) NOT NULL REFERENCES smaccount.CATEGORY(category_id),
                                        entry_amount    NUMBER(15) NOT NULL, -- 소수점 제거 (NUMBER(15,2) -> NUMBER(15))
                                        currency        VARCHAR2(3) DEFAULT 'KRW',
                                        occurred_at     TIMESTAMP NOT NULL, -- DATETIME -> TIMESTAMP
                                        place_of_use    VARCHAR2(200),
                                        memo            VARCHAR2(500),
                                        ext_src         VARCHAR2(20),
                                        created_at      TIMESTAMP DEFAULT SYSTIMESTAMP,
                                        updated_at      TIMESTAMP,
                                        CONSTRAINT PK_LEDGER_ENTRY PRIMARY KEY (entry_id)
);



-- === BOARD_POST (게시글) ===
CREATE TABLE smaccount.BOARD_POST (
                                      post_id         NUMBER GENERATED ALWAYS AS IDENTITY,
                                      category        VARCHAR2(30) NOT NULL,
                                      post_title      VARCHAR2(200) NOT NULL,
                                      post_content    CLOB NOT NULL, -- LONGTEXT -> CLOB
                                      writer_id       VARCHAR2(50) REFERENCES smaccount.MEMBER(member_id),
                                      view_cnt        NUMBER DEFAULT 0,
                                      created_at      TIMESTAMP DEFAULT SYSTIMESTAMP,
                                      updated_at      TIMESTAMP,
                                      CONSTRAINT PK_BOARD_POST PRIMARY KEY (post_id)
);

-- === BOARD_COMMENT (댓글 및 대댓글) ===
CREATE TABLE smaccount.BOARD_COMMENT (
                                         comment_id        NUMBER GENERATED ALWAYS AS IDENTITY,
                                         post_id           NUMBER NOT NULL REFERENCES smaccount.BOARD_POST(post_id) ON DELETE CASCADE,
                                         writer_id         VARCHAR2(50) REFERENCES smaccount.MEMBER(member_id),
                                         parent_comment_id NUMBER REFERENCES smaccount.BOARD_COMMENT(comment_id),
                                         comment_content   VARCHAR2(1000) NOT NULL,
                                         created_at        TIMESTAMP DEFAULT SYSTIMESTAMP,
                                         updated_at        TIMESTAMP,
                                         CONSTRAINT PK_BOARD_COMMENT PRIMARY KEY (comment_id)
);

-- === BOARD_LIKE (좋아요) ===
CREATE TABLE smaccount.BOARD_LIKE (
                                      board_like_id   NUMBER GENERATED ALWAYS AS IDENTITY,
                                      post_id         NUMBER NOT NULL REFERENCES smaccount.BOARD_POST(post_id) ON DELETE CASCADE,
                                      member_id       VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id) ON DELETE CASCADE,
                                      CONSTRAINT PK_BOARD_LIKE PRIMARY KEY (board_like_id),
                                      CONSTRAINT UQ_BOARD_LIKE UNIQUE (post_id, member_id)
);

-- === SELLER (핫딜 판매자) ===
CREATE TABLE smaccount.SELLER (
                                  seller_id       NUMBER GENERATED ALWAYS AS IDENTITY,
                                  biz_no          VARCHAR2(30) NOT NULL UNIQUE,
                                  member_id       VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                  biz_type        VARCHAR2(30),
                                  created_at      TIMESTAMP DEFAULT SYSTIMESTAMP,
                                  updated_at      TIMESTAMP,
                                  CONSTRAINT PK_SELLER PRIMARY KEY (seller_id)
);

-- === ITEM (판매 상품 - 핫딜 메인) ===
CREATE TABLE smaccount.ITEM (
                                item_id          NUMBER GENERATED ALWAYS AS IDENTITY,
                                seller_id        NUMBER NOT NULL REFERENCES smaccount.SELLER(seller_id),
                                item_name        VARCHAR2(200) NOT NULL,
                                original_price   NUMBER(15) NOT NULL,
                                item_saleprice   NUMBER(15) NOT NULL,
                                category_id      VARCHAR2(50) NOT NULL REFERENCES smaccount.CATEGORY(category_id),

                                item_image_url   VARCHAR2(500),
                                view_count       NUMBER DEFAULT 0,
                                popularity_score NUMBER DEFAULT 0,

                                sale_start_at    DATE,
                                sale_end_at      DATE NOT NULL,
                                sale_status      VARCHAR2(20) DEFAULT 'ON_SALE',

                                created_at       TIMESTAMP DEFAULT SYSTIMESTAMP,
                                updated_at       TIMESTAMP,
                                CONSTRAINT PK_ITEM PRIMARY KEY (item_id)
);

-- === HOTDEAL_OPTION (상품 옵션 및 재고) ===
CREATE TABLE smaccount.HOTDEAL_OPTION (
                                          option_id        NUMBER GENERATED ALWAYS AS IDENTITY,
                                          item_id          NUMBER NOT NULL REFERENCES smaccount.ITEM(item_id) ON DELETE CASCADE,
                                          option_type      VARCHAR2(100) NOT NULL,
                                          option_value     VARCHAR2(100) NOT NULL,
                                          additional_price NUMBER(15) DEFAULT 0,
                                          stock            NUMBER NOT NULL,

                                          CONSTRAINT PK_HOTDEAL_OPTION PRIMARY KEY (option_id),
                                          CONSTRAINT UQ_OPTION_PER_ITEM UNIQUE (item_id, option_type, option_value)
);

-- === ITEM_DETAIL_IMAGE (상품 상세 이미지) ===
CREATE TABLE smaccount.ITEM_DETAIL_IMAGE (
                                             detail_image_id NUMBER GENERATED ALWAYS AS IDENTITY,
                                             item_id         NUMBER NOT NULL REFERENCES smaccount.ITEM(item_id) ON DELETE CASCADE,
                                             image_url       VARCHAR2(500) NOT NULL,
                                             display_order   NUMBER NOT NULL,

                                             CONSTRAINT PK_ITEM_DETAIL_IMAGE PRIMARY KEY (detail_image_id),
                                             CONSTRAINT UQ_DETAIL_IMAGE_ORDER UNIQUE (item_id, display_order)
);

-- === ITEM_WISH (상품 찜하기/좋아요) ===
CREATE TABLE smaccount.ITEM_WISH (
                                     wish_id         NUMBER GENERATED ALWAYS AS IDENTITY,
                                     item_id         NUMBER NOT NULL REFERENCES smaccount.ITEM(item_id) ON DELETE CASCADE,
                                     member_id       VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id) ON DELETE CASCADE,
                                     created_at      TIMESTAMP DEFAULT SYSTIMESTAMP,

                                     CONSTRAINT PK_ITEM_WISH PRIMARY KEY (wish_id),
                                     CONSTRAINT UQ_ITEM_MEMBER_WISH UNIQUE (item_id, member_id)
);


-- === ORDER_MAIN (주문 메인) ===
CREATE TABLE smaccount.ORDER_MAIN (
                                      order_id        NUMBER GENERATED ALWAYS AS IDENTITY,
                                      buyer_id        VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                      total_amount    NUMBER(15) NOT NULL,
                                      order_status    VARCHAR2(20) NOT NULL,
                                      merchant_uid    VARCHAR2(100) NOT NULL, -- NEW FIELD
                                      created_at      TIMESTAMP DEFAULT SYSTIMESTAMP,
                                      updated_at      TIMESTAMP,
                                      CONSTRAINT PK_ORDER_MAIN PRIMARY KEY (order_id),
                                      CONSTRAINT UQ_MERCHANT_UID UNIQUE (merchant_uid) -- NEW CONSTRAINT
);

-- === PAYMENT_TRANSACTION (결제 거래 기록) ===
CREATE TABLE smaccount.PAYMENT_TRANSACTION (
                                               txn_id          NUMBER GENERATED ALWAYS AS IDENTITY,
                                               order_id        NUMBER NOT NULL REFERENCES smaccount.ORDER_MAIN(order_id),
                                               member_id       VARCHAR2(50) NOT NULL REFERENCES smaccount.MEMBER(member_id),
                                               pg_tid          VARCHAR2(100),
                                               imp_uid         VARCHAR2(100), -- NEW FIELD
                                               amount          NUMBER(15) NOT NULL,
                                               txn_status      VARCHAR2(20) NOT NULL,
                                               pay_method      VARCHAR2(20),
                                               request_time    TIMESTAMP DEFAULT SYSTIMESTAMP,
                                               response_time   TIMESTAMP,
                                               raw_data        CLOB, -- TEXT -> CLOB

                                               CONSTRAINT PK_PAYMENT_TXN PRIMARY KEY (txn_id),
                                               CONSTRAINT UQ_PG_TID UNIQUE (pg_tid),
                                               CONSTRAINT UQ_IMP_UID UNIQUE (imp_uid) -- NEW CONSTRAINT
);


-- === ORDER_ITEM (주문 상품 목록) ===
CREATE TABLE smaccount.ORDER_ITEM (
                                      order_item_id   NUMBER GENERATED ALWAYS AS IDENTITY,
                                      order_id        NUMBER NOT NULL REFERENCES smaccount.ORDER_MAIN(order_id) ON DELETE CASCADE,
                                      item_id         NUMBER NOT NULL REFERENCES smaccount.ITEM(item_id),
                                      option_id       NUMBER REFERENCES smaccount.HOTDEAL_OPTION(option_id),
                                      qty             NUMBER NOT NULL,
                                      price           NUMBER(15) NOT NULL,

                                      CONSTRAINT PK_ORDER_ITEM PRIMARY KEY (order_item_id),
                                      CONSTRAINT UQ_ORDER_ITEM UNIQUE (order_id, item_id, option_id)
);

-- === SHIPMENT (배송 정보) ===
CREATE TABLE smaccount.SHIPMENT (
                                    shipment_id     NUMBER GENERATED ALWAYS AS IDENTITY,
                                    order_id        NUMBER NOT NULL REFERENCES smaccount.ORDER_MAIN(order_id),
                                    tracking_no     VARCHAR2(30) UNIQUE,
                                    carrier         VARCHAR2(30),
                                    shipment_status VARCHAR2(20),
                                    created_at      TIMESTAMP DEFAULT SYSTIMESTAMP,
                                    updated_at      TIMESTAMP,
                                    CONSTRAINT PK_SHIPMENT PRIMARY KEY (shipment_id)
);