-- =============================
--  DUMMY DATA: smaccount.CATEGORY (대분류)
-- =============================

-- 가계부 지출/수입 카테고리
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C01', '식비');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C02', '교통/차량');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C03', '생활/가정');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C04', '경조사/선물');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C05', '문화/여가');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C06', '의료/건강');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C07', '교육/학습');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C08', '급여');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C09', '기타수입');

-- 핫딜 상품 카테고리 (가계부 카테고리와 일부 공유 가능)
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C10', '패션/의류');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C11', '가전/디지털');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C12', '스포츠/레저');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C13', '뷰티/화장품');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C14', '여행/숙박');