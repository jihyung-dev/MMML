-- =============================
--  DUMMY DATA: smaccount.SUB_CATEGORY (소분류)
-- =============================

-- C01: 식비 (Food)
-- INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0101', '외식', 'C01');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0102', '식재료/장보기', 'C01');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0103', '간식/커피', 'C01');

-- C02: 교통/차량 (Traffic/Vehicle)
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0201', '대중교통', 'C02');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0202', '택시/주차', 'C02');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0203', '주유/차량관리', 'C02');

-- C03: 생활/가정 (Living/Household)
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0301', '공과금/통신', 'C03');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0302', '생활용품', 'C03');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0303', '가구/인테리어', 'C03');

-- C08: 급여 (Income - Salary)
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0801', '정기급여', 'C08');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0802', '부수입', 'C08');

-- C10: 패션/의류 (HotDeal - Fashion)
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC1001', '남성의류', 'C10');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC1002', '여성의류', 'C10');

-- C11: 가전/디지털 (HotDeal - Electronics)
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC1101', 'TV/영상가전', 'C11');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC1102', '컴퓨터/노트북', 'C11');