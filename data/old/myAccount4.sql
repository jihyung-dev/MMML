-- ============================================================
--  SM Account Project: MySQL Schema Definition
--  Target DBMS: MySQL 8.0 / MariaDB / AWS RDS
-- ============================================================

-- 외래 키 체크 비활성화 (테이블 삭제/생성 순서 문제 방지)
SET FOREIGN_KEY_CHECKS = 0;

-- 1. 스키마 생성 및 사용 (클라우드 환경에서는 생략 가능할 수 있음)
CREATE DATABASE IF NOT EXISTS smaccount CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ============================================================
--  TABLE DROPS (재생성을 위해 기존 테이블 삭제)
-- ============================================================

-- 없어도 되므로 주석처리함
# DROP TABLE IF EXISTS SHIPMENT;
# DROP TABLE IF EXISTS ORDER_ITEM;
# DROP TABLE IF EXISTS PAYMENT_TRANSACTION;
# DROP TABLE IF EXISTS ORDER_MAIN;
# DROP TABLE IF EXISTS ITEM_WISH;
# DROP TABLE IF EXISTS ITEM_DETAIL_IMAGE;
# DROP TABLE IF EXISTS HOTDEAL_OPTION;
# DROP TABLE IF EXISTS ITEM;
# DROP TABLE IF EXISTS SELLER;
# DROP TABLE IF EXISTS BOARD_LIKE;
# DROP TABLE IF EXISTS BOARD_COMMENT;
# DROP TABLE IF EXISTS BOARD_POST;
# DROP TABLE IF EXISTS LEDGER_ENTRY;
# DROP TABLE IF EXISTS SUB_CATEGORY;
# DROP TABLE IF EXISTS CATEGORY;
# DROP TABLE IF EXISTS GROUP_MEMBER;
# DROP TABLE IF EXISTS BUDGET_GROUP;
# DROP TABLE IF EXISTS MEMBER;

-- ============================================================
--  TABLE CREATION
-- ============================================================

-- === MEMBER (회원 테이블 - ID 수동 지정) ===
CREATE TABLE smaccount.MEMBER (
                        member_id       VARCHAR(50) NOT NULL,
                        password        VARCHAR(255) NOT NULL,
                        role            VARCHAR(20) NOT NULL,
                        member_name     VARCHAR(100) NOT NULL,
                        member_nickname VARCHAR(50) NOT NULL,
                        address         VARCHAR(255),
                        phone           VARCHAR(20),
                        enabled         CHAR(1) DEFAULT 'Y',
                        created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                        updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                        PRIMARY KEY (member_id),
                        UNIQUE KEY UQ_MEMBER_NICKNAME (member_nickname)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === BUDGET_GROUP (가계부 그룹) ===
CREATE TABLE smaccount.BUDGET_GROUP (
                              group_id        BIGINT NOT NULL AUTO_INCREMENT,
                              group_name      VARCHAR(100) NOT NULL,
                              owner_id        VARCHAR(50) NOT NULL,
                              created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                              updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                              PRIMARY KEY (group_id),
                              FOREIGN KEY (owner_id) REFERENCES smaccount.MEMBER(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === GROUP_MEMBER (가계부 그룹 멤버) ===
CREATE TABLE smaccount.GROUP_MEMBER (
                              group_member_id BIGINT NOT NULL AUTO_INCREMENT,
                              group_id        BIGINT NOT NULL,
                              member_id       VARCHAR(50) NOT NULL,
                              role            VARCHAR(20) NOT NULL,
                              created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                              updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                              PRIMARY KEY (group_member_id),
                              FOREIGN KEY (group_id) REFERENCES smaccount.BUDGET_GROUP(group_id),
                              FOREIGN KEY (member_id) REFERENCES smaccount.MEMBER(member_id),
                              UNIQUE KEY UQ_GROUP_MEMBER (group_id, member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === CATEGORY (대분류 - ID 수동 지정) ===
CREATE TABLE smaccount.CATEGORY (
                          category_id     VARCHAR(50) NOT NULL,
                          category_name   VARCHAR(50) NOT NULL,

                          PRIMARY KEY (category_id),
                          UNIQUE KEY UQ_CATEGORY_NAME (category_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === SUB_CATEGORY (소분류) ===
CREATE TABLE smaccount.SUB_CATEGORY (
                              sub_id            VARCHAR(50) NOT NULL,
                              sub_category_name VARCHAR(50) NOT NULL,
                              category_id       VARCHAR(50) NOT NULL,

                              PRIMARY KEY (sub_id),
                              UNIQUE KEY UQ_SUB_CATEGORY_NAME (sub_category_name),
                              FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === LEDGER_ENTRY (가계부 내역) ===
CREATE TABLE smaccount.LEDGER_ENTRY (
                              entry_id        BIGINT NOT NULL AUTO_INCREMENT,
                              group_id        BIGINT NOT NULL,
                              member_id       VARCHAR(50) NOT NULL,
                              entry_type      VARCHAR(10) NOT NULL, -- 'INCOME', 'EXPENSE'
                              pay_type        VARCHAR(10),          -- 'CASH', 'CARD'
                              card_type       VARCHAR(10),          -- 'CREDIT', 'CHECK'
                              category_id     VARCHAR(50) NOT NULL,
                              entry_amount    DECIMAL(15,2) NOT NULL,
                              currency        VARCHAR(3) DEFAULT 'KRW',
                              occurred_at     DATE NOT NULL,
                              place_of_use    VARCHAR(200),
                              memo            VARCHAR(500),
                              ext_src         VARCHAR(20),
                              created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                              updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                              PRIMARY KEY (entry_id),
                              FOREIGN KEY (group_id) REFERENCES BUDGET_GROUP(group_id),
                              FOREIGN KEY (member_id) REFERENCES MEMBER(member_id),
                              FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id),
                              INDEX IX_LEDGER_GRP_DT (group_id, occurred_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === BOARD_POST (게시글) ===
CREATE TABLE smaccount.BOARD_POST (
                            post_id         BIGINT NOT NULL AUTO_INCREMENT,
                            category        VARCHAR(30) NOT NULL,
                            post_title      VARCHAR(200) NOT NULL,
                            post_content    TEXT NOT NULL,
                            writer_id       VARCHAR(50),
                            view_cnt        INT DEFAULT 0,
                            created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                            updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                            PRIMARY KEY (post_id),
                            FOREIGN KEY (writer_id) REFERENCES MEMBER(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === BOARD_COMMENT (댓글 및 대댓글) ===
CREATE TABLE smaccount.BOARD_COMMENT (
                               comment_id        BIGINT NOT NULL AUTO_INCREMENT,
                               post_id           BIGINT NOT NULL,
                               writer_id         VARCHAR(50),
                               parent_comment_id BIGINT,
                               comment_content   VARCHAR(1000) NOT NULL,
                               created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
                               updated_at        DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                               PRIMARY KEY (comment_id),
                               FOREIGN KEY (post_id) REFERENCES BOARD_POST(post_id) ON DELETE CASCADE,
                               FOREIGN KEY (writer_id) REFERENCES MEMBER(member_id),
                               FOREIGN KEY (parent_comment_id) REFERENCES BOARD_COMMENT(comment_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === BOARD_LIKE (좋아요) ===
CREATE TABLE smaccount.BOARD_LIKE (
                            board_like_id   BIGINT NOT NULL AUTO_INCREMENT,
                            post_id         BIGINT NOT NULL,
                            member_id       VARCHAR(50) NOT NULL,

                            PRIMARY KEY (board_like_id),
                            FOREIGN KEY (post_id) REFERENCES BOARD_POST(post_id) ON DELETE CASCADE,
                            FOREIGN KEY (member_id) REFERENCES MEMBER(member_id) ON DELETE CASCADE,
                            UNIQUE KEY UQ_BOARD_LIKE (post_id, member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === SELLER (핫딜 판매자) ===
CREATE TABLE smaccount.SELLER (
                        seller_id       BIGINT NOT NULL AUTO_INCREMENT,
                        biz_no          VARCHAR(30) NOT NULL,
                        member_id       VARCHAR(50) NOT NULL,
                        biz_type        VARCHAR(30),
                        created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                        updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                        PRIMARY KEY (seller_id),
                        UNIQUE KEY UQ_SELLER_BIZ_NO (biz_no),
                        FOREIGN KEY (member_id) REFERENCES MEMBER(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === ITEM (판매 상품 - 핫딜 메인) ===
CREATE TABLE smaccount.ITEM (
                      item_id          BIGINT NOT NULL AUTO_INCREMENT,
                      seller_id        BIGINT NOT NULL,
                      item_name        VARCHAR(200) NOT NULL,
                      original_price   DECIMAL(15,2) NOT NULL,
                      item_saleprice   DECIMAL(15,2) NOT NULL,
                      category_id      VARCHAR(50) NOT NULL,

                      item_image_url   VARCHAR(500),
                      view_count       INT DEFAULT 0,
                      popularity_score INT DEFAULT 0,

                      sale_start_at    DATE,
                      sale_end_at      DATE NOT NULL,
                      sale_status      VARCHAR(20) DEFAULT 'ON_SALE',

                      created_at       DATETIME DEFAULT CURRENT_TIMESTAMP,
                      updated_at       DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                      PRIMARY KEY (item_id),
                      FOREIGN KEY (seller_id) REFERENCES SELLER(seller_id),
                      FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === HOTDEAL_OPTION (상품 옵션 및 재고) ===
CREATE TABLE smaccount.HOTDEAL_OPTION (
                                option_id        BIGINT NOT NULL AUTO_INCREMENT,
                                item_id          BIGINT NOT NULL,
                                option_type      VARCHAR(100) NOT NULL,
                                option_value     VARCHAR(100) NOT NULL,
                                additional_price DECIMAL(15,2) DEFAULT 0,
                                stock            INT NOT NULL,

                                PRIMARY KEY (option_id),
                                FOREIGN KEY (item_id) REFERENCES ITEM(item_id) ON DELETE CASCADE,
                                UNIQUE KEY UQ_OPTION_PER_ITEM (item_id, option_type, option_value)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === ITEM_DETAIL_IMAGE (상품 상세 이미지) ===
CREATE TABLE smaccount.ITEM_DETAIL_IMAGE (
                                   detail_image_id BIGINT NOT NULL AUTO_INCREMENT,
                                   item_id         BIGINT NOT NULL,
                                   image_url       VARCHAR(500) NOT NULL,
                                   display_order   INT NOT NULL,

                                   PRIMARY KEY (detail_image_id),
                                   FOREIGN KEY (item_id) REFERENCES ITEM(item_id) ON DELETE CASCADE,
                                   UNIQUE KEY UQ_DETAIL_IMAGE_ORDER (item_id, display_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === ITEM_WISH (상품 찜하기) ===
CREATE TABLE smaccount.ITEM_WISH (
                           wish_id         BIGINT NOT NULL AUTO_INCREMENT,
                           item_id         BIGINT NOT NULL,
                           member_id       VARCHAR(50) NOT NULL,
                           created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,

                           PRIMARY KEY (wish_id),
                           FOREIGN KEY (item_id) REFERENCES ITEM(item_id) ON DELETE CASCADE,
                           FOREIGN KEY (member_id) REFERENCES MEMBER(member_id) ON DELETE CASCADE,
                           UNIQUE KEY UQ_ITEM_MEMBER_WISH (item_id, member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === ORDER_MAIN (주문 메인) ===
CREATE TABLE smaccount.ORDER_MAIN (
                            order_id        BIGINT NOT NULL AUTO_INCREMENT,
                            buyer_id        VARCHAR(50) NOT NULL,
                            total_amount    DECIMAL(15,2) NOT NULL,
                            order_status    VARCHAR(20) NOT NULL,
                            created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                            updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                            PRIMARY KEY (order_id),
                            FOREIGN KEY (buyer_id) REFERENCES MEMBER(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === PAYMENT_TRANSACTION (결제 거래 기록) ===
CREATE TABLE smaccount.PAYMENT_TRANSACTION (
                                     txn_id          BIGINT NOT NULL AUTO_INCREMENT,
                                     order_id        BIGINT NOT NULL,
                                     member_id       VARCHAR(50) NOT NULL,
                                     pg_tid          VARCHAR(100),
                                     amount          DECIMAL(15,2) NOT NULL,
                                     txn_status      VARCHAR(20) NOT NULL,
                                     pay_method      VARCHAR(20),
                                     request_time    DATETIME DEFAULT CURRENT_TIMESTAMP,
                                     response_time   DATETIME,
                                     raw_data        TEXT, -- MySQL의 CLOB 대응

                                     PRIMARY KEY (txn_id),
                                     FOREIGN KEY (order_id) REFERENCES ORDER_MAIN(order_id),
                                     FOREIGN KEY (member_id) REFERENCES MEMBER(member_id),
                                     UNIQUE KEY UQ_PG_TID (pg_tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === ORDER_ITEM (주문 상품 목록) ===
CREATE TABLE smaccount.ORDER_ITEM (
                            order_item_id   BIGINT NOT NULL AUTO_INCREMENT,
                            order_id        BIGINT NOT NULL,
                            item_id         BIGINT NOT NULL,
                            option_id       BIGINT,
                            qty             INT NOT NULL,
                            price           DECIMAL(15,2) NOT NULL,

                            PRIMARY KEY (order_item_id),
                            FOREIGN KEY (order_id) REFERENCES ORDER_MAIN(order_id) ON DELETE CASCADE,
                            FOREIGN KEY (item_id) REFERENCES ITEM(item_id),
                            FOREIGN KEY (option_id) REFERENCES HOTDEAL_OPTION(option_id),
                            UNIQUE KEY UQ_ORDER_ITEM (order_id, item_id, option_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === SHIPMENT (배송 정보) ===
CREATE TABLE smaccount.SHIPMENT (
                          shipment_id     BIGINT NOT NULL AUTO_INCREMENT,
                          order_id        BIGINT NOT NULL,
                          tracking_no     VARCHAR(30),
                          carrier         VARCHAR(30),
                          shipment_status VARCHAR(20),
                          created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                          updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                          PRIMARY KEY (shipment_id),
                          FOREIGN KEY (order_id) REFERENCES ORDER_MAIN(order_id),
                          UNIQUE KEY UQ_TRACKING_NO (tracking_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 외래 키 체크 다시 활성화
SET FOREIGN_KEY_CHECKS = 1;

-- 1. 사용자 생성 ('collaborator'는 원하는 ID, '%'는 모든 IP 허용, 비밀번호 설정)
CREATE USER 'collaborator'@'%' IDENTIFIED BY 'secure_password123!';

-- 2. smaccount 스키마에 대한 모든 권한 부여 (읽기/쓰기/수정 가능)
-- 만약 보기만 하게 하려면 ALL PRIVILEGES 대신 SELECT 만 주면 됩니다.
GRANT ALL PRIVILEGES ON smaccount.* TO 'collaborator'@'%';

-- 3. 변경 사항 적용
FLUSH PRIVILEGES;