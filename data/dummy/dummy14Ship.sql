-- =============================
--  DUMMY DATA: smaccount.SHIPMENT (배송 정보)
--  총 10건의 주문 데이터를 삽입합니다.
--  ORDER_MAIN (1~10) 참조
-- =============================

-- Order 1: DELIVERED
INSERT INTO smaccount.SHIPMENT (shipment_id, order_id, tracking_no, carrier, shipment_status)
VALUES (smaccount.SEQ_SHIPMENT.NEXTVAL, 1, 'TRK10001', 'CJ대한통운', 'DELIVERED');

-- Order 2: SHIPPING
INSERT INTO smaccount.SHIPMENT (shipment_id, order_id, tracking_no, carrier, shipment_status)
VALUES (smaccount.SEQ_SHIPMENT.NEXTVAL, 2, 'TRK10002', '우체국택배', 'SHIPPING');

-- Order 3: PREPARING
INSERT INTO smaccount.SHIPMENT (shipment_id, order_id, tracking_no, carrier, shipment_status)
VALUES (smaccount.SEQ_SHIPMENT.NEXTVAL, 3, 'TRK10003', '롯데택배', 'PREPARING');

-- Order 4: DELIVERED
INSERT INTO smaccount.SHIPMENT (shipment_id, order_id, tracking_no, carrier, shipment_status)
VALUES (smaccount.SEQ_SHIPMENT.NEXTVAL, 4, 'TRK10004', 'CJ대한통운', 'DELIVERED');

-- Order 5: SHIPPING
INSERT INTO smaccount.SHIPMENT (shipment_id, order_id, tracking_no, carrier, shipment_status)
VALUES (smaccount.SEQ_SHIPMENT.NEXTVAL, 5, 'TRK10005', '한진택배', 'SHIPPING');

-- Order 6: PREPARING
INSERT INTO smaccount.SHIPMENT (shipment_id, order_id, tracking_no, carrier, shipment_status)
VALUES (smaccount.SEQ_SHIPMENT.NEXTVAL, 6, 'TRK10006', '롯데택배', 'PREPARING');

-- Order 7: DELIVERED
INSERT INTO smaccount.SHIPMENT (shipment_id, order_id, tracking_no, carrier, shipment_status)
VALUES (smaccount.SEQ_SHIPMENT.NEXTVAL, 7, 'TRK10007', 'CJ대한통운', 'DELIVERED');

-- Order 8: SHIPPED
INSERT INTO smaccount.SHIPMENT (shipment_id, order_id, tracking_no, carrier, shipment_status)
VALUES (smaccount.SEQ_SHIPMENT.NEXTVAL, 8, 'TRK10008', '등기우편', 'SHIPPING');

-- Order 9: CANCELED (배송 정보 없음 - 필요 시 INSERT 구문 생략)
-- INSERT INTO smaccount.SHIPMENT (shipment_id, order_id, tracking_no, carrier, shipment_status) VALUES (smaccount.SEQ_SHIPMENT.NEXTVAL, 9, NULL, NULL, 'CANCELED'); -- 옵션: 주문 취소 상태는 SHIPMENT에 기록하지 않을 수 있음.

-- Order 10: PREPARING
INSERT INTO smaccount.SHIPMENT (shipment_id, order_id, tracking_no, carrier, shipment_status)
VALUES (smaccount.SEQ_SHIPMENT.NEXTVAL, 10, 'TRK10010', 'CJ대한통운', 'PREPARING');
