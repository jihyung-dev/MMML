-- =============================
--  DUMMY DATA: smaccount.ITEM (판매 상품)
--  총 20개의 상품 데이터를 삽입합니다.
--  참조: seller_biz_no (SELLER 테이블), category_id (C10~C14)
-- =============================

-- 황금손 (U006, 123-01-00006, C01 식비) -> C01은 가계부, C13 뷰티/화장품은 핫딜용으로 사용
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-01-00006', '프리미엄 한우 선물세트 (1kg)', 85000.00, 150, 'C01', DATE '2025-01-10', DATE '2025-02-10', 'ON_SALE');
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-01-00006', '유기농 제주 감귤 5kg 박스', 35000.00, 50, 'C01', DATE '2025-02-01', DATE '2025-02-28', 'ON_SALE');

-- 장바구니 (U007, 123-02-00007, C10 패션/의류)
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-02-00007', '남성 데일리 캐시미어 니트', 49900.00, 200, 'C10', DATE '2025-01-05', DATE '2025-01-31', 'ON_SALE');
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-02-00007', '여성 오버핏 롱 코트 (블랙)', 129000.00, 10, 'C10', DATE '2024-12-01', DATE '2024-12-30', 'SOLD_OUT'); -- 품절 상품

-- 보따리 (U008, 123-03-00008, C03 생활/가정)
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-03-00008', '차량용 공기청정기 (미니)', 25000.00, 30, 'C03', DATE '2025-01-01', DATE '2025-03-01', 'ON_SALE');

-- 꿀단지 (U009, 123-04-00009, C11 가전/디지털)
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-04-00009', '노트북 15인치 (i5/16GB)', 980000.00, 5, 'C11', DATE '2025-01-20', DATE '2025-02-20', 'ON_SALE');
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-04-00009', '무선 게이밍 마우스', 45000.00, 100, 'C11', DATE '2025-01-01', DATE '2025-02-01', 'ON_SALE');

-- 대박점 (U010, 123-05-00010, C12 스포츠/레저)
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-05-00010', '홈트용 접이식 요가 매트', 15000.00, 80, 'C12', DATE '2025-01-01', DATE '2025-02-15', 'ON_SALE');

-- 득템요정 (U011, 123-06-00011, C01 식비)
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-06-00011', '갓 튀긴 치킨 밀키트 (2인분)', 18900.00, 50, 'C01', DATE '2025-01-05', DATE '2025-01-15', 'ON_SALE');
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-06-00011', '캠핑용 모듬 소시지 세트', 29000.00, 10, 'C01', DATE '2025-01-01', DATE '2025-01-10', 'PAUSED'); -- 일시 중지 상품

-- 현금부자 (U012, 123-07-00012, C10 패션/의류)
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-07-00012', '브랜드 경량 다운 베스트', 79000.00, 40, 'C10', DATE '2025-01-01', DATE '2025-01-20', 'ON_SALE');
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-07-00012', '수제 가죽 벨트 (브라운)', 55000.00, 60, 'C10', DATE '2025-01-05', DATE '2025-02-05', 'ON_SALE');

-- 미소상점 (U013, 123-08-00013, C13 뷰티/화장품)
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-08-00013', '기능성 수분 크림 (50ml)', 22000.00, 120, 'C13', DATE '2025-01-01', DATE '2025-01-25', 'ON_SALE');

-- 새벽시장 (U014, 123-09-00014, C11 가전/디지털)
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-09-00014', '스마트 워치 S1 (블랙)', 199000.00, 20, 'C11', DATE '2025-01-15', DATE '2025-02-15', 'ON_SALE');
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-09-00014', '블루투스 스피커 (대형)', 89000.00, 0, 'C11', DATE '2024-12-01', DATE '2025-01-01', 'SOLD_OUT'); -- 품절 상품

-- 완판녀 (U015, 123-10-00015, C12 스포츠/레저)
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-10-00015', '헬스장갑 & 손목 보호대 세트', 29000.00, 50, 'C12', DATE '2025-01-01', DATE '2025-01-31', 'ON_SALE');
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-10-00015', '고급 등산 스틱 (카본)', 45000.00, 20, 'C12', DATE '2025-01-05', DATE '2025-02-05', 'ON_SALE');

-- 추가 상품 (C13, C14)
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-08-00013', '콜라겐 마스크팩 10매 세트', 19000.00, 200, 'C13', DATE '2025-01-01', DATE '2025-02-10', 'ON_SALE');
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-05-00010', '바다 뷰 펜션 2박 주말 숙박권', 250000.00, 5, 'C14', DATE '2025-01-01', DATE '2025-06-30', 'ON_SALE');
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-02-00007', '여성 겨울 니트 가디건 (M/L)', 59000.00, 70, 'C10', DATE '2025-01-01', DATE '2025-01-31', 'ON_SALE');
INSERT INTO smaccount.ITEM (item_id, seller_biz_no, item_name, item_price, item_stock, category_id, sale_start_at, sale_end_at, sale_status)
VALUES (smaccount.SEQ_ITEM.NEXTVAL, '123-04-00009', '무선 충전 패드 (고속)', 29000.00, 40, 'C11', DATE '2025-01-01', DATE '2025-03-01', 'ON_SALE');