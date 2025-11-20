-- =============================
--  DUMMY DATA: smaccount.ORDER_MAIN (주문 메인)
--  총 10건의 주문 데이터를 삽입합니다.
--  (ORDER_ITEM과의 참조를 위해 order_id를 1~10으로 명시적으로 지정)
-- =============================

-- Order ID 1: U016 (커피잔)
INSERT INTO smaccount.ORDER_MAIN (order_id, buyer_id, total_amount, order_status)
VALUES (1, 'U016', 85000.00, 'DELIVERED');

-- Order ID 2: U020 (푸른숲)
INSERT INTO smaccount.ORDER_MAIN (order_id, buyer_id, total_amount, order_status)
VALUES (2, 'U020', 15000.00, 'SHIPPED');

-- Order ID 3: U030 (토마토)
INSERT INTO smaccount.ORDER_MAIN (order_id, buyer_id, total_amount, order_status)
VALUES (3, 'U030', 980000.00, 'PAID');

-- Order ID 4: U045 (물방울)
INSERT INTO smaccount.ORDER_MAIN (order_id, buyer_id, total_amount, order_status)
VALUES (4, 'U045', 44000.00, 'DELIVERED');

-- Order ID 5: U070 (오리너구리)
INSERT INTO smaccount.ORDER_MAIN (order_id, buyer_id, total_amount, order_status)
VALUES (5, 'U070', 128900.00, 'SHIPPED');

-- Order ID 6: U088 (에디)
INSERT INTO smaccount.ORDER_MAIN (order_id, buyer_id, total_amount, order_status)
VALUES (6, 'U088', 199000.00, 'PAID');

-- Order ID 7: U019 (구름빵)
INSERT INTO smaccount.ORDER_MAIN (order_id, buyer_id, total_amount, order_status)
VALUES (7, 'U019', 45000.00, 'DELIVERED');

-- Order ID 8: U091 (꼬마버스)
INSERT INTO smaccount.ORDER_MAIN (order_id, buyer_id, total_amount, order_status)
VALUES (8, 'U091', 250000.00, 'PAID');

-- Order ID 9: U023 (무지개) - 취소된 주문
INSERT INTO smaccount.ORDER_MAIN (order_id, buyer_id, total_amount, order_status)
VALUES (9, 'U023', 45000.00, 'CANCELED');

-- Order ID 10: U004 (은하수)
INSERT INTO smaccount.ORDER_MAIN (order_id, buyer_id, total_amount, order_status)
VALUES (10, 'U004', 198000.00, 'PAID');