-- =============================
--  DUMMY DATA: smaccount.SELLER
--  총 10개의 판매자 데이터를 삽입합니다.
--  (MEMBER 테이블의 role='SELLER'인 U006 ~ U015 회원 참조)
-- =============================

-- 판매자 회원 ID: U006 ~ U015

-- 1. 황금손 (U006)
INSERT INTO smaccount.SELLER (seller_id, biz_no, member_id, biz_type)
VALUES (smaccount.SEQ_SELLER.NEXTVAL, '123-01-00006', 'U006', '개인사업자_식품');

-- 2. 장바구니 (U007)
INSERT INTO smaccount.SELLER (seller_id, biz_no, member_id, biz_type)
VALUES (smaccount.SEQ_SELLER.NEXTVAL, '123-02-00007', 'U007', '법인사업자_의류');

-- 3. 보따리 (U008)
INSERT INTO smaccount.SELLER (seller_id, biz_no, member_id, biz_type)
VALUES (smaccount.SEQ_SELLER.NEXTVAL, '123-03-00008', 'U008', '개인사업자_잡화');

-- 4. 꿀단지 (U009)
INSERT INTO smaccount.SELLER (seller_id, biz_no, member_id, biz_type)
VALUES (smaccount.SEQ_SELLER.NEXTVAL, '123-04-00009', 'U009', '법인사업자_가전');

-- 5. 대박점 (U010)
INSERT INTO smaccount.SELLER (seller_id, biz_no, member_id, biz_type)
VALUES (smaccount.SEQ_SELLER.NEXTVAL, '123-05-00010', 'U010', '개인사업자_서비스');

-- 6. 득템요정 (U011)
INSERT INTO smaccount.SELLER (seller_id, biz_no, member_id, biz_type)
VALUES (smaccount.SEQ_SELLER.NEXTVAL, '123-06-00011', 'U011', '개인사업자_식품');

-- 7. 현금부자 (U012)
INSERT INTO smaccount.SELLER (seller_id, biz_no, member_id, biz_type)
VALUES (smaccount.SEQ_SELLER.NEXTVAL, '123-07-00012', 'U012', '법인사업자_의류');

-- 8. 미소상점 (U013)
INSERT INTO smaccount.SELLER (seller_id, biz_no, member_id, biz_type)
VALUES (smaccount.SEQ_SELLER.NEXTVAL, '123-08-00013', 'U013', '개인사업자_잡화');

-- 9. 새벽시장 (U014)
INSERT INTO smaccount.SELLER (seller_id, biz_no, member_id, biz_type)
VALUES (smaccount.SEQ_SELLER.NEXTVAL, '123-09-00014', 'U014', '법인사업자_가전');

-- 10. 완판녀 (U015)
INSERT INTO smaccount.SELLER (seller_id, biz_no, member_id, biz_type)
VALUES (smaccount.SEQ_SELLER.NEXTVAL, '123-10-00015', 'U015', '개인사업자_서비스');