-- =============================
--  DUMMY DATA: smaccount.BUDGET_GROUP
--  총 5개의 가계부 그룹 데이터를 삽입합니다.
-- =============================

-- 1. 가족 가계부 (소유자: U016 - 커피잔)
INSERT INTO smaccount.BUDGET_GROUP (group_id, group_name, owner_id)
VALUES (smaccount.SEQ_GROUP.NEXTVAL, '행복한 우리 가족 가계부', 'U016');

-- 2. 신혼부부 가계부 (소유자: U017 - 연필심)
INSERT INTO smaccount.BUDGET_GROUP (group_id, group_name, owner_id)
VALUES (smaccount.SEQ_GROUP.NEXTVAL, '연필심&그림자 신혼 지출', 'U017');

-- 3. 자취생 생활비 (소유자: U020 - 푸른숲)
INSERT INTO smaccount.BUDGET_GROUP (group_id, group_name, owner_id)
VALUES (smaccount.SEQ_GROUP.NEXTVAL, '푸른숲의 알뜰 자취 생활', 'U020');

-- 4. 직장 동료 점심 그룹 (소유자: U021 - 고양이발)
INSERT INTO smaccount.BUDGET_GROUP (group_id, group_name, owner_id)
VALUES (smaccount.SEQ_GROUP.NEXTVAL, '판교 직장인 공동 식비', 'U021');

-- 5. 비상금 관리 그룹 (소유자: U025 - 별똥별)
INSERT INTO smaccount.BUDGET_GROUP (group_id, group_name, owner_id)
VALUES (smaccount.SEQ_GROUP.NEXTVAL, '별똥별 비상금 및 저축', 'U025');