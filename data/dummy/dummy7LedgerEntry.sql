-- =============================
--  DUMMY DATA: smaccount.LEDGER_ENTRY - Part 1/3 (Entry ID 1 ~ 100)
-- =============================

-- 그룹 1: 행복한 우리 가족 가계부 (U016, U018) - 10월 지출 (1-30)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 58000.00, DATE '2024-10-01', '대형마트', '주간 식재료 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C03', 150000.00, DATE '2024-10-02', '지역 마트', '생필품 및 주방용품');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CASH', NULL, 'C03', 85000.00, DATE '2024-10-05', '전기/가스공사', '공과금 납부');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 75000.00, DATE '2024-10-07', '주유소A', '차량 주유비');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C05', 40000.00, DATE '2024-10-10', '지역 영화관', '주말 가족 영화 관람');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 35000.00, DATE '2024-10-12', '파스타 전문점', '외식');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CASH', NULL, 'C01', 12000.00, DATE '2024-10-15', '재래시장', '채소 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C07', 200000.00, DATE '2024-10-18', '학원', '자녀 학습비');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C06', 150000.00, DATE '2024-10-21', '병원', '가족 건강 검진');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CASH', NULL, 'C03', 45000.00, DATE '2024-10-25', '다이소', '생활용품');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 100000.00, DATE '2024-10-28', '선물가게', '친구 생일 선물');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C02', 30000.00, DATE '2024-10-30', '주차장', '월말 주차비');
-- 11월 지출 (14-30)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 62000.00, DATE '2024-11-01', '대형마트', '주간 식재료 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C03', 95000.00, DATE '2024-11-03', '통신사', '인터넷/TV 요금');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CASH', NULL, 'C01', 25000.00, DATE '2024-11-06', '배달앱', '야식 주문');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 30000.00, DATE '2024-11-10', '온라인 서점', '도서 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C05', 70000.00, DATE '2024-11-15', '놀이공원', '가족 나들이');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 40000.00, DATE '2024-11-18', '중국집', '외식');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CASH', NULL, 'C06', 25000.00, DATE '2024-11-20', '약국', '상비약 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C03', 11000.00, DATE '2024-11-23', '세탁소', '겨울 외투 세탁');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 30000.00, DATE '2024-11-25', '꽃집', '기념일 꽃다발');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CASH', NULL, 'C02', 8000.00, DATE '2024-11-28', '버스', '대중교통');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C07', 50000.00, DATE '2024-11-30', '문화센터', '취미 강좌 등록');


-- 그룹 2: 연필심&그림자 신혼 지출 (U017, U019) - 10월 지출 (31-60)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 500000.00, DATE '2024-10-01', '이케아', '거실 가구 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C01', 75000.00, DATE '2024-10-03', '고급 스테이크집', '결혼 기념일 저녁');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CASH', NULL, 'C05', 80000.00, DATE '2024-10-06', '호텔 뷔페', '주말 데이트');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 12000.00, DATE '2024-10-08', '스타벅스', '아침 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C01', 20000.00, DATE '2024-10-10', '온라인 식료품몰', '빵, 우유 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 50000.00, DATE '2024-10-12', '미술관', '전시회 관람');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C03', 25000.00, DATE '2024-10-15', '온라인 쇼핑몰', '디퓨저 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 50000.00, DATE '2024-10-20', '백화점', '부모님 용돈');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CASH', NULL, 'C01', 45000.00, DATE '2024-10-25', '일식집', '퇴근 후 저녁');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C02', 20000.00, DATE '2024-10-28', '카카오T', '늦은 귀가 택시비');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 30000.00, DATE '2024-10-29', '마트', '세제, 휴지 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CASH', NULL, 'C01', 15000.00, DATE '2024-10-30', '빵집', '아침 식사용 빵');

-- 그룹 2: 연필심&그림자 신혼 지출 (U017, U019) - 11월 지출 (43-60)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 350000.00, DATE '2024-11-05', '가구점', '침실 조명 및 매트리스');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C01', 60000.00, DATE '2024-11-07', '브런치 카페', '주말 브런치');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CASH', NULL, 'C05', 120000.00, DATE '2024-11-12', '콘서트장', '뮤지컬 관람');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CREDIT', 'C06', 45000.00, DATE '2024-11-16', '피트니스 센터', '헬스장 일일권');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C01', 28000.00, DATE '2024-11-20', '수제버거집', '점심 식사');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 15000.00, DATE '2024-11-23', '마트', '세제 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CASH', NULL, 'C04', 80000.00, DATE '2024-11-25', '온라인 쇼핑', '조카 돌 선물');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C02', 15000.00, DATE '2024-11-28', '주유소B', '소량 주유');


-- 그룹 3: 푸른숲의 알뜰 자취 생활 (U020) - 10월 지출 (61-80)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C03', 45000.00, DATE '2024-10-02', 'CU 편의점', '자취방 간식 및 물');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-04', '학교 앞 카페', '아메리카노');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CASH', NULL, 'C02', 1250.00, DATE '2024-10-05', '지하철역', '교통카드 충전');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C07', 10000.00, DATE '2024-10-10', '도서관', '스터디룸 대여료');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 9900.00, DATE '2024-10-15', '김밥천국', '혼밥');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C03', 7000.00, DATE '2024-10-18', '다이소', '청소용품');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CASH', NULL, 'C01', 20000.00, DATE '2024-10-22', '학교 식당', '주간 식권 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 25000.00, DATE '2024-10-27', '넷플릭스', '월간 구독료');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3000.00, DATE '2024-10-28', '택시', '늦은 시간 귀가');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CASH', NULL, 'C01', 5000.00, DATE '2024-10-30', '편의점', '컵라면');

-- 그룹 3: 푸른숲의 알뜰 자취 생활 (U020) - 11월 지출 (81-100)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C03', 15000.00, DATE '2024-11-01', 'GS25 편의점', '식수 및 라면');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4500.00, DATE '2024-11-03', '테이크아웃 전문점', '점심 샌드위치');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CASH', NULL, 'C02', 3000.00, DATE '2024-11-06', '버스', '통학 버스비');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C07', 30000.00, DATE '2024-11-10', '인강 사이트', '영어 인강 결제');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 7900.00, DATE '2024-11-15', '라면 전문점', '저녁 식사');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C06', 15000.00, DATE '2024-11-18', '약국', '감기약');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CASH', NULL, 'C03', 10000.00, DATE '2024-11-22', '문구점', '노트 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 18000.00, DATE '2024-11-27', 'PC방', '게임 이용료');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12000.00, DATE '2024-11-29', '배달앱', '치킨 1마리');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CASH', NULL, 'C03', 5000.00, DATE '2024-11-30', '세탁소', '와이셔츠 세탁');

-- =============================
--  DUMMY DATA: smaccount.LEDGER_ENTRY - Part 2/3 (Entry ID 101 ~ 200)
-- =============================

-- 그룹 4: 판교 직장인 공동 식비 (U021, U022, U023, U024) - 10월 지출 (101-140)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 45000.00, DATE '2024-10-01', '점심 한식집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-01', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 52000.00, DATE '2024-10-02', '이탈리안 레스토랑', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-02', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 38000.00, DATE '2024-10-04', '감자탕집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4200.00, DATE '2024-10-04', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 49000.00, DATE '2024-10-07', '퓨전 일식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3800.00, DATE '2024-10-07', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 41000.00, DATE '2024-10-08', '샐러드 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-08', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 50000.00, DATE '2024-10-09', '파스타 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-09', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 39000.00, DATE '2024-10-10', '돈까스집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-10', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 44000.00, DATE '2024-10-11', '퓨전 중식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4200.00, DATE '2024-10-11', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 46000.00, DATE '2024-10-14', '멕시코 음식점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3000.00, DATE '2024-10-14', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 37000.00, DATE '2024-10-15', '분식집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4500.00, DATE '2024-10-15', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 42000.00, DATE '2024-10-16', '백반집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-16', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 55000.00, DATE '2024-10-17', '초밥 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-17', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-10-18', '중국집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-18', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 38000.00, DATE '2024-10-21', '베트남 식당', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-21', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 43000.00, DATE '2024-10-22', '이탈리안 레스토랑', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-22', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 50000.00, DATE '2024-10-23', '퓨전 일식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-23', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-10-24', '국밥집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-24', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 45000.00, DATE '2024-10-25', '버거 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-25', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-10-28', '중국집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-28', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 38000.00, DATE '2024-10-29', '베트남 식당', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-29', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 45000.00, DATE '2024-10-30', '점심 한식집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-30', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 52000.00, DATE '2024-10-31', '이탈리안 레스토랑', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-31', '프렌차이즈 커피', '팀원 커피');

-- 그룹 4: 판교 직장인 공동 식비 (U021, U022, U023, U024) - 11월 지출 (141-170)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 42000.00, DATE '2024-11-01', '점심 부대찌개', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3000.00, DATE '2024-11-01', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 48000.00, DATE '2024-11-04', '피자집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4500.00, DATE '2024-11-04', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 39000.00, DATE '2024-11-05', '한정식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-05', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 46000.00, DATE '2024-11-06', '파스타 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-11-06', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 44000.00, DATE '2024-11-07', '샐러드 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-07', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 51000.00, DATE '2024-11-08', '퓨전 중식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4200.00, DATE '2024-11-08', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 43000.00, DATE '2024-11-11', '베트남 음식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3000.00, DATE '2024-11-11', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 37000.00, DATE '2024-11-12', '분식집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4500.00, DATE '2024-11-12', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 42000.00, DATE '2024-11-13', '백반집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-13', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 55000.00, DATE '2024-11-14', '초밥 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-11-14', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-11-15', '중국집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-15', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 38000.00, DATE '2024-11-18', '베트남 식당', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-11-18', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 43000.00, DATE '2024-11-19', '이탈리안 레스토랑', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-19', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 50000.00, DATE '2024-11-20', '퓨전 일식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-11-20', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-11-21', '국밥집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-21', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 45000.00, DATE '2024-11-22', '버거 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-11-22', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-11-25', '중국집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-25', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 37000.00, DATE '2024-11-26', '분식집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4500.00, DATE '2024-11-26', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 42000.00, DATE '2024-11-27', '점심 부대찌개', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3000.00, DATE '2024-11-27', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 55000.00, DATE '2024-11-28', '고기집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4500.00, DATE '2024-11-28', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 48000.00, DATE '2024-11-29', '피자집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-11-29', '회사 앞 카페', '팀원 커피');

-- 그룹 5: 별똥별 비상금 및 저축 (U025, U026, U030) - 10월 내역 (171-185)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U025', 'INCOME', 'CASH', NULL, 'C08', 3500000.00, DATE '2024-10-25', '회사', '정기 급여 입금', 'OPEN_FIN');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C05', 1000000.00, DATE '2024-10-26', '비상금 계좌', '비상금 이체 (지출로 처리)');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U026', 'EXPENSE', 'CASH', NULL, 'C07', 50000.00, DATE '2024-10-28', '온라인 투자', '소액 주식 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U030', 'INCOME', 'CASH', NULL, 'C09', 200000.00, DATE '2024-10-30', '당근마켓', '중고 물품 판매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C04', 30000.00, DATE '2024-10-31', '은행', '대출 이자 납부');

-- 그룹 5: 별똥별 비상금 및 저축 (U025, U026, U030) - 11월 내역 (186-200)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U026', 'INCOME', 'CASH', NULL, 'C08', 2800000.00, DATE '2024-11-25', '회사', '정기 급여 입금', 'OPEN_FIN');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C05', 700000.00, DATE '2024-11-26', '정기적금', '월간 적금 납입 (지출로 처리)');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U030', 'EXPENSE', 'CASH', NULL, 'C07', 20000.00, DATE '2024-11-28', '펀드 매니저', '소액 펀드 추가 납입');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U025', 'INCOME', 'CASH', NULL, 'C09', 50000.00, DATE '2024-11-30', '친구', '빌려준 돈 상환');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U026', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 10000.00, DATE '2024-11-30', '기부단체', '정기 기부금');
-- 그룹 4의 나머지 지출 (200개까지 채우기)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-05', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-11-06', '샐러드 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-06', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 50000.00, DATE '2024-11-07', '파스타 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-11-07', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 45000.00, DATE '2024-11-08', '퓨전 중식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-08', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 41000.00, DATE '2024-11-11', '베트남 음식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3800.00, DATE '2024-11-11', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 39000.00, DATE '2024-11-12', '분식집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4500.00, DATE '2024-11-12', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 42000.00, DATE '2024-11-13', '백반집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-13', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 55000.00, DATE '2024-11-14', '초밥 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-11-14', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-11-15', '중국집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-15', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 43000.00, DATE '2024-11-18', '이탈리안 레스토랑', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-18', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 50000.00, DATE '2024-11-19', '퓨전 일식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-11-19', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-11-20', '국밥집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-20', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 45000.00, DATE '2024-11-21', '버거 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-11-21', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-11-22', '중국집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-22', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 37000.00, DATE '2024-11-25', '분식집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4500.00, DATE '2024-11-25', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 42000.00, DATE '2024-11-26', '점심 부대찌개', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3000.00, DATE '2024-11-26', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 55000.00, DATE '2024-11-27', '고기집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4500.00, DATE '2024-11-27', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 48000.00, DATE '2024-11-28', '피자집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-11-28', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 45000.00, DATE '2024-11-29', '점심 한식집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-11-29', '프렌차이즈 커피', '팀원 커피');

-- 그룹 4의 나머지 지출 (191-200)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 52000.00, DATE '2024-10-03', '이탈리안 레스토랑', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-03', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 45000.00, DATE '2024-10-04', '점심 한식집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-04', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 38000.00, DATE '2024-10-07', '감자탕집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4200.00, DATE '2024-10-07', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 49000.00, DATE '2024-10-08', '퓨전 일식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3800.00, DATE '2024-10-08', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 41000.00, DATE '2024-10-09', '샐러드 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-09', '프렌차이즈 커피', '팀원 커피');

-- =============================
--  DUMMY DATA: smaccount.LEDGER_ENTRY - Part 3/3 (Entry ID 201 ~ 300)
-- =============================

-- 그룹 1: 행복한 우리 가족 가계부 (U016, U018) - 10월/11월 나머지 지출 (201-220)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 5000.00, DATE '2024-10-03', '편의점', '간식');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C02', 15000.00, DATE '2024-10-06', '주차장', '주말 주차');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CASH', NULL, 'C03', 10000.00, DATE '2024-10-09', '세탁소', '의류 세탁');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 50000.00, DATE '2024-10-14', '온라인 학습', '교육 앱 구독');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C05', 10000.00, DATE '2024-10-19', '만화카페', '휴식');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C06', 80000.00, DATE '2024-10-23', '치과', '정기 검진');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CASH', NULL, 'C04', 20000.00, DATE '2024-10-26', '은행', 'ATM 수수료');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C01', 30000.00, DATE '2024-10-29', '마트', '추가 식료품');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 15000.00, DATE '2024-11-04', '하이패스', '고속도로 통행료');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C03', 15000.00, DATE '2024-11-08', '철물점', '집수리 용품');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CASH', NULL, 'C05', 5000.00, DATE '2024-11-13', 'DVD 대여', '영화 대여');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C06', 30000.00, DATE '2024-11-17', '피부과', '연고 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C07', 40000.00, DATE '2024-11-21', '미술 학원', '재료비');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U018', 'EXPENSE', 'CASH', NULL, 'C04', 10000.00, DATE '2024-11-24', '자판기', '음료수');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 18000.00, DATE '2024-11-29', '떡볶이집', '분식 외식');

-- 그룹 2: 연필심&그림자 신혼 지출 (U017, U019) - 10월/11월 나머지 지출 (221-240)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C03', 10000.00, DATE '2024-10-04', '다이소', '생활 소품');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C06', 15000.00, DATE '2024-10-09', '약국', '영양제 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CASH', NULL, 'C05', 10000.00, DATE '2024-10-11', '편의점', '복권 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C07', 20000.00, DATE '2024-10-16', '온라인 쇼핑몰', '취미 용품');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 35000.00, DATE '2024-10-21', '이탈리안 레스토랑', '저녁 외식');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CASH', NULL, 'C02', 12000.00, DATE '2024-10-26', '주유소', '소량 주유');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C03', 8000.00, DATE '2024-10-31', '인터넷 쇼핑', '청소 도구');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 40000.00, DATE '2024-11-01', '음악 스트리밍', '연간 구독료');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CASH', NULL, 'C06', 50000.00, DATE '2024-11-06', '마사지샵', '피로 회복');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C07', 30000.00, DATE '2024-11-11', '문화센터', '요가 클래스');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 20000.00, DATE '2024-11-17', '분식점', '주말 간식');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CASH', NULL, 'C02', 5000.00, DATE '2024-11-21', '대중교통', '지하철');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C03', 15000.00, DATE '2024-11-26', '마트', '세제 추가 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 100000.00, DATE '2024-11-29', '기념품 가게', '여행 선물 구매');

-- 그룹 3: 푸른숲의 알뜰 자취 생활 (U020) - 10월/11월 나머지 지출 (241-250)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C05', 5000.00, DATE '2024-10-01', 'PC방', '게임');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 8000.00, DATE '2024-10-06', '편의점', '세탁 세제');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CASH', NULL, 'C01', 15000.00, DATE '2024-10-09', '재래시장', '과일 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C06', 10000.00, DATE '2024-10-12', '약국', '밴드 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 5000.00, DATE '2024-10-17', '온라인 서점', '필기구');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CASH', NULL, 'C02', 1250.00, DATE '2024-10-20', '버스', '교통비');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7000.00, DATE '2024-11-04', '김밥집', '점심 식사');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 10000.00, DATE '2024-11-08', '온라인 쇼핑몰', '휴대폰 케이스');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CASH', NULL, 'C05', 5000.00, DATE '2024-11-14', '만화방', '만화책 대여');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 3, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C06', 20000.00, DATE '2024-11-25', '피트니스 센터', '일일 입장권');

-- 그룹 4: 판교 직장인 공동 식비 (U021, U022, U023, U024) - 10월/11월 나머지 지출 (251-280)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-10-10', '돈까스집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-10', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 44000.00, DATE '2024-10-11', '퓨전 중식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4200.00, DATE '2024-10-11', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 46000.00, DATE '2024-10-14', '멕시코 음식점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3000.00, DATE '2024-10-14', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 37000.00, DATE '2024-10-15', '분식집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4500.00, DATE '2024-10-15', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 42000.00, DATE '2024-10-16', '백반집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-16', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 55000.00, DATE '2024-10-17', '초밥 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-17', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-10-18', '중국집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-18', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 38000.00, DATE '2024-10-21', '베트남 식당', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-21', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 43000.00, DATE '2024-10-22', '이탈리안 레스토랑', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-22', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 50000.00, DATE '2024-10-23', '퓨전 일식', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-23', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-10-24', '국밥집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-24', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 45000.00, DATE '2024-10-25', '버거 전문점', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-25', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2024-10-28', '중국집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-28', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 38000.00, DATE '2024-10-29', '베트남 식당', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-29', '프렌차이즈 커피', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 45000.00, DATE '2024-10-30', '점심 한식집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, DATE '2024-10-30', '회사 앞 카페', '팀원 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 52000.00, DATE '2024-10-31', '이탈리안 레스토랑', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 4, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4000.00, DATE '2024-10-31', '프렌차이즈 커피', '팀원 커피');

-- 그룹 5: 별똥별 비상금 및 저축 (U025, U026, U030) - 10월/11월 나머지 내역 (281-300)
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C05', 500000.00, DATE '2024-10-10', '투자 계좌', '월별 투자금 이체');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U026', 'INCOME', 'CASH', NULL, 'C09', 150000.00, DATE '2024-10-15', '은행', '이자 수입');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U030', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 50000.00, DATE '2024-10-18', '기념일', '지인 결혼식 축의금');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U025', 'EXPENSE', 'CASH', NULL, 'C07', 10000.00, DATE '2024-10-22', '온라인 강좌', '단기 특강 결제');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C03', 20000.00, DATE '2024-10-27', '인터넷', '클라우드 서비스 구독');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U030', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 30000.00, DATE '2024-11-03', '여행사', '숙소 예약금');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U025', 'INCOME', 'CASH', NULL, 'C08', 3000000.00, DATE '2024-11-05', '프리랜서', '외주 작업 수익');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C05', 800000.00, DATE '2024-11-10', '펀드 계좌', '추가 펀드 매입 (지출로 처리)');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U030', 'EXPENSE', 'CASH', NULL, 'C07', 40000.00, DATE '2024-11-15', '도서관', '연체료 및 도서 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 15000.00, DATE '2024-11-17', '카페', '미팅 커피');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U026', 'INCOME', 'CASH', NULL, 'C09', 100000.00, DATE '2024-11-20', '친구', '공동 경비 정산');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 20000.00, DATE '2024-11-22', '주유소', '차량 정비');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U025', 'EXPENSE', 'CASH', NULL, 'C03', 5000.00, DATE '2024-11-24', '다이소', '잡화 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U026', 'EXPENSE', 'CARD', 'CREDIT', 'C06', 70000.00, DATE '2024-11-27', '병원', '독감 예방 접종');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C04', 30000.00, DATE '2024-11-30', '온라인 쇼핑', '연말 카드');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U025', 'INCOME', 'CASH', NULL, 'C09', 80000.00, DATE '2024-11-12', '용돈', '부모님 용돈');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12000.00, DATE '2024-11-13', 'CU 편의점', '식사대용');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U030', 'EXPENSE', 'CASH', NULL, 'C03', 5000.00, DATE '2024-11-16', '잡화점', '건전지 구매');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 25000.00, DATE '2024-11-19', '온라인 학습', 'IT 자격증 강의');
INSERT INTO smaccount.LEDGER_ENTRY (entry_id, group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (smaccount.SEQ_ENTRY.NEXTVAL, 5, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C05', 15000.00, DATE '2024-11-21', 'CGV', '영화 관람');