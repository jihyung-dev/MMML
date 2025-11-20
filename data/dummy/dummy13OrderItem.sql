-- =============================
--  DUMMY DATA: smaccount.ORDER_ITEM (주문 상품 목록)
--  ORDER_MAIN (1~10)과 ITEM (1~20) 참조
-- =============================

-- Order 1: (한우 선물세트 - ITEM 1)
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 1, 1, 1, 85000.00);

-- Order 2: (요가 매트 - ITEM 8)
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 2, 8, 1, 15000.00);

-- Order 3: (노트북 - ITEM 6)
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 3, 6, 1, 980000.00);

-- Order 4: (수분 크림 - ITEM 13) - ITEM ID 13으로 수정합니다.
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 4, 13, 2, 22000.00);

-- Order 5: (캐시미어 니트 - ITEM 3, 경량 다운 베스트 - ITEM 11)
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 5, 3, 2, 49900.00);
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 5, 11, 1, 79000.00); -- 가격은 주문 시점 가격으로 기록

-- Order 6: (스마트 워치 S1 - ITEM 14)
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 6, 14, 1, 199000.00);

-- Order 7: (고급 등산 스틱 - ITEM 17)
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 7, 17, 1, 45000.00);

-- Order 8: (펜션 숙박권 - ITEM 19)
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 8, 19, 1, 250000.00);

-- Order 9: (무선 게이밍 마우스 - ITEM 7) - 취소된 주문
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 9, 7, 1, 45000.00);

-- Order 10: (감귤 - ITEM 2, 치킨 밀키트 - ITEM 9, 헬스장갑 - ITEM 16)
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 10, 2, 2, 35000.00);
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 10, 9, 1, 18900.00);
INSERT INTO smaccount.ORDER_ITEM (order_item_id, order_id, item_id, qty, price)
VALUES (smaccount.SEQ_ORDER_ITEM.NEXTVAL, 10, 16, 1, 29000.00);