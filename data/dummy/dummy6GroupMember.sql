-- =============================
--  DUMMY DATA: smaccount.GROUP_MEMBER
--  그룹(GROUP_ID: 1~5)에 멤버를 연결합니다.
-- =============================

-- 그룹 1: 행복한 우리 가족 가계부 (U016 소유)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 1, 'U016', 'OWNER'); -- 김지훈 (커피잔)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 1, 'U018', 'MEMBER'); -- 박주원 (그림자)

-- 그룹 2: 연필심&그림자 신혼 지출 (U017 소유)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 2, 'U017', 'OWNER'); -- 이서현 (연필심)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 2, 'U019', 'MEMBER'); -- 최유진 (구름빵)

-- 그룹 3: 푸른숲의 알뜰 자취 생활 (U020 소유 - 1인 그룹)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 3, 'U020', 'OWNER'); -- 정승우 (푸른숲)

-- 그룹 4: 판교 직장인 공동 식비 (U021 소유)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 4, 'U021', 'OWNER');  -- 강하늘 (고양이발)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 4, 'U022', 'MEMBER'); -- 조민서 (달팽이)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 4, 'U023', 'MEMBER'); -- 윤수빈 (무지개)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 4, 'U024', 'MEMBER'); -- 임재현 (아침이슬)

-- 그룹 5: 별똥별 비상금 및 저축 (U025 소유)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 5, 'U025', 'OWNER'); -- 홍도현 (별똥별)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 5, 'U026', 'MEMBER'); -- 변지우 (시계탑)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 5, 'U030', 'MEMBER'); -- 문찬우 (토마토)