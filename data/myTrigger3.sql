-- ================================================================
--  SM Account Project: Trigger & History Table Definitions
--  AUTHOR: 최종 개발지침 v6.3 적용 (개인정보 보호를 위해 HISTORY에서 실명 제거)
-- ================================================================

-- ================================================================
-- [전략 1] 날짜 자동 갱신 트리거 모음 (Updated_At Auto Update)
-- 설명: 각 테이블의 레코드가 변경(UPDATE)될 때마다 updated_at 컬럼을
--       현재 시간(SYSTIMESTAMP)으로 자동 갱신합니다.
-- ================================================================

-- 1. MEMBER 테이블 트리거
CREATE OR REPLACE TRIGGER TRG_MEMBER_UPDATED_AT
    BEFORE UPDATE ON smaccount.MEMBER
    FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
END;
/

-- 2. BUDGET_GROUP 테이블 트리거
CREATE OR REPLACE TRIGGER TRG_GROUP_UPDATED_AT
    BEFORE UPDATE ON smaccount.BUDGET_GROUP
    FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
END;
/

-- 3. GROUP_MEMBER 테이블 트리거
CREATE OR REPLACE TRIGGER TRG_GROUP_MEMBER_UPDATED_AT
    BEFORE UPDATE ON smaccount.GROUP_MEMBER
    FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
END;
/

-- 4. LEDGER_ENTRY 테이블 트리거
CREATE OR REPLACE TRIGGER TRG_LEDGER_UPDATED_AT
    BEFORE UPDATE ON smaccount.LEDGER_ENTRY
    FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
END;
/

-- 5. BOARD_POST 테이블 트리거
CREATE OR REPLACE TRIGGER TRG_POST_UPDATED_AT
    BEFORE UPDATE ON smaccount.BOARD_POST
    FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
END;
/

-- 6. BOARD_COMMENT 테이블 트리거
CREATE OR REPLACE TRIGGER TRG_COMMENT_UPDATED_AT
    BEFORE UPDATE ON smaccount.BOARD_COMMENT
    FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
END;
/

-- 7. SELLER 테이블 트리거
CREATE OR REPLACE TRIGGER TRG_SELLER_UPDATED_AT
    BEFORE UPDATE ON smaccount.SELLER
    FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
END;
/

-- 8. ITEM 테이블 트리거
CREATE OR REPLACE TRIGGER TRG_ITEM_UPDATED_AT
    BEFORE UPDATE ON smaccount.ITEM
    FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
END;
/

-- 9. ORDER_MAIN 테이블 트리거
CREATE OR REPLACE TRIGGER TRG_ORDER_UPDATED_AT
    BEFORE UPDATE ON smaccount.ORDER_MAIN
    FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
END;
/

-- 10. SHIPMENT 테이블 트리거
CREATE OR REPLACE TRIGGER TRG_SHIPMENT_UPDATED_AT
    BEFORE UPDATE ON smaccount.SHIPMENT
    FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
END;
/


-- ================================================================
-- [전략 2] 데이터 백업(이력 관리)용 테이블 및 트리거
-- 설명: 중요 테이블(MEMBER, LEDGER_ENTRY, ORDER_MAIN)의 데이터가
--       수정/삭제되기 직전에 원본 데이터를 HISTORY 테이블에 저장합니다.
-- 수정: MEMBER_HISTORY에서 member_name(실명) 제거 (개인정보 보호)
-- ================================================================

-- 1. 이력 테이블 생성 (HISTORY Tables)

-- 1-1. MEMBER_HISTORY (이름 제거됨)
CREATE TABLE smaccount.MEMBER_HISTORY (
                                          history_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                          member_id       VARCHAR2(50),
                                          role            VARCHAR2(20),
    -- member_name 제거됨 (개인정보 보호)
                                          member_nickname VARCHAR2(50), -- 닉네임은 식별용으로 유지 (필요 시 제거 가능)
                                          action_type     VARCHAR2(10), -- 'UPDATE' 또는 'DELETE'
                                          action_date     TIMESTAMP DEFAULT SYSTIMESTAMP, -- 변경된 시점
                                          original_updated_at TIMESTAMP -- 원본 데이터의 마지막 수정일
);

-- 1-2. LEDGER_ENTRY_HISTORY
CREATE TABLE smaccount.LEDGER_ENTRY_HISTORY (
                                                history_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                                entry_id        NUMBER,
                                                group_id        NUMBER,
                                                member_id       VARCHAR2(50),
                                                entry_amount    NUMBER(15,2),
                                                occurred_at     DATE,
                                                place_of_use    VARCHAR2(200),
                                                action_type     VARCHAR2(10),
                                                action_date     TIMESTAMP DEFAULT SYSTIMESTAMP,
                                                original_updated_at TIMESTAMP
);

-- 1-3. ORDER_MAIN_HISTORY
CREATE TABLE smaccount.ORDER_MAIN_HISTORY (
                                              history_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                              order_id        NUMBER,
                                              buyer_id        VARCHAR2(50),
                                              total_amount    NUMBER(15,2),
                                              order_status    VARCHAR2(20),
                                              action_type     VARCHAR2(10),
                                              action_date     TIMESTAMP DEFAULT SYSTIMESTAMP,
                                              original_updated_at TIMESTAMP
);


-- 2. 백업 트리거 생성 (Backup Triggers)

-- 2-1. TRG_MEMBER_BACKUP (이름 저장 로직 제거)
CREATE OR REPLACE TRIGGER TRG_MEMBER_BACKUP
    BEFORE UPDATE OR DELETE ON smaccount.MEMBER
    FOR EACH ROW
BEGIN
    IF UPDATING THEN
        INSERT INTO smaccount.MEMBER_HISTORY (
            member_id, role, member_nickname, action_type, original_updated_at
        ) VALUES (
                     :OLD.member_id, :OLD.role, :OLD.member_nickname, 'UPDATE', :OLD.updated_at
                 );
    ELSIF DELETING THEN
        INSERT INTO smaccount.MEMBER_HISTORY (
            member_id, role, member_nickname, action_type, original_updated_at
        ) VALUES (
                     :OLD.member_id, :OLD.role, :OLD.member_nickname, 'DELETE', :OLD.updated_at
                 );
    END IF;
END;
/

-- 2-2. TRG_LEDGER_ENTRY_BACKUP
CREATE OR REPLACE TRIGGER TRG_LEDGER_ENTRY_BACKUP
    BEFORE UPDATE OR DELETE ON smaccount.LEDGER_ENTRY
    FOR EACH ROW
BEGIN
    IF UPDATING THEN
        INSERT INTO smaccount.LEDGER_ENTRY_HISTORY (
            entry_id, group_id, member_id, entry_amount, occurred_at, place_of_use, action_type, original_updated_at
        ) VALUES (
                     :OLD.entry_id, :OLD.group_id, :OLD.member_id, :OLD.entry_amount, :OLD.occurred_at, :OLD.place_of_use, 'UPDATE', :OLD.updated_at
                 );
    ELSIF DELETING THEN
        INSERT INTO smaccount.LEDGER_ENTRY_HISTORY (
            entry_id, group_id, member_id, entry_amount, occurred_at, place_of_use, action_type, original_updated_at
        ) VALUES (
                     :OLD.entry_id, :OLD.group_id, :OLD.member_id, :OLD.entry_amount, :OLD.occurred_at, :OLD.place_of_use, 'DELETE', :OLD.updated_at
                 );
    END IF;
END;
/

-- 2-3. TRG_ORDER_MAIN_BACKUP
CREATE OR REPLACE TRIGGER TRG_ORDER_MAIN_BACKUP
    BEFORE UPDATE OR DELETE ON smaccount.ORDER_MAIN
    FOR EACH ROW
BEGIN
    IF UPDATING THEN
        INSERT INTO smaccount.ORDER_MAIN_HISTORY (
            order_id, buyer_id, total_amount, order_status, action_type, original_updated_at
        ) VALUES (
                     :OLD.order_id, :OLD.buyer_id, :OLD.total_amount, :OLD.order_status, 'UPDATE', :OLD.updated_at
                 );
    ELSIF DELETING THEN
        INSERT INTO smaccount.ORDER_MAIN_HISTORY (
            order_id, buyer_id, total_amount, order_status, action_type, original_updated_at
        ) VALUES (
                     :OLD.order_id, :OLD.buyer_id, :OLD.total_amount, :OLD.order_status, 'DELETE', :OLD.updated_at
                 );
    END IF;
END;
/