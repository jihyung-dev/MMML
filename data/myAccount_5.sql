-- ============================================================
--  SM Account Project: MySQL Schema Definition (Migrated to MMML)
--  Target DBMS: MySQL 8.0 / MariaDB
--  AUTHOR: 최종 DDL + Merchant UID, IMP UID 추가
-- ============================================================

-- 외래 키 체크 비활성화 (테이블 삭제/생성 순서 문제 방지)
SET FOREIGN_KEY_CHECKS = 0;

-- 1. 스키마 생성 및 사용
CREATE DATABASE IF NOT EXISTS MMML CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE MMML;

-- ============================================================
--  TABLE DROPS (재생성을 위해 기존 테이블 삭제)
-- ============================================================
DROP TABLE IF EXISTS MMML.SHIPMENT;
DROP TABLE IF EXISTS MMML.ORDER_ITEM;
DROP TABLE IF EXISTS MMML.PAYMENT_TRANSACTION;
DROP TABLE IF EXISTS MMML.ORDER_MAIN;
DROP TABLE IF EXISTS MMML.ITEM_WISH;
DROP TABLE IF EXISTS MMML.ITEM_DETAIL_IMAGE;
DROP TABLE IF EXISTS MMML.HOTDEAL_OPTION;
DROP TABLE IF EXISTS MMML.ITEM;
DROP TABLE IF EXISTS MMML.SELLER;
DROP TABLE IF EXISTS MMML.BOARD_LIKE;
DROP TABLE IF EXISTS MMML.BOARD_COMMENT;
DROP TABLE IF EXISTS MMML.BOARD_POST;
DROP TABLE IF EXISTS MMML.LEDGER_ENTRY;
DROP TABLE IF EXISTS MMML.SUB_CATEGORY;
DROP TABLE IF EXISTS MMML.CATEGORY;
DROP TABLE IF EXISTS MMML.GROUP_MEMBER;
DROP TABLE IF EXISTS MMML.BUDGET_GROUP;
DROP TABLE IF EXISTS MMML.MEMBER;

-- ============================================================
--  TABLE CREATION (MMML. 접두사 적용 완료)
-- ============================================================

-- === MEMBER (회원 테이블 - ID 수동 지정) ===
CREATE TABLE MMML.MEMBER (
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
CREATE TABLE MMML.BUDGET_GROUP (
                                   group_id        BIGINT NOT NULL AUTO_INCREMENT,
                                   group_name      VARCHAR(100) NOT NULL,
                                   owner_id        VARCHAR(50) NOT NULL,
                                   created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                                   updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                                   PRIMARY KEY (group_id),
                                   FOREIGN KEY (owner_id) REFERENCES MMML.MEMBER(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === GROUP_MEMBER (가계부 그룹 멤버) ===
CREATE TABLE MMML.GROUP_MEMBER (
                                   group_member_id BIGINT NOT NULL AUTO_INCREMENT,
                                   group_id        BIGINT NOT NULL,
                                   member_id       VARCHAR(50) NOT NULL,
                                   role            VARCHAR(20) NOT NULL,
                                   created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                                   updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                                   PRIMARY KEY (group_member_id),
                                   FOREIGN KEY (group_id) REFERENCES MMML.BUDGET_GROUP(group_id),
                                   FOREIGN KEY (member_id) REFERENCES MMML.MEMBER(member_id),
                                   UNIQUE KEY UQ_GROUP_MEMBER (group_id, member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === CATEGORY (대분류 - ID 수동 지정) ===
CREATE TABLE MMML.CATEGORY (
                               category_id     VARCHAR(50) NOT NULL,
                               category_name   VARCHAR(50) NOT NULL,

                               PRIMARY KEY (category_id),
                               UNIQUE KEY UQ_CATEGORY_NAME (category_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === SUB_CATEGORY (소분류) ===
CREATE TABLE MMML.SUB_CATEGORY (
                                   sub_id            VARCHAR(50) NOT NULL,
                                   sub_category_name VARCHAR(50) NOT NULL,
                                   category_id       VARCHAR(50) NOT NULL,

                                   PRIMARY KEY (sub_id),
                                   UNIQUE KEY UQ_SUB_CATEGORY_NAME (sub_category_name),
                                   FOREIGN KEY (category_id) REFERENCES MMML.CATEGORY(category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === LEDGER_ENTRY (가계부 내역) ===
CREATE TABLE MMML.LEDGER_ENTRY (
                                   entry_id        BIGINT NOT NULL AUTO_INCREMENT,
                                   group_id        BIGINT NOT NULL,
                                   member_id       VARCHAR(50) NOT NULL,
                                   entry_type      VARCHAR(10) NOT NULL,
                                   pay_type        VARCHAR(10),
                                   card_type       VARCHAR(10),
                                   category_id     VARCHAR(50) NOT NULL,
                                   entry_amount    DECIMAL(15,2) NOT NULL,
                                   currency        VARCHAR(3) DEFAULT 'KRW',
                                   occurred_at     DATETIME NOT NULL, -- DATETIME으로 수정됨
                                   place_of_use    VARCHAR(200),
                                   memo            VARCHAR(500),
                                   ext_src         VARCHAR(20),
                                   created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                                   updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                                   PRIMARY KEY (entry_id),
                                   FOREIGN KEY (group_id) REFERENCES MMML.BUDGET_GROUP(group_id),
                                   FOREIGN KEY (member_id) REFERENCES MMML.MEMBER(member_id),
                                   FOREIGN KEY (category_id) REFERENCES MMML.CATEGORY(category_id),
                                   INDEX IX_LEDGER_GRP_DT (group_id, occurred_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === BOARD_POST (게시글) ===
CREATE TABLE MMML.BOARD_POST (
                                 post_id         BIGINT NOT NULL AUTO_INCREMENT,
                                 category        VARCHAR(30) NOT NULL,
                                 post_title      VARCHAR(200) NOT NULL,
                                 post_content    LONGTEXT NOT NULL,
                                 writer_id       VARCHAR(50),
                                 view_cnt        INT DEFAULT 0,
                                 created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                                 updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                                 PRIMARY KEY (post_id),
                                 FOREIGN KEY (writer_id) REFERENCES MMML.MEMBER(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === BOARD_COMMENT (댓글 및 대댓글) ===
CREATE TABLE MMML.BOARD_COMMENT (
                                    comment_id        BIGINT NOT NULL AUTO_INCREMENT,
                                    post_id           BIGINT NOT NULL,
                                    writer_id         VARCHAR(50),
                                    parent_comment_id BIGINT,
                                    comment_content   VARCHAR(1000) NOT NULL,
                                    created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
                                    updated_at        DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                                    PRIMARY KEY (comment_id),
                                    FOREIGN KEY (post_id) REFERENCES MMML.BOARD_POST(post_id) ON DELETE CASCADE,
                                    FOREIGN KEY (writer_id) REFERENCES MMML.MEMBER(member_id),
                                    FOREIGN KEY (parent_comment_id) REFERENCES MMML.BOARD_COMMENT(comment_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === BOARD_LIKE (좋아요) ===
CREATE TABLE MMML.BOARD_LIKE (
                                 board_like_id   BIGINT NOT NULL AUTO_INCREMENT,
                                 post_id         BIGINT NOT NULL,
                                 member_id       VARCHAR(50) NOT NULL,

                                 PRIMARY KEY (board_like_id),
                                 FOREIGN KEY (post_id) REFERENCES MMML.BOARD_POST(post_id) ON DELETE CASCADE,
                                 FOREIGN KEY (member_id) REFERENCES MMML.MEMBER(member_id) ON DELETE CASCADE,
                                 UNIQUE KEY UQ_BOARD_LIKE (post_id, member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === SELLER (핫딜 판매자) ===
CREATE TABLE MMML.SELLER (
                             seller_id       BIGINT NOT NULL AUTO_INCREMENT,
                             biz_no          VARCHAR(30) NOT NULL,
                             member_id       VARCHAR(50) NOT NULL,
                             biz_type        VARCHAR(30),
                             created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                             updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                             PRIMARY KEY (seller_id),
                             UNIQUE KEY UQ_SELLER_BIZ_NO (biz_no),
                             FOREIGN KEY (member_id) REFERENCES MMML.MEMBER(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === ITEM (판매 상품 - 핫딜 메인) ===
CREATE TABLE MMML.ITEM (
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
                           FOREIGN KEY (seller_id) REFERENCES MMML.SELLER(seller_id),
                           FOREIGN KEY (category_id) REFERENCES MMML.CATEGORY(category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === HOTDEAL_OPTION (상품 옵션 및 재고) ===
CREATE TABLE MMML.HOTDEAL_OPTION (
                                     option_id        BIGINT NOT NULL AUTO_INCREMENT,
                                     item_id          BIGINT NOT NULL,
                                     option_type      VARCHAR(100) NOT NULL,
                                     option_value     VARCHAR(100) NOT NULL,
                                     additional_price DECIMAL(15,2) DEFAULT 0,
                                     stock            INT NOT NULL,

                                     PRIMARY KEY (option_id),
                                     FOREIGN KEY (item_id) REFERENCES MMML.ITEM(item_id) ON DELETE CASCADE,
                                     UNIQUE KEY UQ_OPTION_PER_ITEM (item_id, option_type, option_value)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === ITEM_DETAIL_IMAGE (상품 상세 이미지) ===
CREATE TABLE MMML.ITEM_DETAIL_IMAGE (
                                        detail_image_id BIGINT NOT NULL AUTO_INCREMENT,
                                        item_id         BIGINT NOT NULL,
                                        image_url       VARCHAR(500) NOT NULL,
                                        display_order   INT NOT NULL,

                                        PRIMARY KEY (detail_image_id),
                                        FOREIGN KEY (item_id) REFERENCES MMML.ITEM(item_id) ON DELETE CASCADE,
                                        UNIQUE KEY UQ_DETAIL_IMAGE_ORDER (item_id, display_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === ITEM_WISH (상품 찜하기) ===
CREATE TABLE MMML.ITEM_WISH (
                                wish_id         BIGINT NOT NULL AUTO_INCREMENT,
                                item_id         BIGINT NOT NULL,
                                member_id       VARCHAR(50) NOT NULL,
                                created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,

                                PRIMARY KEY (wish_id),
                                FOREIGN KEY (item_id) REFERENCES MMML.ITEM(item_id) ON DELETE CASCADE,
                                FOREIGN KEY (member_id) REFERENCES MMML.MEMBER(member_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === ORDER_MAIN (주문 메인) ===
CREATE TABLE MMML.ORDER_MAIN (
                                 order_id        BIGINT NOT NULL AUTO_INCREMENT,
                                 buyer_id        VARCHAR(50) NOT NULL,
                                 total_amount    DECIMAL(15,2) NOT NULL,
                                 order_status    VARCHAR(20) NOT NULL,
                                 merchant_uid    VARCHAR(100) NOT NULL, -- 추가: 상점 주문 고유 번호
                                 created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                                 updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                                 PRIMARY KEY (order_id),
                                 FOREIGN KEY (buyer_id) REFERENCES MMML.MEMBER(member_id),
                                 UNIQUE KEY UQ_MERCHANT_UID (merchant_uid) -- MERCHANT_UID는 주문당 고유해야 함
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === PAYMENT_TRANSACTION (결제 거래 기록) ===
CREATE TABLE MMML.PAYMENT_TRANSACTION (
                                          txn_id          BIGINT NOT NULL AUTO_INCREMENT,
                                          order_id        BIGINT NOT NULL,
                                          member_id       VARCHAR(50) NOT NULL,
                                          pg_tid          VARCHAR(100), -- PG사 거래 번호 (토스, 이니시스 등 자체 번호)
                                          imp_uid         VARCHAR(100), -- 추가: 포트원(IMP) 거래 고유 번호
                                          amount          DECIMAL(15,2) NOT NULL,
                                          txn_status      VARCHAR(20) NOT NULL,
                                          pay_method      VARCHAR(20),
                                          request_time    DATETIME DEFAULT CURRENT_TIMESTAMP,
                                          response_time   DATETIME,
                                          raw_data        TEXT,

                                          PRIMARY KEY (txn_id),
                                          FOREIGN KEY (order_id) REFERENCES MMML.ORDER_MAIN(order_id),
                                          FOREIGN KEY (member_id) REFERENCES MMML.MEMBER(member_id),
                                          UNIQUE KEY UQ_PG_TID (pg_tid),
                                          UNIQUE KEY UQ_IMP_UID (imp_uid) -- IMP_UID는 포트원 거래당 고유해야 함
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === ORDER_ITEM (주문 상품 목록) ===
CREATE TABLE MMML.ORDER_ITEM (
                                 order_item_id   BIGINT NOT NULL AUTO_INCREMENT,
                                 order_id        BIGINT NOT NULL,
                                 item_id         BIGINT NOT NULL,
                                 option_id       BIGINT,
                                 qty             INT NOT NULL,
                                 price           DECIMAL(15,2) NOT NULL,

                                 PRIMARY KEY (order_item_id),
                                 FOREIGN KEY (order_id) REFERENCES MMML.ORDER_MAIN(order_id) ON DELETE CASCADE,
                                 FOREIGN KEY (item_id) REFERENCES MMML.ITEM(item_id),
                                 FOREIGN KEY (option_id) REFERENCES MMML.HOTDEAL_OPTION(option_id),
                                 UNIQUE KEY UQ_ORDER_ITEM (order_id, item_id, option_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- === SHIPMENT (배송 정보) ===
CREATE TABLE MMML.SHIPMENT (
                               shipment_id     BIGINT NOT NULL AUTO_INCREMENT,
                               order_id        BIGINT NOT NULL,
                               tracking_no     VARCHAR(30),
                               carrier         VARCHAR(30),
                               shipment_status VARCHAR(20),
                               created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
                               updated_at      DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,

                               PRIMARY KEY (shipment_id),
                               FOREIGN KEY (order_id) REFERENCES MMML.ORDER_MAIN(order_id),
                               UNIQUE KEY UQ_TRACKING_NO (tracking_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 외래 키 체크 다시 활성화
SET FOREIGN_KEY_CHECKS = 1;

