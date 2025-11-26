-- ============================================================
--  DUMMY DATA: smaccount.LEDGER_ENTRY (47개)
--  Oracle DML: TO_TIMESTAMP() 함수를 사용하여 날짜 및 시간 정확히 삽입
--  주의: MEMBER 및 CATEGORY 테이블 데이터가 먼저 존재해야 합니다.
-- ============================================================

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', 'CHECK', 'C11', 20490.00, TO_TIMESTAMP('2025-10-31 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), '라이나생명', '보험료 납부');
commit;

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 1200.00, TO_TIMESTAMP('2025-10-31 18:26:00', 'YYYY-MM-DD HH24:MI:SS'), '인천국제공항공사', '주차/통행료');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 5500.00, TO_TIMESTAMP('2025-10-31 17:53:00', 'YYYY-MM-DD HH24:MI:SS'), '가산디지털 주차장', '단기 주차비');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 10800.00, TO_TIMESTAMP('2025-10-31 13:38:00', 'YYYY-MM-DD HH24:MI:SS'), '미태리', '점심 식대');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 40500.00, TO_TIMESTAMP('2025-10-31 01:01:00', 'YYYY-MM-DD HH24:MI:SS'), '모바일티머니', '월 정산 교통비');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C05', 8300.00, TO_TIMESTAMP('2025-10-31 01:01:00', 'YYYY-MM-DD HH24:MI:SS'), '하이패스 충전', '고속도로 통행료');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 62100.00, TO_TIMESTAMP('2025-10-31 01:01:00', 'YYYY-MM-DD HH24:MI:SS'), '모바일티머니', '월 정산 버스비');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2400.00, TO_TIMESTAMP('2025-10-30 21:49:00', 'YYYY-MM-DD HH24:MI:SS'), '맥도날드', '저녁 간식');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 7100.00, TO_TIMESTAMP('2025-10-30 19:51:00', 'YYYY-MM-DD HH24:MI:SS'), 'GS25', '편의점 생필품');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 45000.00, TO_TIMESTAMP('2025-10-30 15:29:00', 'YYYY-MM-DD HH24:MI:SS'), '자동차 보험', '월 보험료 자동 결제');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 12260.00, TO_TIMESTAMP('2025-10-30 14:21:00', 'YYYY-MM-DD HH24:MI:SS'), '롯데손보', '보험 해약 환급금', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 15100.00, TO_TIMESTAMP('2025-10-30 13:18:00', 'YYYY-MM-DD HH24:MI:SS'), '차찬텡', '팀 점심 식대');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00, TO_TIMESTAMP('2025-10-30 09:14:00', 'YYYY-MM-DD HH24:MI:SS'), '토스', '지인에게 송금');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1500.00, TO_TIMESTAMP('2025-10-30 09:08:00', 'YYYY-MM-DD HH24:MI:SS'), '빽다방', '출근길 커피');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 10100.00, TO_TIMESTAMP('2025-10-29 22:02:00', 'YYYY-MM-DD HH24:MI:SS'), 'KFC', '저녁 치킨');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (6, 'U021', 'INCOME', 'TRANSFER', NULL, 'C11', 13500.00, TO_TIMESTAMP('2025-10-29 13:02:00', 'YYYY-MM-DD HH24:MI:SS'), '카카오페이', '점심 식대 정산', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (6, 'U021', 'INCOME', 'TRANSFER', NULL, 'C11', 8200.00, TO_TIMESTAMP('2025-10-29 13:02:00', 'YYYY-MM-DD HH24:MI:SS'), '카카오페이', '점심 식대 정산', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (6, 'U021', 'INCOME', 'TRANSFER', NULL, 'C11', 11500.00, TO_TIMESTAMP('2025-10-29 13:02:00', 'YYYY-MM-DD HH24:MI:SS'), '카카오페이', '점심 식대 정산', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 39600.00, TO_TIMESTAMP('2025-10-29 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), '고칸', '팀 점심');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 2000.00, TO_TIMESTAMP('2025-10-29 10:34:00', 'YYYY-MM-DD HH24:MI:SS'), '커피시즌', '아침 커피');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 2500.00, TO_TIMESTAMP('2025-10-29 10:34:00', 'YYYY-MM-DD HH24:MI:SS'), '스타벅스', '데이트 커피');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 4220.00, TO_TIMESTAMP('2025-10-28 20:35:00', 'YYYY-MM-DD HH24:MI:SS'), '세븐일레븐', '저녁 간식');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3300.00, TO_TIMESTAMP('2025-10-28 20:23:00', 'YYYY-MM-DD HH24:MI:SS'), '버거킹', '저녁 식사');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C03', 17910.00, TO_TIMESTAMP('2025-10-28 19:13:00', 'YYYY-MM-DD HH24:MI:SS'), '퀸잇', '온라인 의류 구매');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'INCOME', 'TRANSFER', NULL, 'C11', 20000.00, TO_TIMESTAMP('2025-10-28 19:13:00', 'YYYY-MM-DD HH24:MI:SS'), '네이버페이', '계좌 충전', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 20000.00, TO_TIMESTAMP('2025-10-28 19:13:00', 'YYYY-MM-DD HH24:MI:SS'), '신한은행', '네이버페이 충전', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 9600.00, TO_TIMESTAMP('2025-10-28 13:58:00', 'YYYY-MM-DD HH24:MI:SS'), '컴포즈커피', '팀원 커피');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00, TO_TIMESTAMP('2025-10-27 22:14:00', 'YYYY-MM-DD HH24:MI:SS'), '토스 박보검', '입금 (지인 정산)', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 14940.00, TO_TIMESTAMP('2025-10-27 22:05:00', 'YYYY-MM-DD HH24:MI:SS'), 'Steam', '게임 구매');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 16920.00, TO_TIMESTAMP('2025-10-27 20:45:00', 'YYYY-MM-DD HH24:MI:SS'), '홈플러스', '주간 생필품');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 15900.00, TO_TIMESTAMP('2025-10-27 20:31:00', 'YYYY-MM-DD HH24:MI:SS'), '땅스부대찌개', '저녁 식사');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 63610.00, TO_TIMESTAMP('2025-10-27 18:35:00', 'YYYY-MM-DD HH24:MI:SS'), '대출 은행', '주택 대출 이자', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3500.00, TO_TIMESTAMP('2025-10-27 14:27:00', 'YYYY-MM-DD HH24:MI:SS'), 'CU', '커피 및 간식');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 268600.00, TO_TIMESTAMP('2025-10-27 12:31:00', 'YYYY-MM-DD HH24:MI:SS'), '정부지원금', '국민취업지원 입금', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00, TO_TIMESTAMP('2025-10-27 12:21:00', 'YYYY-MM-DD HH24:MI:SS'), '배달의민족', '점심 배달비');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'TRANSFER', NULL, 'C03', 15000.00, TO_TIMESTAMP('2025-10-27 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'G마켓', '생활용품 구매');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 34830.00, TO_TIMESTAMP('2025-10-27 07:13:00', 'YYYY-MM-DD HH24:MI:SS'), '생명보험', '자동차 보험료', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C10', 5000.00, TO_TIMESTAMP('2025-10-27 01:01:00', 'YYYY-MM-DD HH24:MI:SS'), 'SKT', '휴대폰 소액 결제');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 31155.00, TO_TIMESTAMP('2025-10-26 23:26:00', 'YYYY-MM-DD HH24:MI:SS'), '네이버쇼핑', '의류 구매');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C03', 4524.00, TO_TIMESTAMP('2025-10-26 23:26:00', 'YYYY-MM-DD HH24:MI:SS'), '쿠팡', '화장품 구매');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'POINT', NULL, 'C03', 121.00, TO_TIMESTAMP('2025-10-26 23:26:00', 'YYYY-MM-DD HH24:MI:SS'), '네이버페이', '포인트 사용');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 62700.00, TO_TIMESTAMP('2025-10-26 18:45:00', 'YYYY-MM-DD HH24:MI:SS'), '초밥 전문점', '저녁 외식');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U019', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00, TO_TIMESTAMP('2025-10-25 20:12:00', 'YYYY-MM-DD HH24:MI:SS'), '김뚱땡', '스터디 회비 입금', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 1000.00, TO_TIMESTAMP('2025-10-25 05:22:00', 'YYYY-MM-DD HH24:MI:SS'), '은행', '통장 이자', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4000.00, TO_TIMESTAMP('2025-10-25 04:36:00', 'YYYY-MM-DD HH24:MI:SS'), '미니스톱', '야간 간식');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C01', 5300.00, TO_TIMESTAMP('2025-10-24 18:47:00', 'YYYY-MM-DD HH24:MI:SS'), 'KFC', '저녁 식사');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3000.00, TO_TIMESTAMP('2025-10-24 18:46:00', 'YYYY-MM-DD HH24:MI:SS'), '맥도날드', '간식');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 10000.00, TO_TIMESTAMP('2025-10-24 14:03:00', 'YYYY-MM-DD HH24:MI:SS'), '감자탕', '점심 식대');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C10', 7890.00, TO_TIMESTAMP('2025-10-24 10:17:00', 'YYYY-MM-DD HH24:MI:SS'), '쿠팡', '와우 멤버십');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4100.00, TO_TIMESTAMP('2025-10-24 09:24:00', 'YYYY-MM-DD HH24:MI:SS'), '메가커피', '커피');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C01', 1800.00, TO_TIMESTAMP('2025-10-23 22:04:00', 'YYYY-MM-DD HH24:MI:SS'), '맥도날드', '야식');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 13000.00, TO_TIMESTAMP('2025-10-23 19:05:00', 'YYYY-MM-DD HH24:MI:SS'), '배달의민족', '저녁 식사');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 57720.00, TO_TIMESTAMP('2025-10-23 18:26:00', 'YYYY-MM-DD HH24:MI:SS'), '학자금재단', '학자금 대출 상환', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7200.00, TO_TIMESTAMP('2025-10-23 12:36:00', 'YYYY-MM-DD HH24:MI:SS'), '배달의민족', '점심');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 48730.00, TO_TIMESTAMP('2025-10-23 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SKT', '휴대폰 요금', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00, TO_TIMESTAMP('2025-10-22 19:59:00', 'YYYY-MM-DD HH24:MI:SS'), '토스', '지인에게 송금');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3800.00, TO_TIMESTAMP('2025-10-22 19:53:00', 'YYYY-MM-DD HH24:MI:SS'), '컴포즈커피', '저녁 커피');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U012', 'EXPENSE', 'TRANSFER', NULL, 'C06', 22340.00, TO_TIMESTAMP('2025-10-22 15:33:00', 'YYYY-MM-DD HH24:MI:SS'), '온라인 약국', '건강보조제 구매');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1900.00, TO_TIMESTAMP('2025-10-22 13:54:00', 'YYYY-MM-DD HH24:MI:SS'), '메가커피', '점심 커피');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 10500.00, TO_TIMESTAMP('2025-10-22 13:29:00', 'YYYY-MM-DD HH24:MI:SS'), '파이어웍', '점심 식사');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, TO_TIMESTAMP('2025-10-22 08:58:00', 'YYYY-MM-DD HH24:MI:SS'), 'PAYCO', '아침 식사');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 350000.00, TO_TIMESTAMP('2025-10-21 21:20:00', 'YYYY-MM-DD HH24:MI:SS'), '김똔똔', '투자금 입금', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U012', 'EXPENSE', 'CARD', 'CHECK', 'C04', 15980.00, TO_TIMESTAMP('2025-10-21 21:16:00', 'YYYY-MM-DD HH24:MI:SS'), 'GS25', '야간 쇼핑');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'INCOME', 'TRANSFER', NULL, 'C11', 20000.00, TO_TIMESTAMP('2025-10-21 16:44:00', 'YYYY-MM-DD HH24:MI:SS'), '청약통장', '월급 이체', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 20000.00, TO_TIMESTAMP('2025-10-21 16:44:00', 'YYYY-MM-DD HH24:MI:SS'), '신한은행', '청약통장 이체', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4900.00, TO_TIMESTAMP('2025-10-21 11:31:00', 'YYYY-MM-DD HH24:MI:SS'), 'GS25', '점심 식사');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 500000.00, TO_TIMESTAMP('2025-10-21 09:38:00', 'YYYY-MM-DD HH24:MI:SS'), '정부지원', '국취지', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 2300.00, TO_TIMESTAMP('2025-10-21 09:27:00', 'YYYY-MM-DD HH24:MI:SS'), '매머드커피', '모닝 커피');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 5000.00, TO_TIMESTAMP('2025-10-20 18:55:00', 'YYYY-MM-DD HH24:MI:SS'), '세탁특공대', '빨래 수거');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4900.00, TO_TIMESTAMP('2025-10-20 18:54:00', 'YYYY-MM-DD HH24:MI:SS'), 'KFC', '저녁');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C03', 10000.00, TO_TIMESTAMP('2025-10-20 10:33:00', 'YYYY-MM-DD HH24:MI:SS'), 'G마켓', '스터디용품 구매');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 10520.00, TO_TIMESTAMP('2025-10-19 15:33:00', 'YYYY-MM-DD HH24:MI:SS'), '세븐일레븐', '일일 생필품');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3800.00, TO_TIMESTAMP('2025-10-19 15:21:00', 'YYYY-MM-DD HH24:MI:SS'), '맥도날드', '간식');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 2493.00, TO_TIMESTAMP('2025-10-19 14:32:00', 'YYYY-MM-DD HH24:MI:SS'), '코인노래방', '취미 활동');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'POINT', NULL, 'C08', 507.00, TO_TIMESTAMP('2025-10-19 14:32:00', 'YYYY-MM-DD HH24:MI:SS'), '코인노래방', '포인트 사용');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 17000.00, TO_TIMESTAMP('2025-10-19 14:24:00', 'YYYY-MM-DD HH24:MI:SS'), '다이소', '필요 물품');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C13', 10000.00, TO_TIMESTAMP('2025-10-19 13:42:00', 'YYYY-MM-DD HH24:MI:SS'), '카카오페이', '개인 정산');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C10', 24900.00, TO_TIMESTAMP('2025-10-19 13:26:00', 'YYYY-MM-DD HH24:MI:SS'), '온라인 결제', '웹 서비스 구독');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C10', 5900.00, TO_TIMESTAMP('2025-10-19 12:47:00', 'YYYY-MM-DD HH24:MI:SS'), 'Google', '음악 스트리밍 구독');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 15500.00, TO_TIMESTAMP('2025-10-18 18:34:00', 'YYYY-MM-DD HH24:MI:SS'), '배달의민족', '저녁 식사');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C01', 37500.00, TO_TIMESTAMP('2025-10-18 11:09:00', 'YYYY-MM-DD HH24:MI:SS'), '쿠팡이츠', '주말 브런치');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 6700.00, TO_TIMESTAMP('2025-10-18 00:03:00', 'YYYY-MM-DD HH24:MI:SS'), '쿠팡', '야간 쇼핑');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C08', 2905.00, TO_TIMESTAMP('2025-10-17 20:32:00', 'YYYY-MM-DD HH24:MI:SS'), '코인노래방', '취미');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'POINT', NULL, 'C08', 95.00, TO_TIMESTAMP('2025-10-17 20:32:00', 'YYYY-MM-DD HH24:MI:SS'), '코인노래방', '포인트 사용');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 7000.00, TO_TIMESTAMP('2025-10-17 20:21:00', 'YYYY-MM-DD HH24:MI:SS'), '더벤티', '커피');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00, TO_TIMESTAMP('2025-10-17 13:25:00', 'YYYY-MM-DD HH24:MI:SS'), '산더미 식당', '점심 식대');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U002', 'INCOME', 'TRANSFER', NULL, 'C13', 24690.00, TO_TIMESTAMP('2025-10-17 12:32:00', 'YYYY-MM-DD HH24:MI:SS'), '교통공사', 'K패스 환급금', 'OPEN_FIN');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12000.00, TO_TIMESTAMP('2025-10-16 19:07:00', 'YYYY-MM-DD HH24:MI:SS'), '청담옥', '저녁 식사');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2800.00, TO_TIMESTAMP('2025-10-16 16:32:00', 'YYYY-MM-DD HH24:MI:SS'), 'GS25', '간식');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C13', 3700.00, TO_TIMESTAMP('2025-10-16 09:38:00', 'YYYY-MM-DD HH24:MI:SS'), '카카오', '기프티콘 구매');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2600.00, TO_TIMESTAMP('2025-10-16 09:27:00', 'YYYY-MM-DD HH24:MI:SS'), 'GS25', '아침 식사');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00, TO_TIMESTAMP('2025-10-16 08:57:00', 'YYYY-MM-DD HH24:MI:SS'), 'PAYCO', '아침 식사');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C10', 9900.00, TO_TIMESTAMP('2025-10-16 00:57:00', 'YYYY-MM-DD HH24:MI:SS'), 'Google Play', '앱 구독료');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2400.00, TO_TIMESTAMP('2025-10-15 20:11:00', 'YYYY-MM-DD HH24:MI:SS'), '맥도날드', '저녁');

INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 9700.00, TO_TIMESTAMP('2025-10-15 19:46:00', 'YYYY-MM-DD HH24:MI:SS'), '쿠팡', '잡화');


INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 1200.00, TO_TIMESTAMP('2025-10-31 18:26:00', 'YYYY-MM-DD HH24:MI:SS'), '인천국제공항공사', '주차/통행료');

COMMIT;

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 5500.00,  DATE '2025-10-31 ' , '가산디지털 주차장', '단기 주차비');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 10800.00,  DATE' 2025-10-31 13:38:00' , '미태리', '점심 식대');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 40500.00,  DATE2025-10-31 01:01:00' , '모바일티머니', '월 정산 교통비');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C05', 8300.00,  DATE2025-10-31 01:01:00' , '하이패스 충전', '고속도로 통행료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 62100.00,  DATE2025-10-31 01:01:00' , '모바일티머니', '월 정산 버스비');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2400.00,  DATE2025-10-30 21:49:00' , '맥도날드', '저녁 간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 7100.00,  DATE2025-10-30 19:51:00' , 'GS25', '편의점 생필품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 45000.00,  DATE2025-10-30 15:29:00' , '자동차 보험', '월 보험료 자동 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 12260.00,  DATE2025-10-30 14:21:00' , '롯데손보', '보험 해약 환급금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 15100.00,  DATE2025-10-30 13:18:00' , '차찬텡', '팀 점심 식대');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE2025-10-30 09:14:00' , '토스', '지인에게 송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1500.00,  DATE2025-10-30 09:08:00' , '빽다방', '출근길 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 10100.00,  DATE2025-10-29 22:02:00' , 'KFC', '저녁 치킨');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (6, 'U021', 'INCOME', 'TRANSFER', NULL, 'C11', 13500.00,  DATE2025-10-29 13:02:00' , '카카오페이', '점심 식대 정산', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (6, 'U021', 'INCOME', 'TRANSFER', NULL, 'C11', 8200.00,  DATE2025-10-29 13:02:00' , '카카오페이', '점심 식대 정산', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (6, 'U021', 'INCOME', 'TRANSFER', NULL, 'C11', 11500.00,  DATE2025-10-29 13:02:00' , '카카오페이', '점심 식대 정산', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 39600.00,  DATE2025-10-29 13:00:00' , '고칸', '팀 점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 2000.00,  DATE2025-10-29 10:34:00' , '커피시즌', '아침 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 2500.00,  DATE2025-10-29 10:34:00' , '스타벅스', '데이트 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 4220.00,  DATE2025-10-28 20:35:00' , '세븐일레븐', '저녁 간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3300.00,  DATE2025-10-28 20:23:00' , '버거킹', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C03', 17910.00,  DATE2025-10-28 19:13:00' , '퀸잇', '온라인 의류 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'INCOME', 'TRANSFER', NULL, 'C11', 20000.00,  DATE2025-10-28 19:13:00' , '네이버페이', '계좌 충전', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 20000.00,  DATE2025-10-28 19:13:00' , '신한은행', '네이버페이 충전', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 9600.00,  DATE2025-10-28 13:58:00' , '컴포즈커피', '팀원 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE2025-10-27 22:14:00' , '김땡땡', '입금 (지인 정산)', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 14940.00,  DATE2025-10-27 22:05:00' , 'Steam', '게임 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 16920.00,  DATE2025-10-27 20:45:00' , '홈플러스', '주간 생필품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 15900.00,  DATE2025-10-27 20:31:00' , '땅스부대찌개', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 63610.00,  DATE2025-10-27 18:35:00' , '대출 은행', '주택 대출 이자', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3500.00,  DATE 2025-10-27 14:27:00' , 'CU', '커피 및 간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 268600.00,  DATE 2025-10-27 12:31:00' , '정부지원금', '국민취업지원 입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00,  DATE 2025-10-27 12:21:00' , '배달의민족', '점심 배달비');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'TRANSFER', NULL, 'C03', 15000.00,  DATE 2025-10-27 10:30:00' , 'G마켓', '생활용품 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 34830.00,  DATE 2025-10-27 07:13:00' , '생명보험', '자동차 보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C10', 5000.00,  DATE 2025-10-27 01:01:00' , 'SKT', '휴대폰 소액 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 31155.00,  DATE 2025-10-26 23:26:00' , '네이버쇼핑', '의류 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C03', 4524.00,  DATE 2025-10-26 23:26:00' , '쿠팡', '화장품 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'POINT', NULL, 'C03', 121.00,  DATE 2025-10-26 23:26:00' , '네이버페이', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 62700.00,  DATE 2025-10-26 18:45:00' , '초밥 전문점', '저녁 외식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U019', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-10-25 20:12:00' , '김뚱땡', '스터디 회비 입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 1000.00,  DATE 2025-10-25 05:22:00' , '은행', '통장 이자', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4000.00,  DATE 2025-10-25 04:36:00' , '미니스톱', '야간 간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C01', 5300.00,  DATE 2025-10-24 18:47:00' , 'KFC', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3000.00,  DATE 2025-10-24 18:46:00' , '맥도날드', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 10000.00,  DATE 2025-10-24 14:03:00' , '감자탕', '점심 식대');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C10', 7890.00,  DATE 2025-10-24 10:17:00' , '쿠팡', '와우 멤버십');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4100.00,  DATE 2025-10-24 09:24:00' , '메가커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C01', 1800.00,  DATE 2025-10-23 22:04:00' , '맥도날드', '야식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 13000.00,  DATE 2025-10-23 19:05:00' , '배달의민족', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 57720.00,  DATE 2025-10-23 18:26:00' , '학자금재단', '학자금 대출 상환', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7200.00,  DATE 2025-10-23 12:36:00' , '배달의민족', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 48730.00,  DATE 2025-10-23 07:00:00' , 'SKT', '휴대폰 요금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-10-22 19:59:00' , '토스', '지인에게 송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3800.00,  DATE 2025-10-22 19:53:00' , '컴포즈커피', '저녁 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U012', 'EXPENSE', 'TRANSFER', NULL, 'C06', 22340.00,  DATE 2025-10-22 15:33:00' , '온라인 약국', '건강보조제 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1900.00,  DATE 2025-10-22 13:54:00' , '메가커피', '점심 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 10500.00,  DATE 2025-10-22 13:29:00' , '파이어웍', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00,  DATE 2025-10-22 08:58:00' , 'PAYCO', '아침 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 350000.00,  DATE 2025-10-21 21:20:00' , '김똔똔', '투자금 입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U012', 'EXPENSE', 'CARD', 'CHECK', 'C04', 15980.00,  DATE 2025-10-21 21:16:00' , 'GS25', '야간 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'INCOME', 'TRANSFER', NULL, 'C11', 20000.00,  DATE 2025-10-21 16:44:00' , '청약통장', '월급 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 20000.00,  DATE 2025-10-21 16:44:00' , '신한은행', '청약통장 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4900.00,  DATE 2025-10-21 11:31:00' , 'GS25', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 500000.00,  DATE 2025-10-21 09:38:00' , '정부지원', '국취지', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 2300.00,  DATE 2025-10-21 09:27:00' , '매머드커피', '모닝 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 5000.00,  DATE 2025-10-20 18:55:00' , '세탁특공대', '빨래 수거');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4900.00,  DATE 2025-10-20 18:54:00' , 'KFC', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C03', 10000.00,  DATE 2025-10-20 10:33:00' , 'G마켓', '스터디용품 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 10520.00,  DATE 2025-10-19 15:33:00' , '세븐일레븐', '일일 생필품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3800.00,  DATE 2025-10-19 15:21:00' , '맥도날드', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 2493.00,  DATE 2025-10-19 14:32:00' , '코인노래방', '취미 활동');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'POINT', NULL, 'C08', 507.00,  DATE 2025-10-19 14:32:00' , '코인노래방', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 17000.00,  DATE 2025-10-19 14:24:00' , '다이소', '필요 물품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C13', 10000.00,  DATE 2025-10-19 13:42:00' , '카카오페이', '개인 정산');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C10', 24900.00,  DATE 2025-10-19 13:26:00' , '온라인 결제', '웹 서비스 구독');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C10', 5900.00,  DATE 2025-10-19 12:47:00' , 'Google', '음악 스트리밍 구독');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 15500.00,  DATE 2025-10-18 18:34:00' , '배달의민족', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C01', 37500.00,  DATE 2025-10-18 11:09:00' , '쿠팡이츠', '주말 브런치');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 6700.00,  DATE 2025-10-18 00:03:00' , '쿠팡', '야간 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C08', 2905.00,  DATE 2025-10-17 20:32:00' , '코인노래방', '취미');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'POINT', NULL, 'C08', 95.00,  DATE 2025-10-17 20:32:00' , '코인노래방', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 7000.00,  DATE 2025-10-17 20:21:00' , '더벤티', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00,  DATE 2025-10-17 13:25:00' , '산더미 식당', '점심 식대');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U002', 'INCOME', 'TRANSFER', NULL, 'C13', 24690.00,  DATE 2025-10-17 12:32:00' , '교통공사', 'K패스 환급금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12000.00,  DATE 2025-10-16 19:07:00' , '청담옥', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2800.00,  DATE 2025-10-16 16:32:00' , 'GS25', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C13', 3700.00,  DATE 2025-10-16 09:38:00' , '카카오', '기프티콘 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2600.00,  DATE 2025-10-16 09:27:00' , 'GS25', '아침 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00,  DATE 2025-10-16 08:57:00' , 'PAYCO', '아침 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C10', 9900.00,  DATE 2025-10-16 00:57:00' , 'Google Play', '앱 구독료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2400.00,  DATE 2025-10-15 20:11:00' , '맥도날드', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 9700.00,  DATE 2025-10-15 19:46:00' , '쿠팡', '잡화');

COMMIT;

-- ============================================================
--  DUMMY DATA: smaccount.LEDGER_ENTRY (53개 - Part 3)
--  2025년 10월 15일 ~ 10월 1일 내역 (MySQL 문법 및 보안 처리)
--  참조: Group ID (1~10, Member ID (U001~U030, Category ID (C01~C13)
-- ============================================================

-- [1-10]: 2025-10-15 ~ 2025-10-13 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C13', 1200.00,  DATE 2025-10-15 12:10:00' , '카카오', '기타 수입', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-10-14 21:43:00' , '토스 김현수', '정산 입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-10-14 20:50:00' , '토스 김미남', '지인 송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 5000.00,  DATE 2025-10-14 20:19:00' , '홍두께', '생활용품 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 12600.00,  DATE 2025-10-14 19:49:00' , '쿠팡', '온라인 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-10-14 12:01:00' , '신한은행', '네이버페이 충전', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U026', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-10-14 12:01:00' , '네이버페이', '충전 내역', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3800.00,  DATE 2025-10-14 12:01:00' , '한솥도시락', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U027', 'EXPENSE', 'POINT', NULL, 'C01', 100.00,  DATE 2025-10-14 12:01:00' , '네이버페이', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-10-13 22:48:00' , '토스 김현수', '입금', 'OPEN_FIN');

-- [11-20]: 2025-10-13 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 6100.00,  DATE 2025-10-13 22:06:00' , 'GS25', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 432829.00,  DATE 2025-10-13 16:37:00' , '토스 노현우', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C01', 4064.00,  DATE 2025-10-13 13:11:00' , '한솥도시락', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'POINT', NULL, 'C01', 836.00,  DATE 2025-10-13 13:11:00' , '네이버페이', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 39210.00,  DATE 2025-10-13 09:38:00' , 'KT', '인터넷 요금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 114960.00,  DATE 2025-10-13 09:14:00' , 'KT', '휴대폰 요금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 450.00,  DATE 2025-10-13 08:32:00' , '카카오', '이자 수입', 'OPEN_FIN');

-- [21-30]: 2025-10-12, 2025-10-11, 2025-10-10 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 4000.00,  DATE 2025-10-12 14:04:00' , '패스오더', '팀 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 4800.00,  DATE 2025-10-12 08:54:00' , '맥도날드', '아침 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 0.00,  DATE 2025-10-11 00:57:00' , '무통식', '입금 내역', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U006', 'EXPENSE', 'TRANSFER', NULL, 'C11', 31391.00,  DATE 2025-10-10 19:07:00' , '삼성화재', '보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U013', 'EXPENSE', 'TRANSFER', NULL, 'C10', 41340.00,  DATE 2025-10-10 19:05:00' , 'DB손보', '차량 보험', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 137180.00,  DATE 2025-10-10 19:03:00' , '롯데손보', '장기 보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 29572.00,  DATE 2025-10-10 18:40:00' , '흥국', '보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 181030.00,  DATE 2025-10-10 08:59:00' , '한화손보', '차량 보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U003', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 16700.00,  DATE 2025-10-10 00:00:00' , 'KOBUS', '시외버스');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U004', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 20800.00,  DATE 2025-10-10 00:00:00' , 'KOBUS', '시외버스');

-- [31-40]: 2025-10-10, 2025-10-09 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U005', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 140830.00,  DATE 2025-10-10 00:00:00' , '트립닷컴', '여행 예약');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 4220.00,  DATE 2025-10-09 16:23:00' , '세븐일레븐', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 2500.00,  DATE 2025-10-09 16:15:00' , '이모네', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U002', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 13000.00,  DATE 2025-10-09 16:14:00' , '베이커리', '빵 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U011', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 20000.00,  DATE 2025-10-09 16:08:00' , '장군축산', '고기 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 22000.00,  DATE 2025-10-09 16:04:00' , '쿠팡', '온라인 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-10-09 16:01:00' , '토스', '지인 송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U019', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-10-09 15:12:00' , '신한은행', '네이버페이 충전', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U019', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-10-09 15:12:00' , '네이버페이', '충전 내역', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 3000.00,  DATE 2025-10-09 15:12:00' , '코인노래방', '취미');

-- [41-50]: 2025-10-09 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U004', 'INCOME', 'TRANSFER', NULL, 'C11', 30000.00,  DATE 2025-10-09 15:06:00' , '네이버페이', '충전 내역', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U004', 'EXPENSE', 'TRANSFER', NULL, 'C11', 30000.00,  DATE 2025-10-09 15:06:00' , '신한은행', '네이버페이 충전', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C03', 33491.00,  DATE 2025-10-09 15:06:00' , '모스트헤어', '미용실');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'POINT', NULL, 'C03', 509.00,  DATE 2025-10-09 15:06:00' , '네이버페이', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C07', 19800.00,  DATE 2025-10-09 14:50:00' , '교보문고', '학습 교재');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U019', 'EXPENSE', 'TRANSFER', NULL, 'C11', 11687.00,  DATE 2025-10-09 14:50:00' , '카카오페이', '송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 4000.00,  DATE 2025-10-09 14:23:00' , '더벤티', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00,  DATE 2025-10-08 22:46:00' , '맥도날드', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U001', 'EXPENSE', 'CARD', 'CHECK', 'C01', 4000.00,  DATE 2025-10-08 20:28:00' , '휴게소', '식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U008', 'EXPENSE', 'CARD', 'CHECK', 'C05', 30800.00,  DATE 2025-10-08 17:50:00' , '티머니GO', '교통비');

-- [51-60]: 2025-10-08, 2025-10-07 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C03', 1900.00,  DATE 2025-10-08 09:15:00' , '카카오', '온라인 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U026', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-10-08 09:15:00' , '카카오페이', '충전 내역', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-10-08 09:15:00' , '신한은행', '카카오페이 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 70200.00,  DATE 2025-10-07 21:17:00' , '김금자숯불갈비', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U037', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1800.00,  DATE 2025-10-07 17:17:00' , '컴포즈', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 11800.00,  DATE 2025-10-07 11:19:00' , '이마트', '생활용품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 26140.00,  DATE 2025-10-07 11:13:00' , '이마트', '청소용품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C03', 10000.00,  DATE 2025-10-07 00:48:00' , 'G마켓', '온라인 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'EXPENSE', 'CARD', 'CHECK', 'C13', 5000.00,  DATE 2025-10-06 23:32:00' , 'NICE', '기타 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 3821.00,  DATE 2025-10-06 22:02:00' , '코인노래방', '취미');

-- [61-70]: 2025-10-06 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'POINT', NULL, 'C08', 1179.00,  DATE 2025-10-06 22:02:00' , '네이버페이', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 500.00,  DATE 2025-10-06 22:00:00' , '토스', '송금 수수료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3300.00,  DATE 2025-10-06 19:31:00' , '텐퍼센트커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3000.00,  DATE 2025-10-06 14:47:00' , '패스트푸드', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U003', 'INCOME', 'TRANSFER', NULL, 'C05', 30800.00,  DATE 2025-10-06 13:16:00' , 'KOBUS', '버스표 환급');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C05', 30800.00,  DATE 2025-10-06 13:16:00' , '티머니GO', '교통비 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U002', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 30800.00,  DATE 2025-10-06 12:45:00' , 'KOBUS', '버스표 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U002', 'INCOME', 'TRANSFER', NULL, 'C05', 30800.00,  DATE 2025-10-06 12:45:00' , '티머니GO', '교통비 환급');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U003', 'EXPENSE', 'TRANSFER', NULL, 'C05', 4100.00,  DATE 2025-10-06 03:37:00' , '티머니GO', '교통비');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U003', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 20800.00,  DATE 2025-10-06 03:37:00' , 'KOBUS', '버스표 결제');

-- [71-80]: 2025-10-05, 2025-10-04 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-10-05 16:58:00' , '토스 김현수', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 12700.00,  DATE 2025-10-04 17:02:00' , '와플대학', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2000.00,  DATE 2025-10-04 16:50:00' , '다이소', '생활용품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C02', 14700.00,  DATE 2025-10-04 16:40:00' , '빽다방', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 400000.00,  DATE 2025-10-04 10:21:00' , '카카오페이', '비상금 이체');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 382940.00,  DATE 2025-10-04 10:21:00' , '신한은행', '카카오페이 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 382940.00,  DATE 2025-10-04 10:21:00' , '김현수', '카카오페이 입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U006', 'INCOME', 'TRANSFER', NULL, 'C05', 20800.00,  DATE 2025-10-03 20:18:00' , '티머니GO', '교통비 환급');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U006', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 20800.00,  DATE 2025-10-03 20:18:00' , 'KOBUS', '버스표 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 19960.00,  DATE 2025-10-03 07:08:00' , '페이레터', '게임 결제');

-- [81-90]: 2025-10-02 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 300000.00,  DATE 2025-10-02 21:32:00' , '토스 김현수', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4500.00,  DATE 2025-10-02 18:59:00' , '빽다방', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'TRANSFER', NULL, 'C08', 3000.00,  DATE 2025-10-02 18:57:00' , '토스', '전시회 관람료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C01', 26500.00,  DATE 2025-10-02 18:55:00' , '장군축산', '고기 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 2000.00,  DATE 2025-10-02 18:52:00' , '토스', '지인 송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U001', 'EXPENSE', 'CARD', 'CHECK', 'C02', 8000.00,  DATE 2025-10-02 18:49:00' , '대학당빵집', '빵');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3000.00,  DATE 2025-10-02 18:47:00' , '군산상회', '식재료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C03', 5000.00,  DATE 2025-10-02 15:01:00' , '이니시스', '온라인 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 19980.00,  DATE 2025-10-02 13:06:00' , '쿠팡', '온라인 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-10-02 09:15:00' , '토스', '지인 송금');

-- [91-99]: 2025-10-02, 2025-10-01 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3500.00,  DATE 2025-10-02 09:10:00' , 'PAYCO오더', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2500.00,  DATE 2025-10-01 21:07:00' , '바른농산물', '식재료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2400.00,  DATE 2025-10-01 21:04:00' , '맥도날드', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1000.00,  DATE 2025-10-01 19:29:00' , '자판기', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1000.00,  DATE 2025-10-01 19:29:00' , '자판기', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U019', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-10-01 19:26:00' , '네이버페이', '충전 내역', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C08', 4878.00,  DATE 2025-10-01 19:26:00' , '코인노래방', '취미');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'POINT', NULL, 'C08', 122.00,  DATE 2025-10-01 19:26:00' , '네이버페이', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'TRANSFER', NULL, 'C11', 297440.00,  DATE 2025-10-01 14:44:00' , '토스 김현수', '이체');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 4909.00,  DATE 2025-10-01 12:55:00' , '한솥도시락', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'POINT', NULL, 'C01', 91.00,  DATE 2025-10-01 12:55:00' , '네이버페이', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C11', 2500.00,  DATE 2025-10-01 09:19:00' , 'KICC', '카드 수수료');

COMMIT;

-- ============================================================
--  DUMMY DATA: smaccount.LEDGER_ENTRY (99개 - Part 2)
--  2025년 8월 ~ 10월 실제 거래 내역 기반으로 50% 더미화
--  참조: Group ID (1~10, Member ID (U001~U030, Category ID (C01~C13)
-- ============================================================

-- 2025-10-30 ~ 2025-10-15 내역 (Part 1 이후의 남은 데이터)
-- Group/Member ID는 랜덤하게 할당되며, C11(금융/이체)은 ext_src를 포함합니다.

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'TRANSFER', NULL, 'C11', 20490.00,  DATE 2025-09-30 18:31:00' , '라이나생명', '보험료 납부');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3900.00,  DATE 2025-09-30 23:06:00' , '코리아세븐', '편의점 지출');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 2000.00,  DATE 2025-09-30 22:36:00' , '코인노래방', '취미 활동');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 450000.00,  DATE 2025-09-30 22:31:00' , '김형뀨', '입금 (월 정산)', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4500.00,  DATE 2025-09-30 19:49:00' , '컴포즈커피', '팀원 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 32000.00,  DATE 2025-09-30 19:48:00' , '등촌샤브칼국수', '팀 저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-09-30 12:09:00' , '네이버페이 충전', '스터디 물품 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U028', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3695.00,  DATE 2025-09-30 12:09:00' , '한솥도시락', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U028', 'EXPENSE', 'POINT', NULL, 'C01', 205.00,  DATE 2025-09-30 12:09:00' , '한솥도시락', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C13', 1600.00,  DATE 2025-09-30 09:22:00' , '대표인증', '본인 인증 비용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3900.00,  DATE 2025-09-29 18:52:00' , '맥도날드', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C01', 8205.00,  DATE 2025-09-29 12:55:00' , '한솥도시락', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'POINT', NULL, 'C01', 95.00,  DATE 2025-09-29 12:55:00' , '한솥도시락', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4000.00,  DATE 2025-09-29 09:16:00' , '패스오더', '모닝 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1500.00,  DATE 2025-09-28 23:16:00' , '코레일유통', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (8, 'U002', 'INCOME', 'TRANSFER', NULL, 'C11', 21200.00,  DATE 2025-09-28 23:13:00' , '한국철도공사', '열차표 취소 환급', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C05', 21200.00,  DATE 2025-09-28 23:12:00' , '한국철도공사', 'KTX/SRT 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 150000.00,  DATE 2025-09-28 09:25:00' , '자립예탁금', '이자 입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4500.00,  DATE 2025-09-27 23:08:00' , 'GS25', '편의점 지출');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2800.00,  DATE 2025-09-27 22:53:00' , '맥도날드', '야식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3800.00,  DATE 2025-09-27 22:49:00' , '맥도날드', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (8, 'U004', 'INCOME', 'TRANSFER', NULL, 'C11', 21200.00,  DATE 2025-09-27 16:06:00' , '한국철도공사', 'KTX 취소 환급', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U004', 'EXPENSE', 'TRANSFER', NULL, 'C05', 21200.00,  DATE 2025-09-27 16:06:00' , '토스페이', '교통비 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C01', 1400.00,  DATE 2025-09-27 09:27:00' , 'PAYCO오더', '아침 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 11.00,  DATE 2025-09-27 05:19:00' , '은행', '통장 이자', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 0.00,  DATE 2025-09-27 03:53:00' , '은행', '통장 이자', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 0.00,  DATE 2025-09-27 02:51:00' , '세이프박스', '정기 이자 입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 1000.00,  DATE 2025-09-27 02:26:00' , '토스', '지인 송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 11000.00,  DATE 2025-09-27 02:23:00' , '황토사우나', '목욕탕 이용료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 2000.00,  DATE 2025-09-27 00:04:00' , 'PC카페', '게임 이용료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C08', 3000.00,  DATE 2025-09-27 00:00:00' , 'PC카페', '야간 이용권');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12000.00,  DATE 2025-09-26 22:45:00' , '착한치킨', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U006', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1500.00,  DATE 2025-09-26 22:24:00' , '세븐일레븐', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U006', 'EXPENSE', 'CARD', 'CHECK', 'C04', 8000.00,  DATE 2025-09-26 21:59:00' , '코레일유통', '여행 중 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 11800.00,  DATE 2025-09-26 13:15:00' , '미태리', '점심 식대');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3800.00,  DATE 2025-09-26 10:33:00' , '파란만잔', '아침 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'TRANSFER', NULL, 'C06', 22340.00,  DATE 2025-09-25 20:38:00' , '온라인 약국', '건강보조제 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 846820.00,  DATE 2025-09-25 18:47:00' , '삼성카드', '카드대금 납부', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 1101862.00,  DATE 2025-09-25 18:45:00' , 'KB카드', '카드대금 납부', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 63610.00,  DATE 2025-09-25 18:34:00' , '한국장학재단', '학자금 대출 이자', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'INCOME', 'TRANSFER', NULL, 'C05', 9200.00,  DATE 2025-09-25 13:57:00' , '토스', '교통비 환급');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C05', 11400.00,  DATE 2025-09-25 13:56:00' , '티머니GO', '교통비 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 3300.00,  DATE 2025-09-25 10:32:00' , '컴포즈커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 34830.00,  DATE 2025-09-25 07:15:00' , '한화손보', '보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 39100.00,  DATE 2025-09-24 19:35:00' , '총각네 고깃간', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C02', 6400.00,  DATE 2025-09-24 19:18:00' , '와플대학', '디저트');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3900.00,  DATE 2025-09-24 19:09:00' , '세븐일레븐', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 1800.00,  DATE 2025-09-24 18:58:00' , '맥도날드', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3000.00,  DATE 2025-09-24 18:57:00' , '맥도날드', '식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C01', 3803.00,  DATE 2025-09-24 12:13:00' , '한솥도시락', '점심 식대');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U028', 'EXPENSE', 'POINT', NULL, 'C01', 97.00,  DATE 2025-09-24 12:13:00' , '한솥도시락', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (8, 'U023', 'INCOME', 'TRANSFER', NULL, 'C05', 9200.00,  DATE 2025-09-24 11:54:00' , '토스페이', '교통비 환급', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'TRANSFER', NULL, 'C05', 9200.00,  DATE 2025-09-24 11:54:00' , '토스페이', '교통비 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C10', 7890.00,  DATE 2025-09-24 10:18:00' , '쿠팡', '와우 멤버십');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1600.00,  DATE 2025-09-24 09:25:00' , '매머드커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C10', 700.00,  DATE 2025-09-24 01:01:00' , '휴대폰알림서비스', '휴대폰 알림');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 25500.00,  DATE 2025-09-23 20:20:00' , '쿠팡이츠', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 57720.00,  DATE 2025-09-23 18:25:00' , '학자금재단', '학자금 대출 상환', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3900.00,  DATE 2025-09-23 12:09:00' , '한솥도시락', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 28100.00,  DATE 2025-09-23 07:00:00' , 'SKT', '휴대폰 요금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 12200.00,  DATE 2025-09-22 19:20:00' , '게임', '취미 활동');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-09-22 19:13:00' , '토스', '지인에게 송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C01', 10000.00,  DATE 2025-09-22 19:02:00' , '디트로이트피자', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C01', 5800.00,  DATE 2025-09-22 18:55:00' , '맥도날드', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C07', 11203.00,  DATE 2025-09-22 14:11:00' , '큐넷', '시험 접수비');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'POINT', NULL, 'C07', 97.00,  DATE 2025-09-22 14:11:00' , '네이버페이', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-09-22 14:11:00' , '신한은행', '네이버페이 충전');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U026', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-09-22 14:11:00' , '네이버페이', '충전 내역');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3900.00,  DATE 2025-09-22 12:16:00' , '한솥도시락', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U027', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-09-22 12:16:00' , '네이버페이', '충전 내역');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U027', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-09-22 12:16:00' , '신한은행', '네이버페이 충전');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1200.00,  DATE 2025-09-22 10:33:00' , 'GS25', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 500000.00,  DATE 2025-09-22 09:36:00' , '정부지원', '국민취업지원금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U011', 'EXPENSE', 'CARD', 'CHECK', 'C08', 6700.00,  DATE 2025-09-22 00:21:00' , 'Steam', '게임');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3300.00,  DATE 2025-09-20 23:43:00' , '맥도날드', '야식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 7100.00,  DATE 2025-09-20 21:43:00' , 'GS25', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (6, 'U027', 'INCOME', 'TRANSFER', NULL, 'C11', 20000.00,  DATE 2025-09-20 21:28:00' , '카카오페이', '정산 입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (6, 'U027', 'INCOME', 'TRANSFER', NULL, 'C11', 20000.00,  DATE 2025-09-20 21:27:00' , '카카오페이', '정산 입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 60000.00,  DATE 2025-09-20 21:24:00' , '등촌샤브칼국수', '팀 저녁 회식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 16000.00,  DATE 2025-09-20 19:58:00' , '카카오페이', '송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 558.00,  DATE 2025-09-20 02:05:00' , '은행', '이자 입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C08', 163830.00,  DATE 2025-09-19 16:50:00' , '트립닷컴', '여행 예약');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 316000.00,  DATE 2025-09-19 15:25:00' , '정부지원', '국민취업지원금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1600.00,  DATE 2025-09-19 09:13:00' , '매머드커피', '모닝 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 7800.00,  DATE 2025-09-18 23:09:00' , '쿠팡', '온라인 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C03', 33914.00,  DATE 2025-09-18 23:07:00' , 'A-RT', '온라인 신발 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'POINT', NULL, 'C03', 86.00,  DATE 2025-09-18 23:07:00' , '네이버페이', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U004', 'INCOME', 'TRANSFER', NULL, 'C11', 30000.00,  DATE 2025-09-18 23:07:00' , '네이버페이', '계좌 충전', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U004', 'EXPENSE', 'TRANSFER', NULL, 'C11', 30000.00,  DATE 2025-09-18 23:07:00' , '신한은행', '네이버페이 충전', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 13000.00,  DATE 2025-09-18 20:25:00' , '중앙하이츠', '관리비');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4680.00,  DATE 2025-09-18 20:23:00' , 'GS25', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'INCOME', 'TRANSFER', NULL, 'C11', 400000.00,  DATE 2025-09-18 20:20:00' , '김지지', '입금 (투자금)', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3500.00,  DATE 2025-09-18 19:57:00' , '맥도날드', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U011', 'EXPENSE', 'CARD', 'CHECK', 'C08', 10000.00,  DATE 2025-09-18 18:50:00' , '코인노래방', '취미');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U019', 'EXPENSE', 'TRANSFER', NULL, 'C01', 3495.00,  DATE 2025-09-18 13:01:00' , '한솥도시락', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U019', 'EXPENSE', 'POINT', NULL, 'C01', 405.00,  DATE 2025-09-18 13:01:00' , '한솥도시락', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3500.00,  DATE 2025-09-18 09:07:00' , '더벤티', '모닝 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3400.00,  DATE 2025-09-17 19:48:00' , '와플대학', '디저트');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C02', 7000.00,  DATE 2025-09-17 13:21:00' , '더반', '점심 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 10200.00,  DATE 2025-09-16 22:22:00' , '쿠팡', '야간 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C03', 10000.00,  DATE 2025-09-16 10:38:00' , 'G마켓', '스터디 용품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C02', 2000.00,  DATE 2025-09-16 10:31:00' , '커피시즌', '아침 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C01', 10000.00,  DATE 2025-09-15 18:49:00' , '서울생돈까스', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 50000.00,  DATE 2025-09-15 17:49:00' , '카카오페이', '이체');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U006', 'INCOME', 'TRANSFER', NULL, 'C11', 46881.00,  DATE 2025-09-15 17:49:00' , '카카오페이', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U006', 'EXPENSE', 'TRANSFER', NULL, 'C11', 46881.00,  DATE 2025-09-15 17:49:00' , '신한은행', '카카오페이 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C03', 10000.00,  DATE 2025-09-15 11:36:00' , 'G마켓', '서적 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 4500.00,  DATE 2025-09-14 19:10:00' , '중앙할인마트', '생필품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U010', 'EXPENSE', 'TRANSFER', NULL, 'C08', 6000.00,  DATE 2025-09-14 16:08:00' , '토스', '전시회 입장료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C03', 26020.00,  DATE 2025-09-13 20:27:00' , '쿠팡', '잡화 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 1000.00,  DATE 2025-09-13 19:46:00' , '바른농산물', '식재료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 48000.00,  DATE 2025-09-13 18:08:00' , '호천생갈비', '가족 외식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C02', 16300.00,  DATE 2025-09-13 14:21:00' , '인디오븐', '베이커리');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 100000.00,  DATE 2025-09-13 00:50:00' , '무통식', '지인 입금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-09-12 19:16:00' , '카카오페이', '송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3000.00,  DATE 2025-09-12 13:18:00' , '산더미', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00,  DATE 2025-09-12 13:18:00' , '산더미', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C13', 3700.00,  DATE 2025-09-12 09:37:00' , '카카오', '기프티콘 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 24160.00,  DATE 2025-09-12 09:18:00' , '쿠팡', '온라인 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3500.00,  DATE 2025-09-12 09:04:00' , '더벤티', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C05', 38850.00,  DATE 2025-09-12 01:01:00' , '모바일티머니', '월 정산 지하철');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C05', 39450.00,  DATE 2025-09-12 01:01:00' , '모바일티머니', '월 정산 버스');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 15000.00,  DATE 2025-09-11 19:41:00' , '토스', '지인 송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9500.00,  DATE 2025-09-11 18:56:00' , '돈공', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00,  DATE 2025-09-11 13:13:00' , '산더미', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4300.00,  DATE 2025-09-11 10:33:00' , '디저트39', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U025', 'EXPENSE', 'TRANSFER', NULL, 'C10', 118630.00,  DATE 2025-09-11 09:16:00' , 'KT', '통신 요금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3400.00,  DATE 2025-09-10 20:29:00' , '와플대학', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3400.00,  DATE 2025-09-10 20:10:00' , 'PAYCO오더', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C13', 300000.00,  DATE 2025-09-10 19:08:00' , '간편앱출금', '개인 자금 인출');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U002', 'INCOME', 'TRANSFER', NULL, 'C05', 19850.00,  DATE 2025-09-10 12:48:00' , '교통공사', 'K패스 환급금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CHECK', 'C10', 141470.00,  DATE 2025-09-10 09:09:00' , '한화손해보험', '보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'TRANSFER', NULL, 'C03', 6700.00,  DATE 2025-09-09 13:01:00' , '네이버파이낸셜', '온라인 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C02', 2900.00,  DATE 2025-09-09 09:11:00' , '커피나인', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 6100.00,  DATE 2025-10-08 20:01:00' , 'GS25', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-09-08 18:55:00' , '토스', '지인 송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U026', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 4000.00,  DATE 2025-09-08 09:20:00' , 'KICC', '여가활동');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C03', 1900.00,  DATE 2025-09-08 09:15:00' , '카카오', '온라인 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 40000.00,  DATE 2025-09-07 23:10:00' , '청약통장', '월급 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 40000.00,  DATE 2025-09-07 23:10:00' , '토스', '청약통장 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 33000.00,  DATE 2025-09-07 21:52:00' , '쿠팡', '온라인 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'TRANSFER', NULL, 'C03', 10000.00,  DATE 2025-09-07 15:35:00' , '당근페이', '중고거래 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 0.00,  DATE 2025-09-07 06:58:00' , '은행', '이자', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-09-06 19:47:00' , '김민망', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C13', 500000.00,  DATE 2025-09-06 13:38:00' , '태연', '용돈 입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 523400.00,  DATE 2025-09-06 10:47:00' , 'LG전자', '가전 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C01', 16613.00,  DATE 2025-09-05 20:14:00' , '쿠팡이츠', '배달 저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C04', 18800.00,  DATE 2025-09-05 19:13:00' , 'GS25', '생활용품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 31391.00,  DATE 2025-09-05 18:48:00' , '삼성화재', '보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U025', 'EXPENSE', 'TRANSFER', NULL, 'C10', 41340.00,  DATE 2025-09-05 18:47:00' , 'DB손보', '차량 보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 137180.00,  DATE 2025-09-05 18:45:00' , '롯데손보', '장기 보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 29572.00,  DATE 2025-09-05 18:29:00' , '흥국생명', '보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00,  DATE 2025-09-05 15:51:00' , 'PC방', '게임');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (9, 'U024', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-09-05 15:51:00' , '카카오페이', '충전', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (9, 'U024', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-09-05 15:51:00' , '카카오페이', '충전', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3600.00,  DATE 2025-09-05 15:36:00' , '세븐일레븐', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C06', 7600.00,  DATE 2025-09-05 15:29:00' , '광명의료재단', '병원 진료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C04', 100.00,  DATE 2025-09-05 14:49:00' , '우체국', '우편 수수료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3920.00,  DATE 2025-09-05 14:49:00' , '우체국', '우편료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00,  DATE 2025-09-05 14:24:00' , '린스시', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U015', 'EXPENSE', 'CARD', 'CHECK', 'C13', 2500.00,  DATE 2025-09-05 09:18:00' , 'KICC', '카드 수수료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C01', 5000.00,  DATE 2025-09-04 19:17:00' , '닭강정', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3570.00,  DATE 2025-09-04 19:11:00' , '이마트에브리데이', '식재료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3000.00,  DATE 2025-09-04 18:56:00' , '맥도날드', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U019', 'INCOME', 'TRANSFER', NULL, 'C11', 324050.00,  DATE 2025-09-04 14:46:00' , '카카오페이', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U019', 'EXPENSE', 'TRANSFER', NULL, 'C11', 324050.00,  DATE 2025-09-04 14:46:00' , '카카오페이', '신한은행 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'TRANSFER', NULL, 'C13', 400000.00,  DATE 2025-09-04 14:46:00' , '카카오페이', '비상금 이체');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (6, 'U021', 'INCOME', 'TRANSFER', NULL, 'C11', 8300.00,  DATE 2025-09-04 11:55:00' , '카카오페이', '점심 정산', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C03', 20000.00,  DATE 2025-09-04 11:46:00' , 'G마켓', '스터디 물품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 29290.00,  DATE 2025-09-03 21:26:00' , '쿠팡', '온라인 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3500.00,  DATE 2025-09-03 20:42:00' , '과일가게', '과일 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 20700.00,  DATE 2025-09-03 20:41:00' , '게임', '취미 활동');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 10000.00,  DATE 2025-09-03 20:07:00' , 'KFC', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C01', 19900.00,  DATE 2025-09-03 19:56:00' , '스시이안', '저녁 외식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 274840.00,  DATE 2025-09-03 16:19:00' , '김꾸꾸', '투자 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C06', 22340.00,  DATE 2025-09-03 16:18:00' , '김녹차', '의료비 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2500.00,  DATE 2025-09-03 09:20:00' , 'GS25', '아침 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C08', 11000.00,  DATE 2025-09-02 21:34:00' , 'Steam', '게임 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 150000.00,  DATE 2025-09-02 21:00:00' , '김마카', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-09-02 19:07:00' , '토스', '지인 송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C01', 16300.00,  DATE 2025-09-02 18:45:00' , '본죽', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'POINT', NULL, 'C01', 306.00,  DATE 2025-09-02 18:45:00' , '네이버페이', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 20490.00,  DATE 2025-09-01 18:31:00' , '라이나생명', '보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 316000.00,  DATE 2025-09-01 16:09:00' , '정부지원', '국민취업지원금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'TRANSFER', NULL, 'C13', 10000.00,  DATE 2025-09-01 15:06:00' , '카카오페이', '송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1800.00,  DATE 2025-09-01 09:06:00' , 'GS25', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C08', 4000.00,  DATE 2025-08-31 20:31:00' , '문화비', '전시회 관람');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C04', 7200.00,  DATE 2025-08-31 13:03:00' , '이마트24', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C06', 3000.00,  DATE 2025-08-31 12:49:00' , '365의원', '진료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 28720.00,  DATE 2025-08-29 23:42:00' , 'GS25', '생활용품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C11', 20000.00,  DATE 2025-08-29 19:53:00' , '카카오페이', '입금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C06', 15400.00,  DATE 2025-08-29 11:12:00' , '골드약국', '약값');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C06', 108000.00,  DATE 2025-08-29 09:22:00' , '365의원', '병원비');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C02', 12000.00,  DATE 2025-08-28 20:30:00' , '민들레영토', '카페');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 3000.00,  DATE 2025-08-28 19:09:00' , '코인노래방', '취미');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'TRANSFER', NULL, 'C03', 10000.00,  DATE 2025-08-28 13:18:00' , 'G마켓', '잡화 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3800.00,  DATE 2025-08-28 09:26:00' , '파란만잔', '아침 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3900.00,  DATE 2025-08-27 19:02:00' , '세븐일레븐', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12500.00,  DATE 2025-08-26 13:19:00' , '미태리', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4100.00,  DATE 2025-08-26 09:14:00' , '메가커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C08', 2000.00,  DATE 2025-08-25 20:30:00' , '코인노래방', '취미');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 6800.00,  DATE 2025-08-25 20:11:00' , '빽다방', '저녁 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 26900.00,  DATE 2025-08-25 18:55:00' , '쿠팡', '온라인 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 824808.00,  DATE 2025-08-25 18:49:00' , 'KB카드', '카드대금 납부', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 937714.00,  DATE 2025-08-25 18:48:00' , '삼성카드', '카드대금 납부', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 57720.00,  DATE 2025-08-25 18:36:00' , '학자금재단', '대출 이자', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 63610.00,  DATE 2025-08-25 18:35:00' , '학자금재단', '대출 이자', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00,  DATE 2025-08-25 13:18:00' , '산더미', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-08-25 10:16:00' , '김디그', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C02', 2300.00,  DATE 2025-08-25 09:18:00' , '매머드커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 34830.00,  DATE 2025-08-25 07:13:00' , '한화손보', '보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 36800.00,  DATE 2025-08-25 07:00:00' , 'SKT', '휴대폰 요금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C10', 700.00,  DATE 2025-08-25 01:01:00' , '휴대폰알림', '알림 서비스');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C01', 55000.00,  DATE 2025-08-24 14:35:00' , '고반식당', '가족 외식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 30000.00,  DATE 2025-08-24 12:13:00' , '카카오페이', '이체');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C10', 7890.00,  DATE 2025-08-24 10:18:00' , '쿠팡', '와우 멤버십');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 15000.00,  DATE 2025-08-23 19:31:00' , '구글', '앱/게임 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 8.00,  DATE 2025-08-23 05:09:00' , '은행', '이자', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 0.00,  DATE 2025-08-23 03:41:00' , '은행', '이자', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 0.00,  DATE 2025-08-23 02:48:00' , '세이프박스', '저축', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C06', 5000.00,  DATE 2025-08-22 21:05:00' , '약국', '약값');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C01', 18600.00,  DATE 2025-08-22 21:01:00' , '피자스쿨', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7000.00,  DATE 2025-08-22 13:19:00' , '뷔페', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 500000.00,  DATE 2025-08-22 10:03:00' , '정부지원', '국민취업지원금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C02', 2300.00,  DATE 2025-08-22 09:18:00' , '매머드커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C01', 34768.00,  DATE 2025-08-21 21:39:00' , '서일식자재', '식재료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'POINT', NULL, 'C01', 72.00,  DATE 2025-08-21 21:39:00' , '네이버페이', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C03', 84690.00,  DATE 2025-08-21 21:32:00' , '쿠팡', '온라인 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C11', 120000.00,  DATE 2025-08-21 19:39:00' , '김민샤', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'CARD', 'CHECK', 'C13', 2500.00,  DATE 2025-08-21 09:04:00' , 'KICC', '카드 수수료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 11080.00,  DATE 2025-08-20 20:18:00' , 'GS25', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12000.00,  DATE 2025-08-20 19:35:00' , '천화마라탕', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00,  DATE 2025-08-20 13:54:00' , '본래순대', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1800.00,  DATE 2025-08-20 09:23:00' , '세븐일레븐', '아침');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 4500.00,  DATE 2025-08-19 20:13:00' , '버거킹', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C01', 8600.00,  DATE 2025-08-19 19:54:00' , '버거킹', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7000.00,  DATE 2025-08-19 13:14:00' , '뷔페', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C13', 50000.00,  DATE 2025-08-19 09:17:00' , '카카오', '상품권 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3500.00,  DATE 2025-08-19 09:05:00' , '메가커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2900.00,  DATE 2025-08-19 09:02:00' , '이마트24', '아침');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2100.00,  DATE 2025-08-19 08:45:00' , 'GS25', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 81590.00,  DATE 2025-08-18 22:21:00' , '쿠팡', '온라인 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3900.00,  DATE 2025-08-18 18:57:00' , '맥도날드', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 11500.00,  DATE 2025-08-18 13:17:00' , '카카오페이', '송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C02', 2000.00,  DATE 2025-08-18 09:14:00' , '컴포즈커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C02', 15900.00,  DATE 2025-08-16 15:02:00' , '열시오븐', '빵');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4500.00,  DATE 2025-08-16 14:45:00' , '빽다방', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'TRANSFER', NULL, 'C08', 3000.00,  DATE 2025-08-16 14:43:00' , '토스', '전시회 관람료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 250000.00,  DATE 2025-08-16 14:39:00' , '김그래', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 3000.00,  DATE 2025-08-16 13:52:00' , '코인노래방', '취미');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 5740.00,  DATE 2025-08-16 13:35:00' , '쿠팡', '잡화');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C02', 7600.00,  DATE 2025-08-16 13:23:00' , '컴포즈커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-08-15 19:58:00' , '김맹고', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C13', 16700.00,  DATE 2025-08-15 13:01:00' , 'NICE', '기타 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3200.00,  DATE 2025-08-14 19:07:00' , 'CU', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U016', 'INCOME', 'TRANSFER', NULL, 'C13', 420.00,  DATE 2025-08-14 18:07:00' , '캐롯손보', '환급금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C10', 24360.00,  DATE 2025-08-14 16:17:00' , '한화손보', '보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4900.00,  DATE 2025-08-14 13:59:00' , '커피나인', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 20000.00,  DATE 2025-08-14 13:51:00' , '오한수우육면가', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U016', 'INCOME', 'TRANSFER', NULL, 'C13', 880.00,  DATE 2025-08-14 11:23:00' , '캐롯손보', '환급금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C02', 2250.00,  DATE 2025-08-14 09:14:00' , '바나프레소', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 9000.00,  DATE 2025-08-13 20:24:00' , '얼음땡', '게임');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-08-13 20:18:00' , '토스', '지인 송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C08', 10000.00,  DATE 2025-08-13 18:57:00' , '코인노래방', '취미');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C02', 2000.00,  DATE 2025-08-13 16:25:00' , '바나프레소', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U025', 'EXPENSE', 'TRANSFER', NULL, 'C12', 32000.00,  DATE 2025-08-13 15:59:00' , '서울시', '세금 납부', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-08-13 15:00:00' , '김억까', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C13', 2900.00,  DATE 2025-08-13 09:16:00' , 'NICE', '기타 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 9200.00,  DATE 2025-08-12 19:24:00' , 'GS25', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12500.00,  DATE 2025-08-12 13:23:00' , '미태리', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U016', 'INCOME', 'TRANSFER', NULL, 'C13', 23900.00,  DATE 2025-08-12 12:31:00' , '교통공사', 'K패스 환급금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C13', 4000.00,  DATE 2025-08-12 08:52:00' , 'NICE', '기타 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 39700.00,  DATE 2025-08-12 01:01:00' , '모바일티머니', '월 정산 버스비');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 35300.00,  DATE 2025-08-12 01:01:00' , '모바일티머니', '월 정산 지하철');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 13800.00,  DATE 2025-08-12 01:01:00' , '모바일티머니', '월 정산 통행료');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3600.00,  DATE 2025-08-11 18:59:00' , '맥도날드', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 221200.00,  DATE 2025-08-11 16:46:00' , '정부지원', '국민취업지원금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C13', 7000.00,  DATE 2025-08-11 13:43:00' , '테이', '지인 정산');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 14000.00,  DATE 2025-08-11 13:16:00' , '윤셰프갤러리', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 118630.00,  DATE 2025-08-11 09:13:00' , 'KT', '통신 요금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U011', 'EXPENSE', 'CARD', 'CHECK', 'C13', 3300.00,  DATE 2025-08-11 09:04:00' , 'NICE', '기타 결제');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 10000.00,  DATE 2025-08-11 08:52:00' , '만쥬킹', '간식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 15190.00,  DATE 2025-08-10 22:30:00' , 'GS25', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C10', 81820.00,  DATE 2025-08-10 09:11:00' , '한화손보', '차량 보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C02', 7600.00,  DATE 2025-08-09 19:50:00' , '컴포즈커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 11000.00,  DATE 2025-08-09 18:47:00' , '다이소', '생필품');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00,  DATE 2025-08-09 16:44:00' , 'PC방', '게임');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U008', 'EXPENSE', 'CARD', 'CHECK', 'C08', 2000.00,  DATE 2025-08-09 16:09:00' , '코인노래방', '취미');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'TRANSFER', NULL, 'C08', 2000.00,  DATE 2025-08-09 16:01:00' , '토스', '전시회 관람');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C13', 11500.00,  DATE 2025-08-09 15:53:00' , '카카오', '기프티콘 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-08-09 11:46:00' , '테이큰', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 0.00,  DATE 2025-08-09 00:47:00' , '무통식', '입금 내역', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 16600.00,  DATE 2025-08-08 20:50:00' , '버거킹', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-08-08 20:24:00' , '김안녕', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C02', 9100.00,  DATE 2025-08-08 14:16:00' , '컴포즈커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 10000.00,  DATE 2025-08-08 14:07:00' , '본래순대', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C03', 1900.00,  DATE 2025-08-08 09:15:00' , '카카오', '온라인 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3500.00,  DATE 2025-08-08 08:54:00' , '더벤티', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 6000.00,  DATE 2025-08-07 21:20:00' , '롯데리아', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3900.00,  DATE 2025-08-07 13:54:00' , '디저트39', '디저트');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9500.00,  DATE 2025-08-07 13:50:00' , '본래순대', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1800.00,  DATE 2025-08-07 09:01:00' , '코리아세븐', '아침');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3500.00,  DATE 2025-08-07 08:54:00' , '더벤티', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 4700.00,  DATE 2025-08-06 21:44:00' , '맥도날드', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'CARD', 'CHECK', 'C03', 36358.00,  DATE 2025-08-06 21:27:00' , '네이버파이낸셜', '온라인 쇼핑');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'POINT', NULL, 'C03', 442.00,  DATE 2025-08-06 21:26:00' , '네이버페이', '포인트 사용');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C01', 10000.00,  DATE 2025-08-06 18:36:00' , '감자탕', '저녁');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-08-06 14:22:00' , '김원탕', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'TRANSFER', NULL, 'C03', 30000.00,  DATE 2025-08-06 13:15:00' , 'G마켓', '잡화 구매');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C13', 30000.00,  DATE 2025-08-06 09:06:00' , '카카오', '선물하기');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C01', 4600.00,  DATE 2025-08-06 08:55:00' , '맥도날드', '아침');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3400.00,  DATE 2025-08-06 08:47:00' , 'PAYCO', '아침');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3300.00,  DATE 2025-08-05 21:50:00' , '맥도날드', '야식');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1800.00,  DATE 2025-08-05 19:14:00' , 'GS25', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 31391.00,  DATE 2025-08-05 18:47:00' , '삼성화재', '보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U025', 'EXPENSE', 'TRANSFER', NULL, 'C10', 41340.00,  DATE 2025-08-05 18:45:00' , 'DB손보', '차량 보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 137180.00,  DATE 2025-08-05 18:44:00' , '롯데손보', '장기 보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 29572.00,  DATE 2025-08-05 18:29:00' , '흥국생명', '보험료', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U017', 'EXPENSE', 'TRANSFER', NULL, 'C11', 11000.00,  DATE 2025-08-05 14:12:00' , '이*형', '정산 송금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C01', 22000.00,  DATE 2025-08-05 13:31:00' , '돈공', '점심 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3500.00,  DATE 2025-08-05 08:56:00' , '더벤티', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4220.00,  DATE 2025-08-04 22:27:00' , '세븐일레븐', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 3000.00,  DATE 2025-08-04 21:38:00' , '코인노래방', '취미');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C01', 14000.00,  DATE 2025-08-04 18:37:00' , '청담옥', '저녁 식사');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4900.00,  DATE 2025-08-04 13:18:00' , 'CU', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 274840.00,  DATE 2025-08-04 09:33:00' , '신한은행', '투자 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C06', 22340.00,  DATE 2025-08-04 09:31:00' , '신한은행', '의료비 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U019', 'EXPENSE', 'TRANSFER', NULL, 'C11', 203295.00,  DATE 2025-08-04 08:52:00' , '카카오페이', '신한은행 이체', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'TRANSFER', NULL, 'C13', 400000.00,  DATE 2025-08-04 08:52:00' , '카카오페이', '비상금 이체');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U004', 'INCOME', 'TRANSFER', NULL, 'C11', 203295.00,  DATE 2025-08-04 08:52:00' , '차두식', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 5000.00,  DATE 2025-08-03 18:45:00' , '카카오페이', '송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 5400.00,  DATE 2025-08-03 17:29:00' , '메가커피', '커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2300.00,  DATE 2025-08-03 17:26:00' , 'GS25', '편의점');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C11', 850000.00,  DATE 2025-08-03 17:21:00' , '김돈돈', '입금', 'OPEN_FIN');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C02', 12600.00,  DATE 2025-08-01 14:19:00' , '벤티프레소', '단체 커피');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 4000.00,  DATE 2025-08-01 13:35:00' , '파이어웍', '점심');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-08-01 13:28:00' , '카카오페이', '송금');

INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 1400.00,  DATE 2025-08-01 08:49:00' , 'PAYCO', '아침');

COMMIT;

-- ============================================================
--  DUMMY DATA: smaccount.LEDGER_ENTRY (100개 - Part 4)
--  2025년 7월 ~ 8월 실제 거래 내역 기반 (MySQL 문법 및 보안 처리)
--  참조: Group ID (1~10, Member ID (U001~U030, Category ID (C01~C13)
-- ============================================================

-- [1-10]: 2025-07-31 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 7590.00,  DATE 2025-07-31 20:02:00' , 'CU', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 18400.00,  DATE 2025-07-31 19:49:00' , '맛닭꼬', '저녁 치킨');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C10', 20490.00,  DATE 2025-07-31 18:30:00' , '라이나생명', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7000.00,  DATE 2025-07-31 13:16:00' , '윤셰프 갤러리', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'CARD', 'CREDIT', 'C11', 2000.00,  DATE 2025-07-31 09:18:00' , 'NICE결제대행', '카드 수수료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2000.00,  DATE 2025-07-30 20:14:00' , '맥도날드', '간식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-07-30 20:12:00' , '토스 지인', '지인 송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C03', 43824.00,  DATE 2025-07-30 20:10:00' , '모스트헤어', '미용실 비용');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'POINT', NULL, 'C03', 176.00,  DATE 2025-07-30 20:10:00' , '네이버페이', '포인트 사용');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00,  DATE 2025-07-30 13:18:00' , '산더미', '점심 식사');

-- [11-20]: 2025-07-29 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4720.00,  DATE 2025-07-29 19:14:00' , '코리아세븐', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C01', 26000.00,  DATE 2025-07-29 19:11:00' , '쿠팡이츠', '저녁 배달');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3500.00,  DATE 2025-07-29 19:09:00' , '맥도날드', '간식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1500.00,  DATE 2025-07-29 19:06:00' , '다이소', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3300.00,  DATE 2025-07-29 14:20:00' , '매머드커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9500.00,  DATE 2025-07-29 14:01:00' , '김가네', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U008', 'EXPENSE', 'CARD', 'CHECK', 'C05', 4800.00,  DATE 2025-07-29 01:01:00' , '모바일티머니', '택시비');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U008', 'EXPENSE', 'CARD', 'CHECK', 'C05', 4800.00,  DATE 2025-07-29 01:01:00' , '모바일티머니', '기타 교통비');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 2000.00,  DATE 2025-07-28 22:19:00' , '토스 지인', '지인 송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 72700.00,  DATE 2025-07-28 10:08:00' , '인터넷상거래', '가전제품 구매');

-- [21-30]: 2025-07-27 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U005', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3000.00,  DATE 2025-07-27 16:08:00' , '세븐일레븐', '휴게소 간식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U005', 'EXPENSE', 'CARD', 'CHECK', 'C08', 3000.00,  DATE 2025-07-27 16:01:00' , '행담도휴게소', '기타 간식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C03', 19100.00,  DATE 2025-07-27 14:19:00' , '쿠팡', '온라인 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C03', 3960.00,  DATE 2025-07-27 13:56:00' , '올리브영', '화장품 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C01', 6500.00,  DATE 2025-07-27 13:50:00' , 'PAYCO오더', '배달 점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C03', 32947.00,  DATE 2025-07-26 23:30:00' , '브라더커머스', '온라인 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C02', 11000.00,  DATE 2025-07-26 17:48:00' , '카페리브레', '단체 커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 8.00,  DATE 2025-07-26 05:19:00' , '은행', '이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 0.00,  DATE 2025-07-26 03:48:00' , '은행', '이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 0.00,  DATE 2025-07-26 02:53:00' , '세이프박스', '저축 이체', 'OPEN_FIN');

-- [31-40]: 2025-07-25 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 36100.00,  DATE 2025-07-25 21:00:00' , '쿠팡이츠', '저녁 배달');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 6100.00,  DATE 2025-07-25 20:43:00' , '중앙할인마트', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C03', 19000.00,  DATE 2025-07-25 20:20:00' , '올리브영', '화장품 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 20000.00,  DATE 2025-07-25 18:54:00' , '코인노래방', '취미');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 642120.00,  DATE 2025-07-25 18:47:00' , 'KB카드', '카드대금 납부', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 346354.00,  DATE 2025-07-25 18:47:00' , '삼성카드', '카드대금 납부', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 63610.00,  DATE 2025-07-25 18:35:00' , '학자금재단', '대출 이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U027', 'EXPENSE', 'TRANSFER', NULL, 'C11', 33000.00,  DATE 2025-07-25 17:02:00' , '토스 지인', '그룹 회비 정산');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00,  DATE 2025-07-25 13:18:00' , '산더미', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00,  DATE 2025-07-25 13:18:00' , '산더미', '점심 식사');

-- [41-50]: 2025-07-25, 2025-07-24 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C02', 2300.00,  DATE 2025-07-25 09:22:00' , '매머드커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C13', 30000.00,  DATE 2025-07-25 09:12:00' , '카카오', '상품권 선물');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 34830.00,  DATE 2025-07-25 07:15:00' , '한화손보', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C10', 700.00,  DATE 2025-07-25 01:01:00' , '휴대폰알림서비스', '알림 서비스');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C02', 7600.00,  DATE 2025-07-24 20:49:00' , '컴포즈커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C10', 9900.00,  DATE 2025-07-24 19:06:00' , '구글페이먼트', '앱 구독료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 5600.00,  DATE 2025-07-24 13:19:00' , 'CU', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C10', 7890.00,  DATE 2025-07-24 10:18:00' , '쿠팡', '와우 멤버십');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3600.00,  DATE 2025-07-23 21:47:00' , '맥도날드', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U029', 'INCOME', 'TRANSFER', NULL, 'C11', 50000.00,  DATE 2025-07-23 21:03:00' , '지인', '입금', 'OPEN_FIN');

-- [51-60]: 2025-07-23 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C08', 15000.00,  DATE 2025-07-23 19:31:00' , '구글페이먼트', '앱 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 7900.00,  DATE 2025-07-23 18:56:00' , '한솥', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 57720.00,  DATE 2025-07-23 18:25:00' , '학자금재단', '대출 이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-07-23 12:39:00' , '카카오페이', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 6700.00,  DATE 2025-07-23 10:41:00' , '메가커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U025', 'EXPENSE', 'TRANSFER', NULL, 'C10', 36690.00,  DATE 2025-07-23 07:00:00' , 'SKT', '휴대폰 요금', 'OPEN_FIN');

-- [61-70]: 2025-07-22 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-07-22 21:10:00' , '지인', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 8900.00,  DATE 2025-07-22 20:32:00' , '맥도날드', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'INCOME', 'TRANSFER', NULL, 'C11', 7500.00,  DATE 2025-07-22 19:07:00' , '카카오페이', '정산');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'INCOME', 'TRANSFER', NULL, 'C11', 12900.00,  DATE 2025-07-22 13:19:00' , '카카오페이', '정산');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 31700.00,  DATE 2025-07-22 13:18:00' , '고칸', '팀 점심');

-- [71-80]: 2025-07-21, 2025-07-20 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 7200.00,  DATE 2025-07-21 21:29:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C11', 50000.00,  DATE 2025-07-21 21:14:00' , '지인', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-07-21 21:08:00' , '토스 지인', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U009', 'EXPENSE', 'CARD', 'CREDIT', 'C13', 2300.00,  DATE 2025-07-21 16:26:00' , 'KCP', '결제 대행');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C07', 9700.00,  DATE 2025-07-21 14:31:00' , '원서접수', '시험 접수비');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 7000.00,  DATE 2025-07-21 13:16:00' , '윤셰프 갤러리', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 6500.00,  DATE 2025-07-20 21:38:00' , '바른농산물', '식재료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C05', 15000.00,  DATE 2025-07-20 19:54:00' , '티머니GO', '교통비');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 47500.00,  DATE 2025-07-20 19:29:00' , '커피', '단체 주문');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 10000.00,  DATE 2025-07-20 19:15:00' , '포토랩', '사진 촬영');

-- [81-90]: 2025-07-20, 2025-07-19 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 66600.00,  DATE 2025-07-20 18:33:00' , '잭슨빌타운', '저녁 외식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C04', 8900.00,  DATE 2025-07-20 16:41:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U001', 'EXPENSE', 'CARD', 'CHECK', 'C08', 9500.00,  DATE 2025-07-20 15:28:00' , '스마틱스', '공연 관람료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C02', 16000.00,  DATE 2025-07-20 13:47:00' , '컴포즈커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 10000.00,  DATE 2025-07-19 22:15:00' , '얼음땡', '게임비');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U015', 'EXPENSE', 'TRANSFER', NULL, 'C11', 37100.00,  DATE 2025-07-19 19:22:00' , '저축계좌', '야식비 저축');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U015', 'EXPENSE', 'TRANSFER', NULL, 'C11', 50500.00,  DATE 2025-07-19 19:21:00' , '투자계좌', '점심비 투자');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 15310.00,  DATE 2025-07-19 18:42:00' , '홈마트', '식재료 및 생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 50500.00,  DATE 2025-07-19 12:11:00' , '쿠팡이츠', '점심 단체 배달');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C01', 44570.00,  DATE 2025-07-18 21:02:00' , '쿠팡이츠', '저녁 배달');

-- [91-100]: 2025-07-18, 2025-07-17 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12400.00,  DATE 2025-07-18 19:03:00' , '니뽕내뽕', '저녁 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C03', 55500.00,  DATE 2025-07-18 14:10:00' , '쿠팡', '온라인 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 15500.00,  DATE 2025-07-18 13:18:00' , '파이어웍', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 6900.00,  DATE 2025-07-17 21:40:00' , '코리아세븐', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'INCOME', 'TRANSFER', NULL, 'C11', 50000.00,  DATE 2025-07-17 21:04:00' , '지인', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9500.00,  DATE 2025-07-17 19:14:00' , '블랙국밥', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4700.00,  DATE 2025-07-17 13:19:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-07-17 11:43:00' , '카카오페이', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'TRANSFER', NULL, 'C03', 10000.00,  DATE 2025-07-17 10:50:00' , 'G마켓', '잡화 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 29900.00,  DATE 2025-07-16 23:13:00' , '퀸잇', '온라인 의류');

COMMIT;

-- ============================================================
--  DUMMY DATA: smaccount.LEDGER_ENTRY (100개 - Part 5)
--  2025년 6월 ~ 7월 실제 거래 내역 기반 (MySQL 문법 및 보안 처리)
--  참조: Group ID (1~10, Member ID (U001~U030, Category ID (C01~C13)
-- ============================================================

-- [1-10]: 2025-07-16 ~ 2025-07-15 내역 (이전 누락분 보충)
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 9000.00,  DATE 2025-07-16 14:34:00' , '카카오페이', '정산 송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'EXPENSE', 'TRANSFER', NULL, 'C11', 9000.00,  DATE 2025-07-16 14:34:00' , '카카오페이', '정산 송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 9000.00,  DATE 2025-07-16 13:18:00' , '토스 지인', '지인 송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 36000.00,  DATE 2025-07-16 13:17:00' , '산더미', '팀 점심 회식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-07-15 21:07:00' , '지인', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'TRANSFER', NULL, 'C08', 2000.00,  DATE 2025-07-15 19:26:00' , '토스', '전시 관람료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C02', 9500.00,  DATE 2025-07-15 19:22:00' , '클로렐라베이커리', '빵 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2500.00,  DATE 2025-07-15 19:19:00' , '추억김밥', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C01', 5300.00,  DATE 2025-07-15 14:18:00' , '얌샘김밥', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C03', 15000.00,  DATE 2025-07-15 13:53:00' , '마리오쇼핑', '온라인 쇼핑');

-- [11-20]: 2025-07-14 ~ 2025-07-12 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 8800.00,  DATE 2025-07-14 20:18:00' , '메가커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 7360.00,  DATE 2025-07-14 20:13:00' , '이마트 에브리데이', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7000.00,  DATE 2025-07-14 13:19:00' , '윤셰프 갤러리', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C04', 5260.00,  DATE 2025-07-12 15:28:00' , '홈마트', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4000.00,  DATE 2025-07-12 14:47:00' , '메가커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 28450.00,  DATE 2025-07-12 01:01:00' , '모바일티머니', '월 정산 지하철');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 44250.00,  DATE 2025-07-12 01:01:00' , '모바일티머니', '월 정산 버스');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 0.00,  DATE 2025-07-12 00:46:00' , '무통식', '입금 내역', 'OPEN_FIN');

-- [21-30]: 2025-07-11 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 55000.00,  DATE 2025-07-11 21:16:00' , '카카오페이', '이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U028', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-07-11 21:10:00' , '지인', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 11200.00,  DATE 2025-07-11 21:04:00' , '중앙할인마트', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C13', 1500.00,  DATE 2025-07-11 20:44:00' , 'ARS 결제', '기타');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U008', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00,  DATE 2025-07-11 19:45:00' , '코인노래방', '취미');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00,  DATE 2025-07-11 19:22:00' , '코인노래방', '취미');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 17600.00,  DATE 2025-07-11 10:42:00' , 'KT', '인터넷 요금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 104880.00,  DATE 2025-07-11 10:16:00' , 'KT', '휴대폰 요금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C01', 4500.00,  DATE 2025-07-11 09:03:00' , 'PAYCO오더', '아침 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1700.00,  DATE 2025-07-10 22:05:00' , 'CU', '편의점');

-- [31-40]: 2025-07-10 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C02', 20700.00,  DATE 2025-07-10 13:55:00' , '매머드커피', '단체 커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7000.00,  DATE 2025-07-10 13:23:00' , '윤셰프 갤러리', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U002', 'INCOME', 'TRANSFER', NULL, 'C05', 19310.00,  DATE 2025-07-10 12:30:00' , '교통공사', 'K패스 환급금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C10', 91450.00,  DATE 2025-07-10 09:25:00' , '한화손보', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 19000.00,  DATE 2025-07-09 22:14:00' , '영화관', '영화 관람');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7000.00,  DATE 2025-07-09 13:17:00' , '윤셰프 갤러리', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'TRANSFER', NULL, 'C03', 10000.00,  DATE 2025-07-09 09:27:00' , 'G마켓', '잡화 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 1.00,  DATE 2025-07-09 09:26:00' , '은행', '테스트 입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 6100.00,  DATE 2025-07-08 19:27:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2500.00,  DATE 2025-07-08 19:22:00' , '김밥사랑', '저녁');

-- [51-60]: 2025-07-08 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U006', 'EXPENSE', 'CARD', 'CHECK', 'C10', 65750.00,  DATE 2025-07-08 15:54:00' , '한화손보', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7900.00,  DATE 2025-07-08 13:18:00' , '고칸', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C03', 1900.00,  DATE 2025-07-08 09:16:00' , '카카오', '온라인 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-07-08 09:16:00' , '신한은행', '카카오페이 충전', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U026', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-07-08 09:16:00' , '김태우', '카카오페이 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 21390.00,  DATE 2025-07-08 08:53:00' , '쿠팡', '야간 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 1800.00,  DATE 2025-07-07 19:17:00' , '패스트푸드', '저녁 간식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 31391.00,  DATE 2025-07-07 18:47:00' , '삼성화재', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U014', 'EXPENSE', 'TRANSFER', NULL, 'C10', 41340.00,  DATE 2025-07-07 18:45:00' , 'DB손보', '차량 보험', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U006', 'EXPENSE', 'TRANSFER', NULL, 'C11', 137180.00,  DATE 2025-07-07 18:44:00' , '롯데손보', '장기 보험료', 'OPEN_FIN');

-- [61-70]: 2025-07-07, 2025-07-05 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 29572.00,  DATE 2025-07-07 18:29:00' , '흥국', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4800.00,  DATE 2025-07-07 13:42:00' , '컴포즈커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7000.00,  DATE 2025-07-07 13:15:00' , '윤셰프 갤러리', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2700.00,  DATE 2025-07-07 09:24:00' , 'CU', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 6300.00,  DATE 2025-07-07 08:57:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 16220.00,  DATE 2025-07-05 13:49:00' , '세븐일레븐', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3800.00,  DATE 2025-07-05 13:34:00' , '컴포즈커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C02', 10000.00,  DATE 2025-07-05 13:28:00' , '빽다방', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C03', 8000.00,  DATE 2025-07-05 12:10:00' , '미용실', '미용 용품');

-- [71-80]: 2025-07-04 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-07-04 21:10:00' , '카카오페이', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3000.00,  DATE 2025-07-04 19:49:00' , '맥도날드', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00,  DATE 2025-07-04 13:19:00' , '산더미', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C03', 9626.00,  DATE 2025-07-04 09:18:00' , '헤어숍', '미용 용품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'POINT', NULL, 'C03', 374.00,  DATE 2025-07-04 09:18:00' , '네이버페이', '포인트 사용');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 400000.00,  DATE 2025-07-04 09:15:00' , '카카오페이', '비상금 이체');

-- [81-90]: 2025-07-03, 2025-07-02, 2025-07-01 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1500.00,  DATE 2025-07-03 22:03:00' , '베이커리', '간식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7000.00,  DATE 2025-07-03 13:16:00' , '윤셰프 갤러리', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2700.00,  DATE 2025-07-03 09:26:00' , 'CU', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 12000.00,  DATE 2025-07-02 20:54:00' , '다이소', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7000.00,  DATE 2025-07-02 13:18:00' , '윤셰프 갤러리', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C03', 21840.00,  DATE 2025-07-01 19:55:00' , '쿠팡', '온라인 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4400.00,  DATE 2025-07-01 19:08:00' , '메가커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'TRANSFER', NULL, 'C08', 3000.00,  DATE 2025-07-01 19:02:00' , '토스', '전시회 관람료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7500.00,  DATE 2025-07-01 13:20:00' , '까사미아푸드', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'TRANSFER', NULL, 'C11', 274840.00,  DATE 2025-07-01 09:32:00' , '지인', '이체');

-- [91-100]: 2025-07-01 ~ 2025-06-30 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 4091380.00,  DATE 2025-07-01 09:03:00' , '신한', '퇴직연금 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C03', 11900.00,  DATE 2025-07-01 00:10:00' , '쿠팡', '야간 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-06-30 22:36:00' , '카카오페이', '비상금 이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 80146.00,  DATE 2025-06-30 22:36:00' , '김범수', '카카오페이 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 80146.00,  DATE 2025-06-30 22:36:00' , '신한은행', '카카오페이 이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1700.00,  DATE 2025-06-30 21:10:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'INCOME', 'TRANSFER', NULL, 'C11', 10900.00,  DATE 2025-06-30 18:55:00' , '카카오페이', '정산');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'INCOME', 'TRANSFER', NULL, 'C11', 8900.00,  DATE 2025-06-30 18:55:00' , '카카오페이', '정산');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 29700.00,  DATE 2025-06-30 18:54:00' , '고칸', '팀 저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C10', 20490.00,  DATE 2025-06-30 18:33:00' , '라이나생명', '보험료', 'OPEN_FIN');

COMMIT;

-- ============================================================
--  DUMMY DATA: smaccount.LEDGER_ENTRY (80개 - Part 6)
--  2025년 6월 1일 ~ 6월 29일 실제 거래 내역 기반 (MySQL 문법 및 보안 처리)
--  참조: Group ID (1~10, Member ID (U001~U030, Category ID (C01~C13)
-- ============================================================

-- [1-10]: 2025-06-30 ~ 2025-06-27 내역 (이전 파트에서 누락된 6월분)
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7000.00,  DATE 2025-06-30 13:19:00' , '윤셰프 갤러리', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-06-30 10:47:00' , '지인', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 0.00,  DATE 2025-06-29 10:19:00' , '자립예탁금', '입금 내역', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U006', 'INCOME', 'TRANSFER', NULL, 'C11', 5.00,  DATE 2025-06-28 05:11:00' , '은행', '이자 수입', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U006', 'INCOME', 'TRANSFER', NULL, 'C11', 1.00,  DATE 2025-06-28 03:43:00' , '은행', '이자 수입', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U006', 'EXPENSE', 'TRANSFER', NULL, 'C11', 84.00,  DATE 2025-06-28 02:44:00' , '세이프박스', '정기 이자 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 671126.00,  DATE 2025-06-27 22:06:00' , 'KB카드', '카드대금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C11', 700000.00,  DATE 2025-06-27 22:05:00' , '토스 김현수', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U028', 'EXPENSE', 'CARD', 'CHECK', 'C02', 6200.00,  DATE 2025-06-27 21:22:00' , '컴포즈커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7000.00,  DATE 2025-06-27 13:21:00' , '윤셰프 갤러리', '점심 식사');

-- [11-20]: 2025-06-26 ~ 2025-06-25 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C03', 32947.00,  DATE 2025-06-26 23:30:00' , '브라더커머스', '온라인 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U011', 'EXPENSE', 'CARD', 'CHECK', 'C04', 8000.00,  DATE 2025-06-26 19:16:00' , '중앙할인마트', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 1500.00,  DATE 2025-06-26 18:56:00' , '피자', '저녁 간식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 7500.00,  DATE 2025-06-26 13:17:00' , '까사미아푸드', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 8500.00,  DATE 2025-06-25 18:57:00' , '라밥', '저녁 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 643087.00,  DATE 2025-06-25 18:48:00' , 'KB카드', '카드대금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 857154.00,  DATE 2025-06-25 18:47:00' , '삼성카드', '카드대금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 63610.00,  DATE 2025-06-25 18:35:00' , '학자금재단', '대출 이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-06-25 16:48:00' , '이수', '정산 송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U012', 'INCOME', 'CARD', 'CREDIT', 'C13', 1359.00,  DATE 2025-06-25 14:24:00' , '구글', '환불');

-- [21-30]: 2025-06-25 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2700.00,  DATE 2025-06-25 14:01:00' , 'CU', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 7000.00,  DATE 2025-06-25 13:20:00' , '윤셰프 갤러리', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 1480700.00,  DATE 2025-06-25 08:00:00' , '회사', '급여', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C10', 33417.00,  DATE 2025-06-25 07:13:00' , '한화손보', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U011', 'EXPENSE', 'CARD', 'CREDIT', 'C13', 1359.00,  DATE 2025-06-25 05:21:00' , '구글', '결제 취소');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U012', 'EXPENSE', 'CARD', 'CREDIT', 'C13', 0.00,  DATE 2025-06-25 01:14:00' , '구글', '임시 승인');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 7500.00,  DATE 2025-06-24 13:19:00' , '까사미아푸드', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C10', 7890.00,  DATE 2025-06-24 10:18:00' , '쿠팡', '와우 멤버십');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C10', 700.00,  DATE 2025-06-24 01:01:00' , '휴대폰알림서비스', '알림 서비스');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 7900.00,  DATE 2025-06-23 19:19:00' , 'GS25', '편의점');

-- [31-40]: 2025-06-23 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 57720.00,  DATE 2025-06-23 18:27:00' , '학자금재단', '대출 이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 7500.00,  DATE 2025-06-23 13:21:00' , '까사미아푸드', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-06-23 11:43:00' , '카카오페이', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U013', 'EXPENSE', 'TRANSFER', NULL, 'C10', 36690.00,  DATE 2025-06-23 07:04:00' , 'SKT', '휴대폰 요금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2300.00,  DATE 2025-06-21 19:32:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 134.00,  DATE 2025-06-21 02:55:00' , '신한은행', '이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 18500.00,  DATE 2025-06-20 20:54:00' , '쿠팡이츠', '저녁 배달');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U029', 'INCOME', 'TRANSFER', NULL, 'C11', 152809.00,  DATE 2025-06-20 18:01:00' , '최민수', '카카오페이 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 152809.00,  DATE 2025-06-20 18:01:00' , '카카오페이', '계좌 이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 7900.00,  DATE 2025-06-20 13:20:00' , '고칸', '점심 식사');

-- [41-50]: 2025-06-20 ~ 2025-06-18 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C04', 2300.00,  DATE 2025-06-20 09:07:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'EXPENSE', 'TRANSFER', NULL, 'C11', 69440.00,  DATE 2025-06-19 20:01:00' , '토스', '투자금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4300.00,  DATE 2025-06-19 19:21:00' , 'CU', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9800.00,  DATE 2025-06-19 18:56:00' , '맘스터치', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 7500.00,  DATE 2025-06-19 13:20:00' , '까사미아푸드', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 4950.00,  DATE 2025-06-19 07:04:00' , '카카오', '이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7500.00,  DATE 2025-06-18 13:20:00' , '까사미아푸드', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 45000.00,  DATE 2025-06-18 07:31:00' , '카카오', '저축 이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 12510.00,  DATE 2025-06-18 07:31:00' , '카카오', '저축 이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 5310.00,  DATE 2025-06-18 07:31:00' , '카카오', '저축 이체', 'OPEN_FIN');

-- [51-60]: 2025-06-17 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U001', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 15700.00,  DATE 2025-06-17 21:07:00' , '중앙할인마트', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 8700.00,  DATE 2025-06-17 19:37:00' , '버거킹', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 10000.00,  DATE 2025-06-17 18:51:00' , '코인노래방', '취미');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U028', 'EXPENSE', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-06-17 17:12:00' , '토스 김현수', '이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 7500.00,  DATE 2025-06-17 13:23:00' , '까사미아푸드', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 14130.00,  DATE 2025-06-17 08:31:00' , '카카오', '저축 이자', 'OPEN_FIN');

-- [61-70]: 2025-06-16 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 20810.00,  DATE 2025-06-16 20:58:00' , '쿠팡', '온라인 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 7800.00,  DATE 2025-06-16 18:58:00' , '맥도날드', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 3200.00,  DATE 2025-06-16 13:23:00' , 'CU', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C13', 15500.00,  DATE 2025-06-16 09:11:00' , '팔형지', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'INCOME', 'TRANSFER', NULL, 'C13', 36000.00,  DATE 2025-06-16 08:15:00' , '다정히', '입금');

-- [71-80]: 2025-06-15 ~ 2025-06-13 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C13', 31000.00,  DATE 2025-06-15 17:38:00' , '박세종', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 31000.00,  DATE 2025-06-15 16:05:00' , '카카오페이', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'INCOME', 'TRANSFER', NULL, 'C11', 15500.00,  DATE 2025-06-15 16:05:00' , '카카오페이', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 15500.00,  DATE 2025-06-15 14:03:00' , '장범준', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'INCOME', 'TRANSFER', NULL, 'C13', 15000.00,  DATE 2025-06-14 20:12:00' , '오구형', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U030', 'INCOME', 'TRANSFER', NULL, 'C13', 99999.00,  DATE 2025-06-14 19:47:00' , '김민규', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 21500.00,  DATE 2025-06-14 18:31:00' , '쿠팡이츠', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C03', 26600.00,  DATE 2025-06-14 10:47:00' , '카카오', '온라인 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 0.00,  DATE 2025-06-14 00:54:00' , '무통식', '입금 내역', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 159000.00,  DATE 2025-06-13 21:11:00' , '골뱅이', '저녁 외식');

-- [81-90]: 2025-06-13 ~ 2025-06-11 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4100.00,  DATE 2025-06-13 13:37:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U002', 'INCOME', 'TRANSFER', NULL, 'C05', 17960.00,  DATE 2025-06-13 11:59:00' , '교통공사', 'K패스 환급금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 18690.00,  DATE 2025-06-13 08:38:00' , '올리브영', '화장품 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 33100.00,  DATE 2025-06-12 23:23:00' , '카카오페이', '이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U029', 'INCOME', 'TRANSFER', NULL, 'C11', 33100.00,  DATE 2025-06-12 23:23:00' , '김*형', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2500.00,  DATE 2025-06-12 20:06:00' , '피자', '간식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 15000.00,  DATE 2025-06-12 14:00:00' , '남경반점', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U015', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-06-12 11:44:00' , '이준기', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 31450.00,  DATE 2025-06-12 01:01:00' , '모바일티머니', '월 정산 버스비');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 34500.00,  DATE 2025-06-12 01:01:00' , '모바일티머니', '월 정산 지하철');

-- [91-100]: 2025-06-12 ~ 2025-06-11 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 9200.00,  DATE 2025-06-12 01:01:00' , '모바일티머니', '월 정산 통행료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 8000.00,  DATE 2025-06-11 20:21:00' , '순대국', '저녁 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 11000.00,  DATE 2025-06-11 14:05:00' , '이*형', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-06-11 14:05:00' , '채치수', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00,  DATE 2025-06-11 14:03:00' , '미소야', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U013', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 35200.00,  DATE 2025-06-11 09:37:00' , 'KT', '인터넷 요금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 90770.00,  DATE 2025-06-11 09:11:00' , 'KT', '휴대폰 요금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 2000.00,  DATE 2025-06-11 08:49:00' , '메가커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3500.00,  DATE 2025-06-10 20:05:00' , '맥도날드', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U016', 'INCOME', 'TRANSFER', NULL, 'C13', 5550.00,  DATE 2025-06-10 14:29:00' , '캐롯손보', '환급금', 'OPEN_FIN');

COMMIT;

-- ============================================================
--  DUMMY DATA: smaccount.LEDGER_ENTRY (6월 1일 ~ 11일 내역, 39개)
--  MySQL 문법 (smaccount. 접두사 적용 및 연예인 이름 대체)
-- ============================================================

-- Group 2 (U003, U004) - 금융/쇼핑/이체
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'TRANSFER', NULL, 'C11', 11000.00,  DATE 2025-06-11 14:05:00' , '윈터', '정산 송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-06-11 14:05:00' , '카리나', '정산 송금');

-- Group 4 (U030) - 교육/카페
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 2000.00,  DATE 2025-06-11 08:49:00' , '메가커피', '커피');

-- Group 5 (U029) - 식비
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3500.00,  DATE 2025-06-10 20:05:00' , '맥도날드', '저녁');

-- Group 3 (U018, U005) - 금융/보험
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 5550.00,  DATE 2025-06-10 14:29:00' , '캐롯손보', '보험 환급금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C10', 31391.00,  DATE 2025-06-10 14:27:00' , '삼성화재', '보험료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 26092.00,  DATE 2025-06-10 14:07:00' , '데스코', '저축 이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'EXPENSE', 'CARD', 'CHECK', 'C10', 72480.00,  DATE 2025-06-10 09:41:00' , '한화손보', '보험료');

-- Group 6 (U025, U027) - 식비
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9500.00,  DATE 2025-06-10 13:43:00' , '사이공본가', '점심 식사');

-- Group 5 (U020) - 식비
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 7600.00,  DATE 2025-06-09 20:42:00' , 'GS25', '편의점');

-- Group 1 (U016, U018) - 생활/식비
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 16800.00,  DATE 2025-06-09 20:36:00' , 'GS25', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3500.00,  DATE 2025-06-09 20:30:00' , '과일가게', '과일 구매');

-- Group 9 (U024, U007) - 취미/게임
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 2500.00,  DATE 2025-06-09 16:54:00' , 'PC방', '게임');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00,  DATE 2025-06-09 16:36:00' , 'PC방', '게임');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U008', 'EXPENSE', 'TRANSFER', NULL, 'C08', 2000.00,  DATE 2025-06-09 16:31:00' , '토스 김명호', '전시 관람');

-- Group 5 (U020) - 식비/카페
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 1500.00,  DATE 2025-06-09 16:21:00' , '디트로이트피자', '점심');

-- Group 8 (U002, U023) - 여가/취미
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C08', 11400.00,  DATE 2025-06-09 14:39:00' , '설빙', '디저트');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C08', 9100.00,  DATE 2025-06-09 14:36:00' , '만화카페', '이용료');

-- Group 9 (U024) - 식비
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3700.00,  DATE 2025-06-09 12:35:00' , '맥도날드', '점심');

-- Group 1 (U016) - 의료/세금
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C06', 277038.00,  DATE 2025-06-09 10:20:00' , '건강보험공단', '건강보험료');

-- Group 8 (U023) - 기타
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (8, 'U023', 'INCOME', 'TRANSFER', NULL, 'C13', 0.00,  DATE 2025-06-08 07:19:00' , '은행', '이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C05', 1900.00,  DATE 2025-06-08 01:01:00' , '모바일티머니', '기타 교통');

-- Group 5 (U020) - 식비/카페
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3500.00,  DATE 2025-06-07 14:46:00' , '간편결제', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-06-07 14:45:00' , '카카오페이', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C02', 48300.00,  DATE 2025-06-07 14:40:00' , '열시오븐', '빵 대량 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00,  DATE 2025-06-05 19:10:00' , '피자', '저녁');

-- Group 3 (U018) - 금융
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 29572.00,  DATE 2025-06-05 18:31:00' , '흥국', '보험료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C10', 137180.00,  DATE 2025-06-05 18:50:00' , '롯데손보', '장기 보험료', 'OPEN_FIN');

-- Group 10 (U025) - 차량/보험
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U025', 'EXPENSE', 'TRANSFER', NULL, 'C10', 41340.00,  DATE 2025-06-05 18:50:00' , 'DB손보', '차량 보험');

-- Group 2 (U017) - 카페/디저트
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 11100.00,  DATE 2025-06-05 18:31:00' , '쥬씨', '커피');

-- Group 6 (U021) - 카페
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3300.00,  DATE 2025-06-06 18:30:00' , '메가커피', '커피');

-- Group 3 (U018, U005) - 이체/금융
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 60000.00,  DATE 2025-06-04 09:40:00' , '한효주', '송금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 40000.00,  DATE 2025-06-04 09:39:00' , '카뱅', '이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 40000.00,  DATE 2025-06-04 09:39:00' , '김민지', '입금', 'OPEN_FIN');

-- Group 1 (U016) - 쇼핑
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 19800.00,  DATE 2025-06-04 16:38:00' , 'KS넷', '온라인 쇼핑');

-- Group 9 (U024) - 취미
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C08', 3000.00,  DATE 2025-06-04 19:29:00' , '코인노래방', '취미');

-- Group 8 (U023) - 취미
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00,  DATE 2025-06-01 18:50:00' , '단체', '여가활동');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C08', 25300.00,  DATE 2025-06-01 16:10:00' , 'Gaudi', '전시회 관람');

-- Group 5 (U020) - 식비/카페
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 6000.00,  DATE 2025-06-05 19:10:00' , '피자', '저녁');

-- Group 7 (U022) - 디저트/카페
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C02', 5300.00,  DATE 2025-06-02 14:34:00' , '투썸플레이스', '커피');

COMMIT;

-- ============================================================
--  DUMMY DATA: smaccount.LEDGER_ENTRY (86개 - 5월 1일 ~ 31일)
--  MySQL 문법 (smaccount. 접두사 적용 및 연예인 이름 대체)
--  참조: Group ID (1~10, Member ID (U001~U030, Category ID (C01~C13)
-- ============================================================

-- Group 9 (U024) - 취미
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 2000.00,  DATE 2025-05-31 23:30:00' , '코인노래방', '취미');

-- Group 5 (U020) - 식비
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3500.00,  DATE 2025-05-31 13:39:00' , '명품달인김밥', '점심');

-- Group 3 (U018) - 금융
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 88000.00,  DATE 2025-05-31 13:32:00' , '네이버파이낸셜', '대출금 상환');

-- Group 1 (U016) - 생활/차량
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 4000.00,  DATE 2025-05-30 23:32:00' , 'CU', '간식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C05', 50000.00,  DATE 2025-05-30 23:04:00' , '광생주유소', '주유');

-- Group 2 (U017) - 식비
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 34000.00,  DATE 2025-05-30 20:21:00' , '곱분이곱창', '저녁 외식');

-- Group 3 (U018) - 금융
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-05-30 19:18:00' , '토스 박보검', '입금', 'OPEN_FIN');

-- Group 6 (U027) - 식비
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 11500.00,  DATE 2025-05-29 12:36:00' , '백소정', '점심 식사');

-- Group 6 (U025) - 식비
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 20000.00,  DATE 2025-05-28 13:14:00' , '더 든든', '점심 식사');

-- Group 3 (U018) - 금융
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-05-28 09:40:00' , '토스 박보검', '입금', 'OPEN_FIN');

-- Group 2 (U019) - 금융/쇼핑
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U019', 'EXPENSE', 'TRANSFER', NULL, 'C11', 35821.00,  DATE 2025-05-27 15:26:00' , '카카오페이', '이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U019', 'INCOME', 'TRANSFER', NULL, 'C11', 35821.00,  DATE 2025-05-27 15:26:00' , '토스 박보검', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'TRANSFER', NULL, 'C03', 25000.00,  DATE 2025-05-27 14:02:00' , '당근페이', '중고거래 구매');

-- Group 6 (U029) - 식비
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 3800.00,  DATE 2025-05-27 13:04:00' , '한솥도시락', '점심 식사');

-- Group 4 (U030) - 카페
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1600.00,  DATE 2025-05-27 08:09:00' , '나이스페이', '커피');

-- [16-30]: 2025-05-26 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C03', 32947.00,  DATE 2025-05-26 23:30:00' , '브라더커머스', '온라인 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'POINT', NULL, 'C03', 159.00,  DATE 2025-05-26 23:30:00' , '네이버페이', '포인트 사용');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 2600.00,  DATE 2025-05-26 22:18:00' , '키오스크', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 12490.00,  DATE 2025-05-26 22:17:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 934277.00,  DATE 2025-05-26 18:51:00' , '삼성카드', '카드대금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 1233190.00,  DATE 2025-05-26 18:49:00' , 'KB카드', '카드대금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3500.00,  DATE 2025-05-26 18:39:00' , '과일가게', '식재료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 63610.00,  DATE 2025-05-26 18:37:00' , '학자금재단', '대출 이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1700.00,  DATE 2025-05-26 18:33:00' , '이마트24', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C04', 5400.00,  DATE 2025-05-26 18:23:00' , 'GS25', '편의점');

-- [31-40]: 2025-05-26 ~ 2025-05-23 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3200.00,  DATE 2025-05-26 18:08:00' , '맥도날드', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 33417.00,  DATE 2025-05-26 07:13:00' , '한화손보', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C10', 700.00,  DATE 2025-05-26 01:01:00' , '휴대폰알림서비스', '알림');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'EXPENSE', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-05-25 23:45:00' , '쿠팡', '충전 이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 29900.00,  DATE 2025-05-25 23:33:00' , '인터넷상거래', '온라인 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 10000.00,  DATE 2025-05-24 19:45:00' , '닭강정', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 3500.00,  DATE 2025-05-24 19:40:00' , '클로렐라베이커리', '빵');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U015', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-05-24 19:19:00' , '카카오페이', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C10', 7890.00,  DATE 2025-05-24 10:17:00' , '쿠팡', '와우 멤버십');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 1.00,  DATE 2025-05-24 05:19:00' , '은행', '이자', 'OPEN_FIN');

-- [41-50]: 2025-05-24 ~ 2025-05-23 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 3.00,  DATE 2025-05-24 03:38:00' , '은행', '이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 219.00,  DATE 2025-05-24 02:54:00' , '세이프박스', '이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 15000.00,  DATE 2025-05-23 21:15:00' , '카카오페이', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 57720.00,  DATE 2025-05-23 18:26:00' , '학자금재단', '대출 이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'INCOME', 'TRANSFER', NULL, 'C11', 11000.00,  DATE 2025-05-23 13:15:00' , '유연석', '정산');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'INCOME', 'TRANSFER', NULL, 'C11', 11000.00,  DATE 2025-05-23 13:15:00' , '조이보이', '정산');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 7200.00,  DATE 2025-05-23 13:09:00' , '나이스카페인클럽', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 75000.00,  DATE 2025-05-23 13:04:00' , '오대양', '점심 회식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-05-23 13:04:00' , '임꺽정', '정산');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'INCOME', 'TRANSFER', NULL, 'C11', 11000.00,  DATE 2025-05-23 13:04:00' , '강형욱', '정산');

-- [51-60]: 2025-05-23 ~ 2025-05-21 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'INCOME', 'TRANSFER', NULL, 'C11', 11000.00,  DATE 2025-05-23 13:03:00' , '송민호', '정산');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 2275980.00,  DATE 2025-05-23 08:00:00' , '회사', '급여', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 36690.00,  DATE 2025-05-23 07:00:00' , 'SKT', '휴대폰 요금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 19600.00,  DATE 2025-05-22 20:20:00' , '얼음땡', '게임');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 8610.00,  DATE 2025-05-22 20:11:00' , 'CU', '간식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3500.00,  DATE 2025-05-22 18:03:00' , '맥도날드', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 5500.00,  DATE 2025-05-22 12:22:00' , '청담동마녀김밥', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 2000.00,  DATE 2025-05-22 08:06:00' , '인터넷상거래', '잡화');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C08', 10800.00,  DATE 2025-05-21 22:04:00' , 'Steam', '게임 결제');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 7400.00,  DATE 2025-05-21 19:55:00' , '스타벅스', '커피');

-- [61-70]: 2025-05-21 ~ 2025-05-19 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 7600.00,  DATE 2025-05-21 18:55:00' , '할리스커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1800.00,  DATE 2025-05-21 13:08:00' , '컴포즈커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U013', 'EXPENSE', 'TRANSFER', NULL, 'C12', 1000.00,  DATE 2025-05-21 10:40:00' , 'KICC', '세금/과태료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 1600.00,  DATE 2025-05-21 08:00:00' , '매머드커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 200000.00,  DATE 2025-05-20 19:25:00' , '토스 박보검', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 29685.00,  DATE 2025-05-20 18:26:00' , '쿠팡이츠', '배달 저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C02', 2000.00,  DATE 2025-05-20 13:43:00' , '카페인클럽', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3500.00,  DATE 2025-05-20 13:33:00' , '세븐일레븐', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 8700.00,  DATE 2025-05-19 18:32:00' , 'CU', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C03', 14900.00,  DATE 2025-05-19 18:18:00' , '올리브영', '화장품');

-- [71-80]: 2025-05-19 ~ 2025-05-16 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C01', 25000.00,  DATE 2025-05-19 13:18:00' , '한옥집 육곳간', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1600.00,  DATE 2025-05-19 08:00:00' , '매머드커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 5100.00,  DATE 2025-05-18 14:00:00' , '한국정보통신', '카페 결제');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-05-18 14:00:00' , '카카오페이', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 3000.00,  DATE 2025-05-18 12:57:00' , '카카오페이', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 5000.00,  DATE 2025-05-17 21:10:00' , '카카오페이', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-05-17 21:10:00' , '한동숙', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 13450.00,  DATE 2025-05-17 19:00:00' , '인디오븐', '빵 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C08', 9500.00,  DATE 2025-05-17 14:38:00' , 'CGV', '영화 관람');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U009', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 5000.00,  DATE 2025-05-16 22:08:00' , '이니시스', '서비스 구독');

-- [81-86]: 2025-05-16 ~ 2025-05-01 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3500.00,  DATE 2025-05-16 21:13:00' , '맥도날드', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1600.00,  DATE 2025-05-16 08:02:00' , '나이스페이', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 20648.00,  DATE 2025-05-15 18:43:00' , '쿠팡이츠', '배달 저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9100.00,  DATE 2025-05-15 12:36:00' , '버거킹', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U016', 'INCOME', 'TRANSFER', NULL, 'C13', 13830.00,  DATE 2025-05-15 12:35:00' , '교통공사', 'K패스 환급금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C02', 2300.00,  DATE 2025-05-15 08:05:00' , '나이스페이', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 20580.00,  DATE 2025-05-14 19:02:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9000.00,  DATE 2025-05-14 18:22:00' , '국수나무', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 500000.00,  DATE 2025-05-14 17:24:00' , '토스 박보검', '이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 9800.00,  DATE 2025-05-14 12:40:00' , 'KFC', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'TRANSFER', NULL, 'C03', 100000.00,  DATE 2025-05-14 10:27:00' , '쿠팡', '충전 이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1600.00,  DATE 2025-05-14 07:59:00' , '나이스페이', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3500.00,  DATE 2025-05-13 18:43:00' , 'CU', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C02', 7200.00,  DATE 2025-05-13 18:33:00' , '투썸플레이스', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3000.00,  DATE 2025-05-13 17:55:00' , '패스트푸드', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U003', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-05-13 17:55:00' , '황정민', '카카오페이 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U003', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-05-13 17:55:00' , '카카오페이', '송금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 10900.00,  DATE 2025-05-13 15:16:00' , '동그리', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U017', 'INCOME', 'TRANSFER', NULL, 'C11', 95046.00,  DATE 2025-05-13 13:32:00' , '토스 박보검', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U017', 'EXPENSE', 'TRANSFER', NULL, 'C11', 95046.00,  DATE 2025-05-13 13:32:00' , '복숭아', '이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 11000.00,  DATE 2025-05-13 13:12:00' , '인터넷상거래', '온라인 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1600.00,  DATE 2025-05-13 08:07:00' , '나이스페이', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-05-12 19:34:00' , '토스 지인', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4000.00,  DATE 2025-05-12 19:31:00' , 'CU', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C01', 37000.00,  DATE 2025-05-12 18:48:00' , '신림춘천집', '저녁 외식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C11', 40000.00,  DATE 2025-05-12 16:14:00' , '청약통장', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U015', 'EXPENSE', 'TRANSFER', NULL, 'C11', 40000.00,  DATE 2025-05-12 16:14:00' , '토스 박보검', '이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'INCOME', 'TRANSFER', NULL, 'C11', 10900.00,  DATE 2025-05-12 13:44:00' , '오이시', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'INCOME', 'TRANSFER', NULL, 'C11', 10900.00,  DATE 2025-05-12 13:43:00' , '타베루', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C01', 43600.00,  DATE 2025-05-12 13:19:00' , '미켈고깃집', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 35200.00,  DATE 2025-05-12 09:38:00' , 'KT', '인터넷 요금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 90030.00,  DATE 2025-05-12 09:09:00' , 'KT', '휴대폰 요금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C05', 23000.00,  DATE 2025-05-12 01:01:00' , '모바일티머니', '월 정산 지하철');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C05', 3200.00,  DATE 2025-05-12 01:01:00' , '모바일티머니', '월 정산 통행료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U008', 'EXPENSE', 'CARD', 'CHECK', 'C05', 19550.00,  DATE 2025-05-12 01:01:00' , '모바일티머니', '월 정산 버스비');

-- [31-40]: 2025-05-11 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3300.00,  DATE 2025-05-11 20:12:00' , '한국정보통신', '카페');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 42500.00,  DATE 2025-05-11 15:07:00' , 'CU', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 8700.00,  DATE 2025-05-11 14:53:00' , '다이소', '잡화');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'INCOME', 'TRANSFER', NULL, 'C11', 20000.00,  DATE 2025-05-11 01:45:00' , '잇쇼니', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'INCOME', 'TRANSFER', NULL, 'C11', 50000.00,  DATE 2025-05-11 01:45:00' , '동구리', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C05', 39400.00,  DATE 2025-05-11 01:01:00' , '모바일티머니', '택시비');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C05', 9100.00,  DATE 2025-05-11 00:10:00' , '티머니', '택시비');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U011', 'EXPENSE', 'TRANSFER', NULL, 'C05', 8800.00,  DATE 2025-05-11 00:01:00' , '티머니', '택시 결제');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U012', 'EXPENSE', 'TRANSFER', NULL, 'C05', 8800.00,  DATE 2025-05-11 00:01:00' , '티머니', '택시 결제 취소');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C08', 72000.00,  DATE 2025-05-10 23:54:00' , '슈퍼스타2', '공연 관람');

-- [41-50]: 2025-05-10 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C08', 8000.00,  DATE 2025-05-10 15:56:00' , '미디어앤아트', '전시회 관람');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 47000.00,  DATE 2025-05-10 13:57:00' , '영화루', '중식 외식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C06', 69300.00,  DATE 2025-05-10 12:55:00' , '약국 키오스크', '약국 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C06', 5000.00,  DATE 2025-05-10 12:53:00' , '이비인후과', '진료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CHECK', 'C10', 74760.00,  DATE 2025-05-10 09:47:00' , '한화손보', '차량 보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 0.00,  DATE 2025-05-10 00:36:00' , '무통식', '입금 내역', 'OPEN_FIN');

-- [51-60]: 2025-05-09 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 5500.00,  DATE 2025-05-09 18:01:00' , '마녀김밥', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C02', 12100.00,  DATE 2025-05-09 17:56:00' , '뚜레쥬르', '빵 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 8736.00,  DATE 2025-05-09 14:11:00' , '데스코', '저축 이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1800.00,  DATE 2025-05-08 12:39:00' , '코리아세븐', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C03', 1900.00,  DATE 2025-05-08 09:16:00' , '카카오', '온라인 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-05-08 09:16:00' , '카카오페이', '송금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U026', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-05-08 09:16:00' , '김맛집', '카카오페이 입금', 'OPEN_FIN');

-- [61-70]: 2025-05-07 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C10', 31391.00,  DATE 2025-05-07 18:49:00' , '삼성화재', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U014', 'EXPENSE', 'TRANSFER', NULL, 'C10', 41340.00,  DATE 2025-05-07 18:48:00' , 'DB손보', '차량 보험', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U006', 'EXPENSE', 'TRANSFER', NULL, 'C11', 137180.00,  DATE 2025-05-07 18:46:00' , '롯데손보', '장기 보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 29572.00,  DATE 2025-05-07 18:31:00' , '흥국', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3600.00,  DATE 2025-05-07 13:17:00' , '세븐일레븐', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C04', 5800.00,  DATE 2025-05-07 12:54:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C03', 3000.00,  DATE 2025-05-07 12:49:00' , '어우라', '쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12500.00,  DATE 2025-05-07 12:48:00' , '본죽', '점심 식사');

-- [71-80]: 2025-05-06 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C06', 12900.00,  DATE 2025-05-06 13:24:00' , '골드약국', '약값');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C06', 89200.00,  DATE 2025-05-06 12:17:00' , '병원', '진료');

-- [81-86]: 2025-05-05 ~ 2025-05-01 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C02', 7000.00,  DATE 2025-05-05 16:45:00' , '메가커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C08', 31700.00,  DATE 2025-05-05 16:31:00' , '베스킨라빈스', '아이스크림');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'CASH', NULL, 'C13', 609000.00,  DATE 2025-05-05 16:27:00' , '현금입금', '현금 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C02', 8100.00,  DATE 2025-05-05 16:23:00' , '파리바게뜨', '빵');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 11210.00,  DATE 2025-05-05 16:14:00' , '보령슈퍼', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C03', 100000.00,  DATE 2025-05-05 00:13:00' , '쿠팡', '이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 22000.00,  DATE 2025-05-04 20:02:00' , '쿠팡이츠', '배달 저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C13', 19800.00,  DATE 2025-05-04 16:38:00' , 'KS넷', '기타 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 7200.00,  DATE 2025-05-03 21:42:00' , '메가커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 21700.00,  DATE 2025-05-03 20:59:00' , '다이소', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 12800.00,  DATE 2025-05-03 13:40:00' , '중앙할인마트', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CREDIT', 'C13', 7400.00,  DATE 2025-05-02 20:25:00' , 'KICC', '기타 결제');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 14200.00,  DATE 2025-05-02 18:37:00' , '투썸플레이스', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U019', 'EXPENSE', 'TRANSFER', NULL, 'C13', 36400.00,  DATE 2025-05-02 17:50:00' , '토스', '온라인 결제');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 400000.00,  DATE 2025-05-02 17:07:00' , '카카오페이', '비상금 이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 274186.00,  DATE 2025-05-02 17:07:00' , '카카오페이', '신한은행 이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 274186.00,  DATE 2025-05-02 17:07:00' , '김슈로', '카카오페이 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 12400.00,  DATE 2025-05-02 13:21:00' , '인터넷상거래', '온라인 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 24326.00,  DATE 2025-05-01 12:26:00' , '쿠팡이츠', '배달 점심');

COMMIT;

-- ============================================================
--  DUMMY DATA: smaccount.LEDGER_ENTRY (81개 - 4월 1일 ~ 5월 1일)
--  MySQL 문법 (smaccount. 접두사 적용 및 연예인 이름 대체)
--  참조: Group ID (1~10, Member ID (U001~U030, Category ID (C01~C13)
-- ============================================================

-- Group/Member ID는 내부 논리에 따라 할당됩니다.

-- [1-10]: 2025-04-30 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C01', 32000.00,  DATE 2025-04-30 20:41:00' , '장꼬방', '저녁 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'EXPENSE', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-04-30 20:36:00' , '쿠팡', '충전 이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3402.00,  DATE 2025-04-30 20:36:00' , '데이데이 컴퍼니', '생활용품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'POINT', NULL, 'C04', 98.00,  DATE 2025-04-30 20:36:00' , '네이버페이', '포인트 사용');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C10', 20490.00,  DATE 2025-04-30 18:31:00' , '라이나생명', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C13', 10000.00,  DATE 2025-04-30 14:43:00' , '이니시스', '서비스 구독');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 30000.00,  DATE 2025-04-30 13:47:00' , '신라샤브', '팀 점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U015', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-04-30 08:40:00' , '토스 박보검', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C05', 50000.00,  DATE 2025-04-29 18:38:00' , '광생주유소', '주유');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12600.00,  DATE 2025-04-29 12:40:00' , '패스트푸드', '점심');

-- [11-20]: 2025-04-29 ~ 2025-04-28 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1600.00,  DATE 2025-04-29 08:05:00' , '나이스페이', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 13200.00,  DATE 2025-04-28 21:47:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 35000.00,  DATE 2025-04-28 21:38:00' , '음악학원', '수강료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C03', 10000.00,  DATE 2025-04-28 20:32:00' , '헤어샵', '미용');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C03', 9881.00,  DATE 2025-04-28 19:08:00' , '헤어샵', '미용 용품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'POINT', NULL, 'C03', 119.00,  DATE 2025-04-28 19:08:00' , '네이버페이', '포인트 사용');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'INCOME', 'TRANSFER', NULL, 'C13', 22700.00,  DATE 2025-04-28 18:59:00' , '커피값', '정산 입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3500.00,  DATE 2025-04-28 18:03:00' , '패스트푸드', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 4500.00,  DATE 2025-04-28 18:01:00' , '베이커리', '빵');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-04-28 08:45:00' , '토스 박보검', '입금', 'OPEN_FIN');

-- [21-30]: 2025-04-28 ~ 2025-04-26 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1600.00,  DATE 2025-04-28 08:03:00' , '나이스페이', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4000.00,  DATE 2025-04-27 14:48:00' , '한국정보통신', '카페');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U008', 'EXPENSE', 'CARD', 'CHECK', 'C02', 12500.00,  DATE 2025-04-26 14:26:00' , '한국정보통신', '카페');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C02', 10200.00,  DATE 2025-04-26 14:23:00' , '한국정보통신', '카페');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 0.00,  DATE 2025-04-26 05:21:00' , '은행', '이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 3.00,  DATE 2025-04-26 03:45:00' , '은행', '이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 258.00,  DATE 2025-04-26 02:58:00' , '세이프박스', '이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2800.00,  DATE 2025-04-25 23:35:00' , '패스트푸드', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 21000.00,  DATE 2025-04-25 23:28:00' , '초콜릿', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'INCOME', 'TRANSFER', NULL, 'C11', 70000.00,  DATE 2025-04-25 23:28:00' , '소오름', '입금');

-- [31-40]: 2025-04-25 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 21000.00,  DATE 2025-04-25 22:47:00' , '칼릭스', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U001', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 63300.00,  DATE 2025-04-25 22:46:00' , '브롱스', '맥주');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'INCOME', 'TRANSFER', NULL, 'C11', 50000.00,  DATE 2025-04-25 21:17:00' , '베드로', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 201000.00,  DATE 2025-04-25 20:31:00' , '호보식당', '고기');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 1257110.00,  DATE 2025-04-25 18:48:00' , '삼성카드', '카드대금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 758886.00,  DATE 2025-04-25 18:47:00' , 'KB카드', '카드대금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 63610.00,  DATE 2025-04-25 18:36:00' , '학자금재단', '대출 이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C02', 5000.00,  DATE 2025-04-25 13:10:00' , '올가커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 2086650.00,  DATE 2025-04-25 08:01:00' , '회사', '급여', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 33417.00,  DATE 2025-04-25 07:16:00' , '한화손보', '보험료', 'OPEN_FIN');

-- [51-60]: 2025-04-24 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3300.00,  DATE 2025-04-24 21:28:00' , '키오스크', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C01', 6200.00,  DATE 2025-04-24 13:02:00' , '엠엠티에이치', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-04-24 13:01:00' , '카카오페이', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 285760.00,  DATE 2025-04-24 12:12:00' , '토스 박보검', '이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C10', 7890.00,  DATE 2025-04-24 10:47:00' , '쿠팡', '와우 멤버십');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1600.00,  DATE 2025-04-24 08:02:00' , '나이스페이', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C10', 700.00,  DATE 2025-04-24 01:01:00' , '휴대폰알림서비스', '알림');

-- [61-70]: 2025-04-23 ~ 2025-04-22 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 14200.00,  DATE 2025-04-23 18:42:00' , '투썸플레이스', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 57720.00,  DATE 2025-04-23 18:26:00' , '학자금재단', '대출 이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-04-23 14:46:00' , '토스 박보검', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C02', 5000.00,  DATE 2025-04-23 13:03:00' , '위트러스트', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1600.00,  DATE 2025-04-23 08:02:00' , '나이스페이', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C10', 36690.00,  DATE 2025-04-23 07:00:00' , 'SKT', '휴대폰 요금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4400.00,  DATE 2025-04-22 18:16:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4000.00,  DATE 2025-04-22 18:13:00' , '중앙하이츠', '관리비');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'INCOME', 'TRANSFER', NULL, 'C11', 8000.00,  DATE 2025-04-22 17:06:00' , '점소이', '정산');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7300.00,  DATE 2025-04-22 13:20:00' , 'PAYCO오더', '점심');

-- [71-81]: 2025-04-22 ~ 2025-04-01 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CHECK', 'C01', 21000.00,  DATE 2025-04-22 13:08:00' , '찌개명가', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1600.00,  DATE 2025-04-22 08:00:00' , '나이스페이', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 25000.00,  DATE 2025-04-21 18:44:00' , '쿠팡이츠', '저녁 배달');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C04', 9490.00,  DATE 2025-04-21 18:26:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 10000.00,  DATE 2025-04-21 13:25:00' , '오대양', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C02', 14200.00,  DATE 2025-04-20 14:55:00' , '한국정보통신', '카페');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 11801.00,  DATE 2025-04-19 14:24:00' , '쿠팡이츠', '점심 배달');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3500.00,  DATE 2025-04-18 19:55:00' , '쥬씨', '간식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U008', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00,  DATE 2025-04-18 19:04:00' , '코인노래방', '취미');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C01', 50000.00,  DATE 2025-04-18 18:26:00' , '88갈비', '저녁 외식');

COMMIT;

-- ============================================================
--  DUMMY DATA: smaccount.LEDGER_ENTRY (81개 - 4월 1일 ~ 5월 12일 이전 내역)
--  MySQL 문법 (smaccount. 접두사 적용 및 연예인 이름 대체)
-- ============================================================

-- Group/Member ID는 내부 논리에 따라 할당됩니다.

-- [1-10]: 2025-05-12 ~ 2025-05-01 내역 (Part 7에서 누락된 5월 초반 내역)
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3300.00,  DATE 2025-05-11 20:12:00' , '한국정보통신', '카페');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 42500.00,  DATE 2025-05-11 15:07:00' , 'CU', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 8700.00,  DATE 2025-05-11 14:53:00' , '다이소', '잡화');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'INCOME', 'TRANSFER', NULL, 'C11', 20000.00,  DATE 2025-05-11 01:45:00' , '황*민', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'INCOME', 'TRANSFER', NULL, 'C11', 50000.00,  DATE 2025-05-11 01:45:00' , '김*민', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C05', 39400.00,  DATE 2025-05-11 01:01:00' , '모바일티머니', '택시비');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C05', 9100.00,  DATE 2025-05-11 00:10:00' , '티머니', '택시비');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C08', 72000.00,  DATE 2025-05-10 23:54:00' , '슈퍼스타2', '공연 관람');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C08', 8000.00,  DATE 2025-05-10 15:56:00' , '미디어앤아트', '전시회 관람');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 47000.00,  DATE 2025-05-10 13:57:00' , '영화루', '중식 외식');

-- [11-20]: 2025-05-10 ~ 2025-05-09 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C06', 69300.00,  DATE 2025-05-10 12:55:00' , '약국 키오스크', '약국 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C06', 5000.00,  DATE 2025-05-10 12:53:00' , '이비인후과', '진료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CHECK', 'C10', 74760.00,  DATE 2025-05-10 09:47:00' , '한화손보', '차량 보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 0.00,  DATE 2025-05-10 00:36:00' , '무통식', '입금 내역', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C01', 5500.00,  DATE 2025-05-09 18:01:00' , '마녀김밥', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C02', 12100.00,  DATE 2025-05-09 17:56:00' , '뚜레쥬르', '빵 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 8736.00,  DATE 2025-05-09 14:11:00' , '데스코', '저축 이자', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C04', 1800.00,  DATE 2025-05-08 12:39:00' , '코리아세븐', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C03', 1900.00,  DATE 2025-05-08 09:16:00' , '카카오', '온라인 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-05-08 09:16:00' , '카카오페이', '송금', 'OPEN_FIN');

-- [21-30]: 2025-05-08 ~ 2025-05-06 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U026', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-05-08 09:16:00' , '김*형', '카카오페이 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C10', 31391.00,  DATE 2025-05-07 18:49:00' , '삼성화재', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U014', 'EXPENSE', 'TRANSFER', NULL, 'C10', 41340.00,  DATE 2025-05-07 18:48:00' , 'DB손보', '차량 보험', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U006', 'EXPENSE', 'TRANSFER', NULL, 'C11', 137180.00,  DATE 2025-05-07 18:46:00' , '롯데손보', '장기 보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 29572.00,  DATE 2025-05-07 18:31:00' , '흥국', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3600.00,  DATE 2025-05-07 13:17:00' , '세븐일레븐', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C04', 5800.00,  DATE 2025-05-07 12:54:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C03', 3000.00,  DATE 2025-05-07 12:49:00' , '어우라', '쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12500.00,  DATE 2025-05-07 12:48:00' , '본죽', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C06', 12900.00,  DATE 2025-05-06 13:24:00' , '골드약국', '약값');

-- [31-40]: 2025-05-06 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C06', 89200.00,  DATE 2025-05-06 12:17:00' , '병원', '진료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C02', 7000.00,  DATE 2025-05-05 16:45:00' , '메가커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C08', 31700.00,  DATE 2025-05-05 16:31:00' , '베스킨라빈스', '아이스크림');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'CASH', NULL, 'C13', 609000.00,  DATE 2025-05-05 16:27:00' , '현금입금', '현금 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C02', 8100.00,  DATE 2025-05-05 16:23:00' , '파리바게뜨', '빵');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 11210.00,  DATE 2025-05-05 16:14:00' , '보령슈퍼', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C03', 100000.00,  DATE 2025-05-05 00:13:00' , '쿠팡', '이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 22000.00,  DATE 2025-05-04 20:02:00' , '쿠팡이츠', '배달 저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C13', 19800.00,  DATE 2025-05-04 16:38:00' , 'KS넷', '기타 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 7200.00,  DATE 2025-05-03 21:42:00' , '메가커피', '커피');

-- [51-60]: 2025-05-03 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 21700.00,  DATE 2025-05-03 20:59:00' , '다이소', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 12800.00,  DATE 2025-05-03 13:40:00' , '중앙할인마트', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CREDIT', 'C13', 7400.00,  DATE 2025-05-02 20:25:00' , 'KICC', '기타 결제');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 14200.00,  DATE 2025-05-02 18:37:00' , '투썸플레이스', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U019', 'EXPENSE', 'TRANSFER', NULL, 'C13', 36400.00,  DATE 2025-05-02 17:50:00' , '토스', '온라인 결제');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 400000.00,  DATE 2025-05-02 17:07:00' , '카카오페이', '비상금 이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 274186.00,  DATE 2025-05-02 17:07:00' , '카카오페이', '신한은행 이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 274186.00,  DATE 2025-05-02 17:07:00' , '김*형', '카카오페이 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 12400.00,  DATE 2025-05-02 13:21:00' , '인터넷상거래', '온라인 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 24326.00,  DATE 2025-05-01 12:26:00' , '쿠팡이츠', '배달 점심');

-- [61-70]: 2025-04-30 ~ 2025-04-29 내역 (Part 7에서 처리된 내용의 중복 방지)
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C01', 7500.00,  DATE 2025-04-14 12:40:00' , '윤쉐프코오롱', '점심 식사');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 17373.00,  DATE 2025-04-13 17:57:00' , '쿠팡이츠', '배달 저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C02', 5000.00,  DATE 2025-04-12 13:47:00' , '엔에이치엔케이씨피', '카페');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 0.00,  DATE 2025-04-12 01:02:00' , '무통식', '입금 내역', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C05', 29000.00,  DATE 2025-04-12 01:01:00' , '모바일티머니', '월 정산 지하철');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C05', 31500.00,  DATE 2025-04-12 01:01:00' , '모바일티머니', '월 정산 버스비');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C05', 3100.00,  DATE 2025-04-12 01:01:00' , '한국도로공사', '통행료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C01', 41000.00,  DATE 2025-04-11 22:16:00' , '치킨', '저녁 외식');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U006', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-04-11 18:19:00' , '토스 박보검', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 620000.00,  DATE 2025-04-11 13:25:00' , '지인', '입금', 'OPEN_FIN');

-- [71-81]: 2025-04-11 ~ 2025-04-01 내역
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C01', 4600.00,  DATE 2025-04-11 13:09:00' , '엠엠티에이치', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 35200.00,  DATE 2025-04-11 09:36:00' , 'KT', '인터넷 요금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 90030.00,  DATE 2025-04-11 09:09:00' , 'KT', '휴대폰 요금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-04-10 19:39:00' , '토스 지인', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CHECK', 'C01', 2300.00,  DATE 2025-04-10 19:32:00' , 'PAYCO오더', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3800.00,  DATE 2025-04-10 19:24:00' , '더벤티', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 5000.00,  DATE 2025-04-10 13:10:00' , '위트러스트', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (1, 'U002', 'INCOME', 'TRANSFER', NULL, 'C05', 19740.00,  DATE 2025-04-10 12:33:00' , '교통공사', 'K패스 환급금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-04-09 15:57:00' , '토스 박보검', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 9600.00,  DATE 2025-04-09 12:46:00' , '맥도날드', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-04-08 18:07:00' , '토스 박보검', '입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C03', 1900.00,  DATE 2025-04-08 09:15:00' , '카카오', '온라인 구매');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U026', 'INCOME', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-04-08 09:15:00' , '김*형', '카카오페이 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (4, 'U026', 'EXPENSE', 'TRANSFER', NULL, 'C11', 10000.00,  DATE 2025-04-08 09:15:00' , '카카오페이', '송금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 100001.00,  DATE 2025-04-08 07:20:00' , '토스 박보검', '이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 100001.00,  DATE 2025-04-08 07:20:00' , '토스 박보검', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'INCOME', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-04-08 07:20:00' , '세이프박스', '입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-04-08 07:20:00' , '세이프박스', '이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 137180.00,  DATE 2025-04-07 19:24:00' , '롯데손보', '장기 보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 29572.00,  DATE 2025-04-07 18:29:00' , '흥국', '보험료', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U013', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 50000.00,  DATE 2025-04-07 18:21:00' , '광생주유소', '주유');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C11', 36997.00,  DATE 2025-04-07 14:28:00' , '카카오페이', '이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'TRANSFER', NULL, 'C13', 37000.00,  DATE 2025-04-07 14:28:00' , '카카오페이', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (2, 'U003', 'INCOME', 'TRANSFER', NULL, 'C11', 36997.00,  DATE 2025-04-07 14:28:00' , '김*형', '카카오페이 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CHECK', 'C02', 3400.00,  DATE 2025-04-05 18:17:00' , '메가커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 4000.00,  DATE 2025-04-04 21:09:00' , '중앙할인마트', '생필품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C04', 15880.00,  DATE 2025-04-04 21:03:00' , 'GS25', '편의점');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U011', 'EXPENSE', 'CARD', 'CHECK', 'C04', 3000.00,  DATE 2025-04-04 20:52:00' , '아울렛', '생활용품');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C03', 17500.00,  DATE 2025-04-04 18:23:00' , '십일번가', '온라인 쇼핑');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U005', 'EXPENSE', 'TRANSFER', NULL, 'C11', 393700.00,  DATE 2025-04-04 16:46:00' , '카카오페이', '이체', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'EXPENSE', 'TRANSFER', NULL, 'C13', 400000.00,  DATE 2025-04-04 16:46:00' , '윤*우', '송금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C11', 393700.00,  DATE 2025-04-04 16:46:00' , '김*형', '카카오페이 입금', 'OPEN_FIN');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CARD', 'CREDIT', 'C13', 19800.00,  DATE 2025-04-04 16:38:00' , 'KS넷', '기타 결제');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U012', 'EXPENSE', 'CARD', 'CREDIT', 'C06', 22858.00,  DATE 2025-04-04 13:49:00' , '건강보험공단', '보험료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 14100.00,  DATE 2025-04-03 18:22:00' , '베이커리', '빵');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 3700.00,  DATE 2025-04-03 18:03:00' , '패스트푸드', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U026', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 131880.00,  DATE 2025-04-03 16:42:00' , '한화손보', '보험료');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U018', 'INCOME', 'TRANSFER', NULL, 'C13', 1.00,  DATE 2025-04-03 16:15:00' , '은행', '테스트 입금');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 15400.00,  DATE 2025-04-03 12:35:00' , '온센', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U029', 'EXPENSE', 'TRANSFER', NULL, 'C11', 100000.00,  DATE 2025-04-02 19:16:00' , '쿠팡', '이체');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 1800.00,  DATE 2025-04-02 13:14:00' , '컴포즈커피', '커피');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 9500.00,  DATE 2025-04-02 12:46:00' , 'KFC', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C03', 4000.00,  DATE 2025-04-02 08:05:00' , '인터넷상거래', '잡화');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 11000.00,  DATE 2025-04-01 18:31:00' , '긴자료코', '저녁');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U023', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 11000.00,  DATE 2025-04-01 13:06:00' , '이태리부대찌개', '점심');
INSERT INTO  smaccount . LEDGER_ENTRY  (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C03', 2000.00, DATE '2025-04-01 08:01:00', '인터넷상거래', '잡화');

COMMIT;