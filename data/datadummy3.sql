-- =============================
--  DUMMY DATA: smaccount.MEMBER (총 100개)
--  참조: oracle_schema_v6_final.sql (최종 DDL 스키마 기준)
-- =============================

-- 관리자 (ADMIN): ID U001 ~ U005
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U001', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'ADMIN', '김민준', '샛별', '서울시 종로구 세종대로 1', '010-1111-0001', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U002', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'ADMIN', '이서준', '해찬', '서울시 종로구 세종대로 2', '010-1111-0002', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U003', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'ADMIN', '박지아', '달무리', '서울시 종로구 세종대로 3', '010-1111-0003', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U004', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'ADMIN', '최은우', '은하수', '서울시 종로구 세종대로 4', '010-1111-0004', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U005', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'ADMIN', '정하윤', '바람꽃', '서울시 종로구 세종대로 5', '010-1111-0005', 'Y');

-- 판매자 (SELLER) 역할 회원: ID U006 ~ U015
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U006', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'SELLER', '김태영', '황금손', '경기도 성남시 분당구 판교로 6', '010-2222-0006', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U007', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'SELLER', '이지유', '장바구니', '경기도 성남시 분당구 판교로 7', '010-2222-0007', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U008', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'SELLER', '박시후', '보따리', '경기도 성남시 분당구 판교로 8', '010-2222-0008', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U009', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'SELLER', '최서윤', '꿀단지', '경기도 성남시 분당구 판교로 9', '010-2222-0009', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U010', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'SELLER', '정윤호', '대박점', '경기도 성남시 분당구 판교로 10', '010-2222-0010', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U011', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'SELLER', '김예나', '득템요정', '경기도 성남시 분당구 판교로 11', '010-2222-0011', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U012', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'SELLER', '이로운', '현금부자', '경기도 성남시 분당구 판교로 12', '010-2222-0012', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U013', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'SELLER', '박도준', '미소상점', '경기도 성남시 분당구 판교로 13', '010-2222-0013', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U014', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'SELLER', '최아린', '새벽시장', '경기도 성남시 분당구 판교로 14', '010-2222-0014', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U015', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'SELLER', '정서우', '완판녀', '경기도 성남시 분당구 판교로 15', '010-2222-0015', 'Y');

-- 일반회원 (GENERAL): ID U016 ~ U100 (85명)
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U016', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '김지훈', '커피잔', '인천 연수구 송도동 16', '010-3000-0016', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U017', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '이서현', '연필심', '인천 연수구 송도동 17', '010-3000-0017', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U018', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '박주원', '그림자', '인천 연수구 송도동 18', '010-3000-0018', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U019', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '최유진', '구름빵', '인천 연수구 송도동 19', '010-3000-0019', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U020', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '정승우', '푸른숲', '인천 연수구 송도동 20', '010-3000-0020', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U021', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '강하늘', '고양이발', '부산 해운대구 우동 21', '010-3000-0021', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U022', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '조민서', '달팽이', '부산 해운대구 우동 22', '010-3000-0022', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U023', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '윤수빈', '무지개', '부산 해운대구 우동 23', '010-3000-0023', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U024', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '임재현', '아침이슬', '부산 해운대구 우동 24', '010-3000-0024', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U025', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '홍도현', '별똥별', '부산 해운대구 우동 25', '010-3000-0025', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U026', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '변지우', '시계탑', '대구 수성구 범어동 26', '010-3000-0026', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U027', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '유시은', '바다소금', '대구 수성구 범어동 27', '010-3000-0027', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U028', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '신준서', '민트향', '대구 수성구 범어동 28', '010-3000-0028', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U029', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '고은채', '노을빛', '대구 수성구 범어동 29', '010-3000-0029', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U030', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '문찬우', '토마토', '대구 수성구 범어동 30', '010-3000-0030', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U031', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '하서준', '솜사탕', '광주 서구 상무지구 31', '010-3000-0031', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U032', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '오지호', '보름달', '광주 서구 상무지구 32', '010-3000-0032', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U033', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '서하윤', '꼬꼬마', '광주 서구 상무지구 33', '010-3000-0033', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U034', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '전도윤', '단풍잎', '광주 서구 상무지구 34', '010-3000-0034', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U035', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '배가은', '봄햇살', '광주 서구 상무지구 35', '010-3000-0035', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U036', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '백현서', '철수', '대전 유성구 도룡동 36', '010-3000-0036', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U037', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '노이안', '영희', '대전 유성구 도룡동 37', '010-3000-0037', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U038', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '양채은', '뚝배기', '대전 유성구 도룡동 38', '010-3000-0038', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U039', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '황주안', '짱구', '대전 유성구 도룡동 39', '010-3000-0039', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U040', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '송나현', '유리구슬', '대전 유성구 도룡동 40', '010-3000-0040', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U041', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '남현진', '잠만보', '울산 남구 삼산동 41', '010-3000-0041', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U042', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '곽민재', '춤추는돌', '울산 남구 삼산동 42', '010-3000-0042', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U043', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '손소율', '미역국', '울산 남구 삼산동 43', '010-3000-0043', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U044', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '정하준', '은쟁반', '울산 남구 삼산동 44', '010-3000-0044', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U045', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '김아윤', '물방울', '울산 남구 삼산동 45', '010-3000-0045', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U046', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '이준영', '금붕어', '제주 제주시 연동 46', '010-3000-0046', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U047', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '박지유', '종이배', '제주 제주시 연동 47', '010-3000-0047', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U048', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '최민서', '멜로디', '제주 제주시 연동 48', '010-3000-0048', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U049', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '정우진', '수수께끼', '제주 제주시 연동 49', '010-3000-0049', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U050', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '강서아', '몽글몽글', '제주 제주시 연동 50', '010-3000-0050', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U051', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '조현우', '푸딩', '경기도 수원시 팔달구 51', '010-3000-0051', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U052', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '윤가온', '딸기잼', '경기도 수원시 팔달구 52', '010-3000-0052', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U053', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '임태희', '호두과자', '경기도 수원시 팔달구 53', '010-3000-0053', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U054', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '홍다인', '달콤이', '경기도 수원시 팔달구 54', '010-3000-0054', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U055', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '변서우', '솜털', '경기도 수원시 팔달구 55', '010-3000-0055', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U056', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '유지호', '핑크퐁', '경기도 고양시 일산동구 56', '010-3000-0056', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U057', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '신지우', '아기상어', '경기도 고양시 일산동구 57', '010-3000-0057', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U058', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '고태준', '곰젤리', '경기도 고양시 일산동구 58', '010-3000-0058', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U059', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '문서현', '보라돌이', '경기도 고양시 일산동구 59', '010-3000-0059', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U060', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '하예나', '뚜비', '경기도 고양시 일산동구 60', '010-3000-0060', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U061', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '오민재', '나나', '충청남도 천안시 서북구 61', '010-3000-0061', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U062', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '서하진', '뽀', '충청남도 천안시 서북구 62', '010-3000-0062', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U063', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '전이안', '코알라', '충청남도 천안시 서북구 63', '010-3000-0063', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U064', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '배지우', '하마', '충청남도 천안시 서북구 64', '010-3000-0064', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U065', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '백정우', '기린', '충청남도 천안시 서북구 65', '010-3000-0065', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U066', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '노소율', '코끼리', '경상남도 창원시 성산구 66', '010-3000-0066', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U067', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '양준서', '홍학', '경상남도 창원시 성산구 67', '010-3000-0067', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U068', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '황주원', '앵무새', '경상남도 창원시 성산구 68', '010-3000-0068', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U069', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '송하은', '얼룩말', '경상남도 창원시 성산구 69', '010-3000-0069', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U070', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '남현진', '오리너구리', '경상남도 창원시 성산구 70', '010-3000-0070', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U071', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '곽태현', '수달', '전라북도 전주시 완산구 71', '010-3000-0071', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U072', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '손서아', '두더지', '전라북도 전주시 완산구 72', '010-3000-0072', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U073', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '정시후', '다람쥐', '전라북도 전주시 완산구 73', '010-3000-0073', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U074', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '김예준', '펭귄', '전라북도 전주시 완산구 74', '010-3000-0074', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U075', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '이하윤', '북극곰', '전라북도 전주시 완산구 75', '010-3000-0075', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U076', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '박지호', '아지트', '강원도 춘천시 퇴계동 76', '010-3000-0076', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U077', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '최가은', '비밀의방', '강원도 춘천시 퇴계동 77', '010-3000-0077', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U078', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '정윤서', '쪽지', '강원도 춘천시 퇴계동 78', '010-3000-0078', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U079', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '강도현', '우주선', '강원도 춘천시 퇴계동 79', '010-3000-0079', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U080', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '조서윤', '외계인', '강원도 춘천시 퇴계동 80', '010-3000-0080', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U081', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '윤태영', '태양계', '서울 강서구 마곡동 81', '010-3000-0081', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U082', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '임지우', '화성', '서울 강서구 마곡동 82', '010-3000-0082', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U083', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '홍시은', '목성', '서울 강서구 마곡동 83', '010-3000-0083', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U084', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '변준서', '토성', '서울 강서구 마곡동 84', '010-3000-0084', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U085', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '유은채', '명왕성', '서울 강서구 마곡동 85', '010-3000-0085', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U086', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '신찬우', '뽀로로', '서울 강남구 역삼동 86', '010-3000-0086', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U087', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '고서준', '루피', '서울 강남구 역삼동 87', '010-3000-0087', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U088', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '문지호', '에디', '서울 강남구 역삼동 88', '010-3000-0088', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U089', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '하하윤', '패티', '서울 강남구 역삼동 89', '010-3000-0089', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U090', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '오도윤', '크롱', '서울 강남구 역삼동 90', '010-3000-0090', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U091', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '서가은', '꼬마버스', '서울 서초구 반포동 91', '010-3000-0091', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U092', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '전현서', '타요', '서울 서초구 반포동 92', '010-3000-0092', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U093', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '배이안', '로기', '서울 서초구 반포동 93', '010-3000-0093', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U094', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '백채은', '라니', '서울 서초구 반포동 94', '010-3000-0094', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U095', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '노주안', '가니', '서울 서초구 반포동 95', '010-3000-0095', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U096', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '양나현', '젤리곰', '서울 송파구 잠실동 96', '010-3000-0096', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U097', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '황민재', '마카롱', '서울 송파구 잠실동 97', '010-3000-0097', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U098', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '송소율', '식빵', '서울 송파구 잠실동 98', '010-3000-0098', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U099', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '남하준', '오렌지', '서울 송파구 잠실동 99', '010-3000-0099', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U100', '$2a$10$UaMsj2.FnWQ/MBsdzGsMMOzggJ7sgOGBYWJClxbOCnxTfo45guH9a', 'GENERAL', '곽아윤', '레몬즙', '서울 송파구 잠실동 100', '010-3000-0100', 'Y');


-- =============================
--  DUMMY DATA: smaccount.SELLER
--  **ID 초기화 및 데이터 삽입 스크립트**
--  주의: 이 스크립트를 실행하기 전에 MEMBER 테이블에 U006~U015가 존재해야 합니다.
-- =============================

-- 1. SELLER 테이블의 데이터 삭제 (TRUNCATE는 내부 시퀀스 카운터를 재설정하지 않음)
-- 외래 키 제약 조건 문제로 TRUNCATE 대신 DELETE를 사용합니다.
DELETE FROM smaccount.SELLER;

-- 2. SELLER 테이블의 IDENTITY 카운터를 1로 재설정
-- ALTER TABLE ... MODIFY GENERATED AS IDENTITY (START WITH 1) 구문 사용
ALTER TABLE smaccount.SELLER MODIFY (SELLER_ID GENERATED AS IDENTITY (START WITH 1));

-- 3. 판매자 데이터 다시 삽입 (이제 seller_id는 1부터 시작합니다)
-- U006: 황금손 (seller_id: 1)
INSERT INTO smaccount.SELLER (biz_no, member_id, biz_type) VALUES ('123-01-00006', 'U006', '식품제조/농산물');

-- U007: 장바구니 (seller_id: 2)
INSERT INTO smaccount.SELLER (biz_no, member_id, biz_type) VALUES ('123-02-00007', 'U007', '전자상거래/의류');

-- U008: 보따리 (seller_id: 3)
INSERT INTO smaccount.SELLER (biz_no, member_id, biz_type) VALUES ('123-03-00008', 'U008', '도소매/뷰티용품');

-- U009: 꿀단지 (seller_id: 4)
INSERT INTO smaccount.SELLER (biz_no, member_id, biz_type) VALUES ('123-04-00009', 'U009', '법인사업자/디지털');

-- U010: 대박점 (seller_id: 5)
INSERT INTO smaccount.SELLER (biz_no, member_id, biz_type) VALUES ('123-05-00010', 'U010', '여행/숙박 서비스');

-- U011: 득템요정 (seller_id: 6)
INSERT INTO smaccount.SELLER (biz_no, member_id, biz_type) VALUES ('123-06-00011', 'U011', '개인사업자/밀키트');

-- U012: 현금부자 (seller_id: 7)
INSERT INTO smaccount.SELLER (biz_no, member_id, biz_type) VALUES ('123-07-00012', 'U012', '전자상거래/명품잡화');

-- U013: 미소상점 (seller_id: 8)
INSERT INTO smaccount.SELLER (biz_no, member_id, biz_type) VALUES ('123-08-00013', 'U013', '개인사업자/생활용품');

-- U014: 새벽시장 (seller_id: 9)
INSERT INTO smaccount.SELLER (biz_no, member_id, biz_type) VALUES ('123-09-00014', 'U014', '법인사업자/가전');

-- U015: 완판녀 (seller_id: 10)
INSERT INTO smaccount.SELLER (biz_no, member_id, biz_type) VALUES ('123-10-00015', 'U015', '도소매/화장품');

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.CATEGORY (대분류)
--  가계부(C01~C13), 핫딜(H01~H05)
-- =============================

-- === 가계부 지출/수입 카테고리 (C01 ~ C13) ===
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C01', '식비');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C02', '카페');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C03', '쇼핑');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C04', '생활');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C05', '교통');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C06', '의료');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C07', '교육/도서');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C08', '여가/취미');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C09', '반려동물');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C10', '고정비/구독');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C11', '금융/이체');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C12', '세금/공공요금');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('C13', '기타');

-- === 핫딜 상품 카테고리 (H01 ~ H05) ===
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('H01', '패션');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('H02', '디지털/가전');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('H03', '뷰티/건강');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('H04', '식품/생필품');
INSERT INTO smaccount.CATEGORY (category_id, category_name) VALUES ('H05', '여행/레저');


-- =============================
--  DUMMY DATA: smaccount.SUB_CATEGORY (소분류)
--  참조: CATEGORY (C01~C13, H01~H05)
-- =============================

-- C01: 식비
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0101', '외식', 'C01');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0102', '배달/포장', 'C01');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0103', '식재료/장보기', 'C01');

-- C02: 카페
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0201', '커피/음료', 'C02');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0202', '디저트/베이커리', 'C02');

-- C03: 쇼핑
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0301', '의류/신발', 'C03');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0302', '잡화/액세서리', 'C03');

-- C05: 교통
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0501', '대중교통', 'C05');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0502', '주유/톨게이트', 'C05');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0503', '택시/카풀', 'C05');

-- C10: 고정비/구독
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC1001', '통신비', 'C10');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC1002', '스트리밍/앱', 'C10');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC1003', '보험료', 'C10');

-- H02: 디지털/가전 (핫딜)
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SH0201', '컴퓨터/노트북', 'H02');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SH0202', '생활가전', 'H02');

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.BUDGET_GROUP
--  총 10개의 가계부 그룹 데이터를 삽입합니다. (group_id는 IDENTITY로 자동 생성)
--  소유자: U016 ~ U025
--  가계부 스토리: 가족, 신혼, 자취생, 스터디, 차량 등 다양한 목적의 그룹 구성
-- =============================

-- Group 1: U016 (커피잔) 소유 - 가족 공동 생활비
INSERT INTO smaccount.BUDGET_GROUP (group_name, owner_id) VALUES ('[1] 가족 공동 생활비', 'U016');

-- Group 2: U017 (연필심) 소유 - 신혼부부 데이트 비용
INSERT INTO smaccount.BUDGET_GROUP (group_name, owner_id) VALUES ('[2] 신혼부부 데이트 비용', 'U017');

-- Group 3: U018 (그림자) 소유 - 개인 저축 및 비상금
INSERT INTO smaccount.BUDGET_GROUP (group_name, owner_id) VALUES ('[3] 개인 저축 및 비상금', 'U018');

-- Group 4: U019 (구름빵) 소유 - 독서/교육 스터디 그룹
INSERT INTO smaccount.BUDGET_GROUP (group_name, owner_id) VALUES ('[4] 독서/교육 스터디 그룹', 'U019');

-- Group 5: U020 (푸른숲) 소유 - 자취생 식비 절약 챌린지
INSERT INTO smaccount.BUDGET_GROUP (group_name, owner_id) VALUES ('[5] 자취생 식비 절약 챌린지', 'U020');

-- Group 6: U021 (고양이발) 소유 - 직장 동료 점심 식대 정산
INSERT INTO smaccount.BUDGET_GROUP (group_name, owner_id) VALUES ('[6] 직장 동료 점심 식대 정산', 'U021');

-- Group 7: U022 (달팽이) 소유 - 반려동물 용품 공동 구매
INSERT INTO smaccount.BUDGET_GROUP (group_name, owner_id) VALUES ('[7] 반려동물 용품 공동 구매', 'U022');

-- Group 8: U023 (무지개) 소유 - 해외여행 적립금
INSERT INTO smaccount.BUDGET_GROUP (group_name, owner_id) VALUES ('[8] 해외여행 적립금', 'U023');

-- Group 9: U024 (아침이슬) 소유 - 스포츠 취미 활동 비용
INSERT INTO smaccount.BUDGET_GROUP (group_name, owner_id) VALUES ('[9] 스포츠 취미 활동 비용', 'U024');

-- Group 10: U025 (별똥별) 소유 - 차량 유지/관리 그룹
INSERT INTO smaccount.BUDGET_GROUP (group_name, owner_id) VALUES ('[10] 차량 유지/관리 그룹', 'U025');

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.GROUP_MEMBER
--  총 50개의 가계부 그룹 멤버 데이터를 삽입합니다. (group_member_id는 IDENTITY로 자동 생성)
--  수정: ROLE 컬럼 추가 (OWNER 또는 MEMBER)
-- =============================

-- Group 1: [1] 가족 공동 생활비 (Owner: U016) - 5명
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (1, 'U016', 'OWNER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (1, 'U001', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (1, 'U002', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (1, 'U011', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (1, 'U012', 'MEMBER');

-- Group 2: [2] 신혼부부 데이트 비용 (Owner: U017) - 3명
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (2, 'U017', 'OWNER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (2, 'U003', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (2, 'U004', 'MEMBER');

-- Group 3: [3] 개인 저축 및 비상금 (Owner: U018) - 4명
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (3, 'U018', 'OWNER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (3, 'U005', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (3, 'U006', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (3, 'U015', 'MEMBER');

-- Group 4: [4] 독서/교육 스터디 그룹 (Owner: U019) - 6명
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (4, 'U019', 'OWNER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (4, 'U007', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (4, 'U008', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (4, 'U026', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (4, 'U027', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (4, 'U028', 'MEMBER');

-- Group 5: [5] 자취생 식비 절약 챌린지 (Owner: U020) - 5명
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (5, 'U020', 'OWNER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (5, 'U009', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (5, 'U010', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (5, 'U029', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (5, 'U030', 'MEMBER');

-- Group 6: [6] 직장 동료 점심 식대 정산 (Owner: U021) - 6명
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (6, 'U021', 'OWNER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (6, 'U013', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (6, 'U014', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (6, 'U025', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (6, 'U027', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (6, 'U029', 'MEMBER');

-- Group 7: [7] 반려동물 용품 공동 구매 (Owner: U022) - 3명
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (7, 'U022', 'OWNER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (7, 'U026', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (7, 'U028', 'MEMBER');

-- Group 8: [8] 해외여행 적립금 (Owner: U023) - 7명
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (8, 'U023', 'OWNER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (8, 'U001', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (8, 'U002', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (8, 'U003', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (8, 'U004', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (8, 'U005', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (8, 'U006', 'MEMBER');

-- Group 9: [9] 스포츠 취미 활동 비용 (Owner: U024) - 7명
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (9, 'U024', 'OWNER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (9, 'U007', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (9, 'U008', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (9, 'U009', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (9, 'U010', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (9, 'U011', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (9, 'U012', 'MEMBER');

-- Group 10: [10] 차량 유지/관리 그룹 (Owner: U025) - 4명
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (10, 'U025', 'OWNER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (10, 'U013', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (10, 'U014', 'MEMBER');
INSERT INTO smaccount.GROUP_MEMBER (group_id, member_id, role) VALUES (10, 'U015', 'MEMBER');

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.LEDGER_ENTRY - Part 1/3 (총 300개 중 1~100)
--  entry_id는 IDENTITY로 자동 생성됩니다.
--  기간: 2025년 1월 ~ 10월 랜덤 분산
--  참조: Group ID (1~10), Category ID (C01~C13)
-- =============================

-- Group 1: 가족 공동 생활비 (U016, U018 등)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 75000.00, DATE '2025-01-08', '대형마트', '주간 식재료 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C04', 12000.00, DATE '2025-02-15', '다이소', '생활용품');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U002', 'EXPENSE', 'CASH', NULL, 'C12', 150000.00, DATE '2025-03-05', '한국전력', '전기세 납부');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 50000.00, DATE '2025-04-10', '주유소', '차량 주유');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U011', 'EXPENSE', 'CARD', 'CHECK', 'C08', 45000.00, DATE '2025-05-15', '키즈카페', '아이들과 여가');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U012', 'EXPENSE', 'CARD', 'CREDIT', 'C06', 40000.00, DATE '2025-06-04', '소아과', '아이 감기 진료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C06', 80000.00, DATE '2025-07-22', '치과', '정기 검진');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U001', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 50000.00, DATE '2025-08-10', '통신사', '인터넷 요금');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U016', 'EXPENSE', 'CASH', NULL, 'C01', 18000.00, DATE '2025-09-06', '재래시장', '반찬');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U012', 'EXPENSE', 'CARD', 'CHECK', 'C06', 15000.00, DATE '2025-10-08', '약국', '감기약');

-- Group 2: 신혼부부 데이트 비용 (U017, U003, U004)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 65000.00, DATE '2025-01-03', '레스토랑', '주말 저녁 외식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C02', 12000.00, DATE '2025-02-04', '브런치 카페', '데이트 커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 150000.00, DATE '2025-03-11', '뮤지컬', '문화 생활');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CASH', NULL, 'C03', 80000.00, DATE '2025-04-20', '백화점', '기념품 쇼핑');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 8000.00, DATE '2025-05-14', '체인점 카페', '오후 커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U003', 'EXPENSE', 'CASH', NULL, 'C01', 7000.00, DATE '2025-06-08', '분식', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 50000.00, DATE '2025-07-09', '공연', '티켓');

-- Group 3: 개인 저축 및 비상금 (U018, U005, U006, U015)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'CASH', NULL, 'C11', 3500000.00, DATE '2025-01-25', '회사', '정기 급여 입금', 'OPEN_FIN');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'CARD', 'CHECK', 'C11', 1500000.00, DATE '2025-02-25', '정기적금', '자동 이체');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'EXPENSE', 'CASH', NULL, 'C11', 500000.00, DATE '2025-03-26', '비상금 계좌', '비상금 이체');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U015', 'EXPENSE', 'CASH', NULL, 'C11', 100000.00, DATE '2025-04-01', '투자', '소액 펀드');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U005', 'EXPENSE', 'CARD', 'CHECK', 'C03', 15000.00, DATE '2025-05-03', '온라인 쇼핑', '이어폰 구매');

-- Group 4: 독서/교육 스터디 그룹 (U019, U030, U031, U026, U027, U028)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 45000.00, DATE '2025-01-08', '온라인 강의', 'IT 스터디 강의 결제');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C07', 25000.00, DATE '2025-02-12', '교보문고', '스터디 도서 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U026', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 12000.00, DATE '2025-03-01', '음악 앱', '구독료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U028', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 10000.00, DATE '2025-04-04', '온라인', '문제집');

-- Group 5: 자취생 식비 절약 챌린지 (U020, U009, U010, U029, U030)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 15000.00, DATE '2025-01-05', 'GS25', '도시락 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U009', 'EXPENSE', 'CASH', NULL, 'C02', 4500.00, DATE '2025-02-06', '학교 앞 카페', '아메리카노');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U010', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 18000.00, DATE '2025-03-01', '배달앱', '치킨');

-- Group 6: 직장 동료 점심 식대 정산 (U021, U013, U014, U025, U027, U029)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U021', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 48000.00, DATE '2025-01-02', '팀장님 밥집', '팀 점심 식대');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C02', 18000.00, DATE '2025-02-02', '회사 앞 카페', '팀원 커피 5잔');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 60000.00, DATE '2025-03-03', '중국집', '회식');

-- Group 7: 반려동물 용품 공동 구매 (U022, U026, U028)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 85000.00, DATE '2025-01-10', '온라인 펫샵', '사료 공동 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C09', 30000.00, DATE '2025-02-15', '동물병원', '정기 접종');

-- Group 8: 해외여행 적립금 (U023, U001, U002, U003, U004, U005, U006)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C11', 500000.00, DATE '2025-01-01', '여행 적금 계좌', '매월 적립');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U001', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 350000.00, DATE '2025-02-20', '항공사', '항공권 예약금');

-- Group 9: 스포츠 취미 활동 비용 (U024, U007, U008, U009, U010, U011, U012)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U024', 'EXPENSE', 'CASH', NULL, 'C08', 20000.00, DATE '2025-01-05', '실내 암벽장', '일일 이용권');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C03', 150000.00, DATE '2025-02-15', '스포츠 매장', '런닝화 구매');

-- Group 10: 차량 유지/관리 그룹 (U025, U013, U014, U015)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 90000.00, DATE '2025-01-08', '카센터', '엔진 오일 교체');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C05', 65000.00, DATE '2025-02-18', '고속도로', '하이패스 충전');

-- 나머지 80개 내역 (2025년 1월 ~ 10월 랜덤 분산)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U012', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 15000.00, DATE '2025-03-03', '슈퍼', '생활용품');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U004', 'EXPENSE', 'CASH', NULL, 'C01', 8000.00, DATE '2025-04-28', '편의점', '간식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U005', 'EXPENSE', 'CARD', 'CHECK', 'C11', 10000.00, DATE '2025-05-05', '은행', '이체 수수료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U026', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 30000.00, DATE '2025-06-21', '서점', '전문서적');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C04', 12000.00, DATE '2025-07-14', '다이소', '잡화');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U025', 'EXPENSE', 'CASH', NULL, 'C02', 4500.00, DATE '2025-08-20', '카페', '커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U028', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 15000.00, DATE '2025-09-27', '용품점', '간식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00, DATE '2025-10-18', '미술관', '입장료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U009', 'EXPENSE', 'CASH', NULL, 'C08', 10000.00, DATE '2025-01-09', '공원', '운동');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 12000.00, DATE '2025-02-16', '택시', '택시비');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C03', 25000.00, DATE '2025-03-14', '온라인 마켓', '책상 정리대');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U004', 'EXPENSE', 'CASH', NULL, 'C01', 40000.00, DATE '2025-04-19', '고급 뷔페', '주말 데이트');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U006', 'EXPENSE', 'CASH', NULL, 'C04', 10000.00, DATE '2025-05-23', '세탁소', '세탁');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U007', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 5000.00, DATE '2025-06-18', '도서관', '모임방 이용료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C02', 8000.00, DATE '2025-07-09', '편의점', '커피 2잔');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U027', 'EXPENSE', 'CASH', NULL, 'C01', 12000.00, DATE '2025-08-17', '점심 식당', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U028', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 20000.00, DATE '2025-09-19', '병원', '검진');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U001', 'EXPENSE', 'CARD', 'CHECK', 'C08', 15000.00, DATE '2025-10-13', '여행가이드', '가이드북 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U008', 'EXPENSE', 'CASH', NULL, 'C08', 5000.00, DATE '2025-01-21', '수영장', '입장료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 40000.00, DATE '2025-02-16', '세차장', '광택 세차');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U002', 'EXPENSE', 'CASH', NULL, 'C01', 18000.00, DATE '2025-03-06', '정육점', '고기');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 150000.00, DATE '2025-04-29', '백화점', '선물 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U006', 'EXPENSE', 'CARD', 'CHECK', 'C04', 30000.00, DATE '2025-05-19', '가구점', '수납함');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U008', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 10000.00, DATE '2025-06-04', '온라인', '문제집');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U030', 'EXPENSE', 'CASH', NULL, 'C01', 6000.00, DATE '2025-07-07', '편의점', '삼각김밥');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C02', 8000.00, DATE '2025-08-11', '커피숍', '카페');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U026', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 50000.00, DATE '2025-09-22', '온라인', '사료 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C08', 50000.00, DATE '2025-10-09', '박물관', '입장권');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U007', 'EXPENSE', 'CASH', NULL, 'C08', 10000.00, DATE '2025-01-26', '축구장', '입장료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 15000.00, DATE '2025-02-03', '택시', '택시');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C06', 12000.00, DATE '2025-03-09', '약국', '영양제');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U004', 'EXPENSE', 'CASH', NULL, 'C02', 8000.00, DATE '2025-04-27', '카페', '커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U015', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 15000.00, DATE '2025-05-17', '온라인', '잡화');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C07', 3000.00, DATE '2025-06-28', '문구점', '펜');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U029', 'EXPENSE', 'CASH', NULL, 'C01', 9000.00, DATE '2025-07-04', '김밥', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 30000.00, DATE '2025-08-05', '온라인', '운동복');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U028', 'EXPENSE', 'CARD', 'CHECK', 'C09', 50000.00, DATE '2025-09-07', '용품', '사료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U003', 'EXPENSE', 'CASH', NULL, 'C08', 12000.00, DATE '2025-10-03', '관광지', '입장권');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U011', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 45000.00, DATE '2025-01-27', '온라인 쇼핑', '운동복');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CHECK', 'C05', 50000.00, DATE '2025-02-28', '주유소', '주유');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U026', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 15000.00, DATE '2025-04-03', '슈퍼', '생활용품');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U003', 'EXPENSE', 'CASH', NULL, 'C01', 8000.00, DATE '2025-05-28', '편의점', '간식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C11', 10000.00, DATE '2025-06-05', '은행', '이체 수수료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U019', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 30000.00, DATE '2025-07-21', '서점', '전문서적');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C04', 12000.00, DATE '2025-08-14', '다이소', '잡화');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U013', 'EXPENSE', 'CASH', NULL, 'C02', 4500.00, DATE '2025-09-20', '카페', '커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U026', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 15000.00, DATE '2025-10-27', '용품점', '간식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00, DATE '2025-01-18', '미술관', '입장료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U009', 'EXPENSE', 'CASH', NULL, 'C08', 10000.00, DATE '2025-02-09', '공원', '운동');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U013', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 12000.00, DATE '2025-03-16', '택시', '택시비');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U001', 'EXPENSE', 'CARD', 'CHECK', 'C03', 25000.00, DATE '2025-04-14', '온라인 마켓', '책상 정리대');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U003', 'EXPENSE', 'CASH', NULL, 'C01', 40000.00, DATE '2025-05-19', '고급 뷔페', '주말 데이트');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U005', 'EXPENSE', 'CASH', NULL, 'C04', 10000.00, DATE '2025-06-23', '세탁소', '세탁');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 5000.00, DATE '2025-07-18', '도서관', '모임방 이용료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 8000.00, DATE '2025-08-09', '편의점', '커피 2잔');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U029', 'EXPENSE', 'CASH', NULL, 'C01', 12000.00, DATE '2025-09-17', '점심 식당', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U026', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 20000.00, DATE '2025-10-19', '병원', '검진');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U001', 'EXPENSE', 'CARD', 'CHECK', 'C08', 15000.00, DATE '2025-01-13', '여행가이드', '가이드북 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U008', 'EXPENSE', 'CASH', NULL, 'C08', 5000.00, DATE '2025-02-21', '수영장', '입장료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 40000.00, DATE '2025-03-16', '세차장', '광택 세차');

-- =============================
--  DUMMY DATA: smaccount.LEDGER_ENTRY - Part 2/3 (총 300개 중 101~200)
--  entry_id는 IDENTITY로 자동 생성됩니다.
--  기간: 2025년 1월 ~ 10월 랜덤 분산
--  참조: Group ID (1~10), Category ID (C01~C13)
-- =============================

-- Group 1: 가족 공동 생활비 (U016, U018 등)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U011', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 15000.00, DATE '2025-01-03', '슈퍼', '생활용품');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U012', 'EXPENSE', 'CARD', 'CHECK', 'C01', 18000.00, DATE '2025-02-07', '반찬가게', '저녁 반찬');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CASH', NULL, 'C12', 120000.00, DATE '2025-03-20', '도시가스', '가스비 납부');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 45000.00, DATE '2025-04-15', '주유소', '주유');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U001', 'EXPENSE', 'CARD', 'CHECK', 'C06', 7000.00, DATE '2025-05-01', '약국', '영양제');

-- Group 2: 신혼부부 데이트 비용 (U017, U003, U004)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CASH', NULL, 'C02', 15000.00, DATE '2025-06-19', '카페', '커피와 케이크');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 180000.00, DATE '2025-07-25', '백화점', '선물 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C08', 35000.00, DATE '2025-08-08', '만화카페', '데이트');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CASH', NULL, 'C01', 10000.00, DATE '2025-09-14', '분식집', '점심 식사');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 75000.00, DATE '2025-10-30', '콘서트', '티켓 구매');

-- Group 3: 개인 저축 및 비상금 (U018, U005, U006, U015)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U018', 'INCOME', 'CARD', 'CHECK', 'C11', 40000.00, DATE '2025-01-15', '투자앱', '배당금 입금', 'OPEN_FIN');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U005', 'EXPENSE', 'CARD', 'CREDIT', 'C11', 200000.00, DATE '2025-02-01', 'CMA', '저축 이체');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U006', 'EXPENSE', 'CASH', NULL, 'C03', 15000.00, DATE '2025-03-09', '문구점', '사무용품');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U015', 'EXPENSE', 'CARD', 'CHECK', 'C06', 25000.00, DATE '2025-04-18', '약국', '감기약');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 5000.00, DATE '2025-05-29', '편의점', '건전지');

-- Group 4: 독서/교육 스터디 그룹 (U019, U030, U031, U026, U027, U028)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C07', 8000.00, DATE '2025-06-05', '온라인', '문제집');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U028', 'EXPENSE', 'CASH', NULL, 'C07', 15000.00, DATE '2025-07-16', '교보문고', '전공 도서');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U019', 'EXPENSE', 'CARD', 'CREDIT', 'C10', 10000.00, DATE '2025-08-01', '구독 서비스', '교육 앱 구독료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C07', 20000.00, DATE '2025-09-11', '스터디룸', '모임방 대여');

-- Group 5: 자취생 식비 절약 챌린지 (U020, U009, U010, U029, U030)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CASH', NULL, 'C01', 5000.00, DATE '2025-10-02', '편의점', '삼각김밥');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 3900.00, DATE '2025-01-14', '테이크아웃', '출근길 커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12000.00, DATE '2025-02-23', '마트', '식재료');

-- Group 6: 직장 동료 점심 식대 정산 (U021, U013, U014, U025, U027, U029)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 55000.00, DATE '2025-03-07', '퓨전 한식', '팀 점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C02', 20000.00, DATE '2025-04-01', '카페', '손님 접대 커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U027', 'EXPENSE', 'CASH', NULL, 'C01', 15000.00, DATE '2025-05-16', '편의점', '간단 점심');

-- Group 7: 반려동물 용품 공동 구매 (U022, U026, U028)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U028', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 20000.00, DATE '2025-06-21', '애견 카페', '입장료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C09', 10000.00, DATE '2025-07-01', '온라인', '간식');

-- Group 8: 해외여행 적립금 (U023, U001, U002, U003, U004, U005, U006)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U006', 'INCOME', 'CASH', NULL, 'C11', 150000.00, DATE '2025-08-25', '은행', '외화 환전 잔액');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U002', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 5000.00, DATE '2025-09-08', '기념품샵', '엽서 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C05', 30000.00, DATE '2025-10-17', '공항 리무진', '교통비');

-- Group 9: 스포츠 취미 활동 비용 (U024, U007, U008, U009, U010, U011, U012)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U012', 'EXPENSE', 'CASH', NULL, 'C08', 15000.00, DATE '2025-01-20', '볼링장', '게임비');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 70000.00, DATE '2025-02-10', '온라인', '등산복');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U008', 'EXPENSE', 'CARD', 'CHECK', 'C07', 40000.00, DATE '2025-03-25', '체육관', '단기 강습');

-- Group 10: 차량 유지/관리 그룹 (U025, U013, U014, U015)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 100000.00, DATE '2025-04-05', '카센터', '타이어 교체');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CHECK', 'C12', 250000.00, DATE '2025-05-01', '시청', '자동차세');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U014', 'EXPENSE', 'CASH', NULL, 'C05', 8000.00, DATE '2025-06-12', '주차장', '일일 주차권');

-- 나머지 내역 77개 (랜덤)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 75000.00, DATE '2025-07-01', '온라인', '옷 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C01', 30000.00, DATE '2025-08-05', '음식점', '점심 식사');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U018', 'INCOME', 'CASH', NULL, 'C13', 20000.00, DATE '2025-09-10', '중고거래', '판매 수입');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U019', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 5000.00, DATE '2025-10-15', '문구점', '노트 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C02', 6000.00, DATE '2025-01-22', '카페', '커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U021', 'EXPENSE', 'CASH', NULL, 'C01', 9000.00, DATE '2025-02-09', '식당', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 100000.00, DATE '2025-03-17', '동물병원', '정기 검진');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C11', 100000.00, DATE '2025-04-01', '은행', '여행 자금 이체');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U024', 'EXPENSE', 'CASH', NULL, 'C08', 30000.00, DATE '2025-05-26', '테니스장', '이용료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 15000.00, DATE '2025-06-10', '주차장', '월 주차');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C04', 5000.00, DATE '2025-07-19', '편의점', '잡화');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U017', 'EXPENSE', 'CASH', NULL, 'C01', 12000.00, DATE '2025-08-28', '분식집', '야식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U006', 'INCOME', 'CARD', 'CREDIT', 'C11', 80000.00, DATE '2025-09-01', '프리랜서', '외주 수입');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CHECK', 'C07', 15000.00, DATE '2025-10-25', '교보문고', '서적 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U009', 'EXPENSE', 'CASH', NULL, 'C02', 4000.00, DATE '2025-01-05', '카페', '커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 35000.00, DATE '2025-02-14', '식당', '팀 회식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C09', 5000.00, DATE '2025-03-01', '편의점', '간식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U005', 'EXPENSE', 'CASH', NULL, 'C08', 20000.00, DATE '2025-04-08', '여행 잡지', '구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U010', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 80000.00, DATE '2025-05-30', '캠핑장', '예약금');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C05', 3000.00, DATE '2025-06-03', '버스', '교통비');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U016', 'EXPENSE', 'CASH', NULL, 'C06', 10000.00, DATE '2025-07-28', '약국', '감기약');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 45000.00, DATE '2025-08-15', '온라인', '잡화 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C11', 5000.00, DATE '2025-09-02', '은행', '이체 수수료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U028', 'EXPENSE', 'CASH', NULL, 'C07', 12000.00, DATE '2025-10-10', '복사집', '프린트 비용');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 7500.00, DATE '2025-01-18', '배달앱', '할인 받아 주문');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 11000.00, DATE '2025-02-05', '식당', '점심 정산');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U022', 'EXPENSE', 'CASH', NULL, 'C09', 80000.00, DATE '2025-03-25', '온라인', '고급 사료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U006', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 120000.00, DATE '2025-04-20', '호텔', '숙소 예약');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U011', 'EXPENSE', 'CARD', 'CHECK', 'C03', 50000.00, DATE '2025-05-15', '스포츠 마트', '장비');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U025', 'EXPENSE', 'CASH', NULL, 'C05', 4000.00, DATE '2025-06-01', '주차장', '주차비');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U001', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 35000.00, DATE '2025-07-15', '외식', '주말 저녁');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C02', 9000.00, DATE '2025-08-11', '커피숍', '커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U005', 'EXPENSE', 'CASH', NULL, 'C11', 20000.00, DATE '2025-09-05', '펀드', '추가 납입');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U031', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 15000.00, DATE '2025-10-18', '온라인', '강의 결제');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C04', 5000.00, DATE '2025-01-01', '편의점', '생필품');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U013', 'EXPENSE', 'CASH', NULL, 'C01', 8500.00, DATE '2025-02-28', '한식', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U028', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 12000.00, DATE '2025-03-10', '약국', '영양제');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U003', 'EXPENSE', 'CARD', 'CHECK', 'C08', 80000.00, DATE '2025-04-05', '여행사', '투어 예약');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U006', 'EXPENSE', 'CASH', NULL, 'C08', 25000.00, DATE '2025-05-18', '볼링장', '게임비');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 55000.00, DATE '2025-06-22', '정비소', '경정비');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C01', 40000.00, DATE '2025-07-07', '식당', '가족 외식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U004', 'EXPENSE', 'CASH', NULL, 'C02', 9500.00, DATE '2025-08-01', '베이커리', '빵과 커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U015', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 120000.00, DATE '2025-09-12', '온라인', '의류 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C07', 25000.00, DATE '2025-10-20', '강의', '세미나 등록');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U029', 'EXPENSE', 'CASH', NULL, 'C01', 6500.00, DATE '2025-01-11', '편의점', '저녁');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C02', 15000.00, DATE '2025-02-19', '스타벅스', '단체 커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C09', 40000.00, DATE '2025-03-08', '미용실', '애견 미용');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U023', 'EXPENSE', 'CASH', NULL, 'C11', 500000.00, DATE '2025-04-01', '은행', '여행자금 이체');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U009', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 90000.00, DATE '2025-05-05', '여행사', '주말 여행 예약');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C05', 7000.00, DATE '2025-06-25', '대중교통', '충전');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U002', 'EXPENSE', 'CASH', NULL, 'C01', 15000.00, DATE '2025-07-02', '식당', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 30000.00, DATE '2025-08-09', '영화관', '영화 관람');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U006', 'EXPENSE', 'CARD', 'CHECK', 'C11', 1000.00, DATE '2025-09-01', '주식앱', '수수료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U008', 'EXPENSE', 'CASH', NULL, 'C07', 20000.00, DATE '2025-10-14', '서점', '책 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 12000.00, DATE '2025-01-29', '배달', '야식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U029', 'EXPENSE', 'CARD', 'CHECK', 'C01', 13000.00, DATE '2025-02-25', '식당', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U022', 'EXPENSE', 'CASH', NULL, 'C09', 50000.00, DATE '2025-03-05', '온라인', '장난감');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U006', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 25000.00, DATE '2025-04-10', '테마파크', '입장권');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C08', 10000.00, DATE '2025-05-08', '카페', '모임');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U014', 'EXPENSE', 'CASH', NULL, 'C05', 5000.00, DATE '2025-06-07', '버스', '교통비');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 18000.00, DATE '2025-07-06', '온라인', '세제');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U019', 'EXPENSE', 'CARD', 'CHECK', 'C03', 20000.00, DATE '2025-08-20', '잡화', '액세서리');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U015', 'INCOME', 'CASH', NULL, 'C11', 150000.00, DATE '2025-09-15', '주식', '매도 이익');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 45000.00, DATE '2025-10-01', '강의', '프로그래밍 강의');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 10000.00, DATE '2025-01-25', '식당', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U021', 'EXPENSE', 'CASH', NULL, 'C01', 14000.00, DATE '2025-02-07', '국밥', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U026', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 3000.00, DATE '2025-03-20', '편의점', '간식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00, DATE '2025-04-16', '관광지', '입장료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U024', 'EXPENSE', 'CASH', NULL, 'C08', 40000.00, DATE '2025-05-02', '암벽장', '이용권');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 10000.00, DATE '2025-06-08', '버스', '교통카드 충전');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U016', 'EXPENSE', 'CARD', 'CHECK', 'C06', 70000.00, DATE '2025-07-29', '병원', '진료비');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U003', 'EXPENSE', 'CASH', NULL, 'C01', 6000.00, DATE '2025-08-04', '김밥', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U006', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 15000.00, DATE '2025-09-11', '온라인', '잡화 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U007', 'EXPENSE', 'CARD', 'CHECK', 'C07', 50000.00, DATE '2025-10-05', '학원', '수강료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U010', 'EXPENSE', 'CASH', NULL, 'C01', 11000.00, DATE '2025-01-26', '식당', '저녁');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 40000.00, DATE '2025-02-04', '중국집', '팀 점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CHECK', 'C09', 10000.00, DATE '2025-03-27', '용품점', '간식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U003', 'EXPENSE', 'CASH', NULL, 'C08', 5000.00, DATE '2025-04-11', '기념품', '구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U008', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 120000.00, DATE '2025-05-09', '온라인', '스포츠 의류');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CHECK', 'C05', 4000.00, DATE '2025-06-19', '버스', '교통비');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U018', 'EXPENSE', 'CASH', NULL, 'C12', 30000.00, DATE '2025-07-03', '수도국', '수도요금');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 60000.00, DATE '2025-08-25', '공연장', '티켓 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U006', 'EXPENSE', 'CARD', 'CHECK', 'C03', 25000.00, DATE '2025-09-16', '온라인', '잡화 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U026', 'EXPENSE', 'CASH', NULL, 'C07', 8000.00, DATE '2025-10-24', '복사집', '프린트 비용');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 9500.00, DATE '2025-01-21', '배달앱', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U023', 'EXPENSE', 'CARD', 'CHECK', 'C01', 18000.00, DATE '2025-02-12', '이탈리안', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U026', 'EXPENSE', 'CASH', NULL, 'C09', 15000.00, DATE '2025-03-08', '간식', '개껌');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U001', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 30000.00, DATE '2025-04-04', '미술관', '입장료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U008', 'EXPENSE', 'CARD', 'CHECK', 'C08', 15000.00, DATE '2025-05-01', '요가', '수업료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U013', 'EXPENSE', 'CASH', NULL, 'C05', 10000.00, DATE '2025-06-28', '택시', '택시비');

-- =============================
--  DUMMY DATA: smaccount.LEDGER_ENTRY - Part 3/3 (총 300개 중 201~300)
--  entry_id는 IDENTITY로 자동 생성됩니다.
--  기간: 2025년 1월 ~ 10월 랜덤 분산
--  참조: Group ID (1~10), Category ID (C01~C13)
-- =============================

-- Group 1: 가족 공동 생활비 (U016, U018 등)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U011', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 15000.00, DATE '2025-01-03', '슈퍼', '생활용품');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U012', 'EXPENSE', 'CARD', 'CHECK', 'C01', 18000.00, DATE '2025-02-07', '반찬가게', '저녁 반찬');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U016', 'EXPENSE', 'CASH', NULL, 'C12', 120000.00, DATE '2025-03-20', '도시가스', '가스비 납부');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 45000.00, DATE '2025-04-15', '주유소', '주유');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (1, 'U001', 'EXPENSE', 'CARD', 'CHECK', 'C06', 7000.00, DATE '2025-05-01', '약국', '영양제');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U002', 'EXPENSE', 'CASH', NULL, 'C01', 15000.00, DATE '2025-06-11', '정육점', '고기');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U011', 'EXPENSE', 'CARD', 'CREDIT', 'C04', 18000.00, DATE '2025-07-28', '온라인 쇼핑', '세제');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U012', 'EXPENSE', 'CARD', 'CHECK', 'C03', 45000.00, DATE '2025-08-16', '백화점', '잡화');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U016', 'EXPENSE', 'CASH', NULL, 'C10', 10000.00, DATE '2025-09-01', '스트리밍', '구독료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C06', 60000.00, DATE '2025-10-10', '병원', '예방 접종');

-- Group 2: 신혼부부 데이트 비용 (U017, U003, U004)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C01', 12000.00, DATE '2025-01-19', '편의점', '간단 식사');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U004', 'EXPENSE', 'CASH', NULL, 'C02', 7000.00, DATE '2025-02-05', '카페', '커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (2, 'U003', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 15000.00, DATE '2025-03-28', '온라인 쇼핑', '잡화');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CHECK', 'C08', 40000.00, DATE '2025-04-12', '볼링장', '데이트');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U004', 'EXPENSE', 'CASH', NULL, 'C01', 15000.00, DATE '2025-05-07', '배달앱', '야식');

-- Group 3: 개인 저축 및 비상금 (U018, U005, U006, U015)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo, ext_src)
VALUES (3, 'U006', 'INCOME', 'CASH', NULL, 'C11', 150000.00, DATE '2025-06-15', '주식앱', '배당금', 'OPEN_FIN');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (3, 'U015', 'EXPENSE', 'CARD', 'CREDIT', 'C11', 500000.00, DATE '2025-07-01', '펀드', '추가 적립');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U018', 'EXPENSE', 'CARD', 'CHECK', 'C11', 10000.00, DATE '2025-08-10', '은행', '수수료');

-- Group 4: 독서/교육 스터디 그룹 (U019, U030, U031, U026, U027, U028)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U026', 'EXPENSE', 'CASH', NULL, 'C07', 8000.00, DATE '2025-09-03', '독서실', '이용료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (4, 'U027', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 20000.00, DATE '2025-10-21', '서점', '책 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U028', 'EXPENSE', 'CARD', 'CHECK', 'C07', 5000.00, DATE '2025-01-28', '문구점', '필기구');

-- Group 5: 자취생 식비 절약 챌린지 (U020, U009, U010, U029, U030)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U010', 'EXPENSE', 'CASH', NULL, 'C04', 7000.00, DATE '2025-02-14', '다이소', '생활 잡화');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (5, 'U029', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 12000.00, DATE '2025-03-09', '배달앱', '점심 특가');

-- Group 6: 직장 동료 점심 식대 정산 (U021, U013, U014, U025, U027, U029)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U027', 'EXPENSE', 'CARD', 'CHECK', 'C01', 14000.00, DATE '2025-04-04', '한식당', '팀 점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (6, 'U029', 'EXPENSE', 'CASH', NULL, 'C02', 3500.00, DATE '2025-05-20', '회사 앞 카페', '커피');

-- Group 7: 반려동물 용품 공동 구매 (U022, U026, U028)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U022', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 5000.00, DATE '2025-06-02', '편의점', '간식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (7, 'U026', 'EXPENSE', 'CARD', 'CHECK', 'C09', 12000.00, DATE '2025-07-18', '온라인', '장난감');

-- Group 8: 해외여행 적립금 (U023, U001, U002, U003, U004, U005, U006)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U004', 'EXPENSE', 'CASH', NULL, 'C08', 50000.00, DATE '2025-08-05', '환전소', '소액 환전');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (8, 'U005', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 150000.00, DATE '2025-09-10', '여행사', '패키지 투어');

-- Group 9: 스포츠 취미 활동 비용 (U024, U007, U008, U009, U010, U011, U012)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (9, 'U010', 'EXPENSE', 'CARD', 'CHECK', 'C08', 35000.00, DATE '2025-10-22', '클라이밍', '일일 체험');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U011', 'EXPENSE', 'CASH', NULL, 'C03', 200000.00, DATE '2025-01-17', '스포츠 매장', '장비 구매');

-- Group 10: 차량 유지/관리 그룹 (U025, U013, U014, U015)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo)
VALUES (10, 'U025', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 40000.00, DATE '2025-02-09', '주유소', '주유');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C12', 150000.00, DATE '2025-03-24', '시청', '환경 부담금');

-- 나머지 내역 88개 (랜덤 분산)
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U002', 'EXPENSE', 'CASH', NULL, 'C01', 10000.00, DATE '2025-04-04', '편의점', '간식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U017', 'EXPENSE', 'CARD', 'CREDIT', 'C08', 50000.00, DATE '2025-05-18', '영화관', '주말 영화');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U006', 'EXPENSE', 'CARD', 'CHECK', 'C06', 15000.00, DATE '2025-06-29', '약국', '상비약');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U026', 'EXPENSE', 'CASH', NULL, 'C07', 30000.00, DATE '2025-07-03', '서점', '참고서');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CREDIT', 'C03', 45000.00, DATE '2025-08-12', '온라인', '옷');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U013', 'EXPENSE', 'CARD', 'CHECK', 'C01', 18000.00, DATE '2025-09-06', '퓨전 식당', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U022', 'EXPENSE', 'CASH', NULL, 'C09', 10000.00, DATE '2025-10-19', '펫샵', '간식');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U002', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 25000.00, DATE '2025-01-25', '철도청', '기차표');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U009', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00, DATE '2025-02-28', '공원', '음료수');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U014', 'EXPENSE', 'CASH', NULL, 'C05', 10000.00, DATE '2025-03-18', '택시', '심야 할증');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U018', 'EXPENSE', 'CARD', 'CREDIT', 'C01', 20000.00, DATE '2025-04-06', '마트', '식재료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U004', 'EXPENSE', 'CARD', 'CHECK', 'C02', 4500.00, DATE '2025-05-10', '카페', '커피');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U015', 'EXPENSE', 'CASH', NULL, 'C03', 50000.00, DATE '2025-06-01', '인터넷', '잡화 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U030', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 18000.00, DATE '2025-07-09', '도서관', '모임방 이용료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U020', 'EXPENSE', 'CARD', 'CHECK', 'C01', 8000.00, DATE '2025-08-22', '식당', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U029', 'EXPENSE', 'CASH', NULL, 'C01', 11500.00, DATE '2025-09-04', '식당', '점심 정산');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U028', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 25000.00, DATE '2025-10-11', '병원', '검진');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U001', 'EXPENSE', 'CARD', 'CHECK', 'C08', 5000.00, DATE '2025-01-19', '미술관', '입장료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U008', 'EXPENSE', 'CASH', NULL, 'C08', 10000.00, DATE '2025-02-25', '수영장', '입장료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U015', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 12000.00, DATE '2025-03-10', '택시', '택시비');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (1, 'U002', 'EXPENSE', 'CARD', 'CHECK', 'C03', 25000.00, DATE '2025-04-14', '온라인 마켓', '책상 정리대');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (2, 'U004', 'EXPENSE', 'CASH', NULL, 'C01', 40000.00, DATE '2025-05-19', '고급 뷔페', '주말 데이트');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (3, 'U006', 'EXPENSE', 'CASH', NULL, 'C04', 10000.00, DATE '2025-06-23', '세탁소', '세탁');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (4, 'U008', 'EXPENSE', 'CARD', 'CREDIT', 'C07', 5000.00, DATE '2025-07-18', '도서관', '모임방 이용료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (5, 'U030', 'EXPENSE', 'CARD', 'CHECK', 'C02', 8000.00, DATE '2025-08-09', '편의점', '커피 2잔');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (6, 'U029', 'EXPENSE', 'CASH', NULL, 'C01', 12000.00, DATE '2025-09-17', '점심 식당', '점심');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (7, 'U026', 'EXPENSE', 'CARD', 'CREDIT', 'C09', 20000.00, DATE '2025-10-19', '병원', '검진');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (8, 'U001', 'EXPENSE', 'CARD', 'CHECK', 'C08', 15000.00, DATE '2025-01-13', '여행가이드', '가이드북 구매');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (9, 'U008', 'EXPENSE', 'CASH', NULL, 'C08', 5000.00, DATE '2025-02-21', '수영장', '입장료');
INSERT INTO smaccount.LEDGER_ENTRY (group_id, member_id, entry_type, pay_type, card_type, category_id, entry_amount, occurred_at, place_of_use, memo) VALUES (10, 'U014', 'EXPENSE', 'CARD', 'CREDIT', 'C05', 40000.00, DATE '2025-03-16', '세차장', '광택 세차');

-- =============================
--  DUMMY DATA: smaccount.BOARD_POST (게시글)
--  총 35개의 게시글 데이터를 삽입합니다. (post_id는 IDENTITY로 자동 생성)
--  카테고리: 자유게시판, 가계부 팁, 핫딜 정보
--  참조: writer_id (MEMBER 테이블)
--  주의: 내용의 작은따옴표(')는 이중따옴표('')로 처리되었습니다.
-- =============================

-- ADMIN (U001: 샛별, U002: 해찬, U003: 달무리)
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '서비스 개선 요청 및 버그 보고', '최근 업데이트된 기능 중 오류가 발견되어 문의 드립니다. 특히 ''API 연동'' 부분에서 오류가 자주 발생합니다.', 'U001', 180);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '2025년 가계부 계획: 예산 책정 시 고려할 5가지 요소', '내년도 가계부 계획을 위한 전문가의 팁입니다. 항목별 예산 비율을 확인하세요.', 'U002', 450);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '운영자가 추천하는 절세 노하우 공유', '놓치기 쉬운 연말 소득 공제 항목들을 정리했습니다. 반드시 ''확인''하세요.', 'U003', 380);

-- SELLER (U006: 황금손, U009: 꿀단지, U013: 미소상점, U014: 새벽시장, U015: 완판녀) - 핫딜 정보 분리 전 데이터로 가정하고 유지
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '[황금손] 신선한 과일 3종 한정 핫딜!', '오늘 새벽 수확한 제철 과일 모음 핫딜! 재고 200개 한정 판매합니다.', 'U006', 700);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '[꿀단지] 4K 모니터 27인치 특가!', '재택 근무 필수템! 초고화질 모니터를 한정 수량 판매합니다. ''최저가'' 보장합니다.', 'U009', 950);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '[미소상점] 여성 겨울 부츠/신발 대규모 할인전', '미소상점에서 겨울 신상품을 최대 70%까지 할인합니다. 사이즈 ''품절'' 주의!', 'U013', 620);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '[새벽시장] 인스턴트 커피/티 대용량 번들 핫딜', '사무실/가정용 대용량 커피 및 차를 저렴하게 구매하세요. 유통기한 ''넉넉''합니다.', 'U014', 490);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '[완판녀] 인기 육아용품(기저귀, 분유) 선착순 핫딜', '맘카페 인기 육아용품을 빠르게 겟하세요! 1인당 2개 한정. ''품절임박''.', 'U015', 880);

-- GENERAL MEMBER (일반 회원 글)
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '커피값 절약 노하우: 텀블러 사용 & 편의점 커피 활용', '매일 마시는 커피값만 줄여도 연말에 큰 돈이 모입니다. 저의 ''절약 루틴''을 공유해요.', 'U016', 310);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '신혼 가구 구매 비용, 어느 카테고리에 넣어야 할까요?', '가구/인테리어 vs 생활/가정? ''고민''입니다.', 'U017', 150);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '자취생 냉장고 파먹기 챌린지 1주차 후기', '식재료 낭비 없이 알뜰하게 요리하는 방법 공유. ''이거'' 모르면 손해예요!', 'U020', 550);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '재테크 입문자, 첫 투자 상품 추천해주세요!', '주식, 펀드, 적금 중 어떤 것으로 시작해야 할지 모르겠습니다. ''전문가'' 조언 환영합니다.', 'U025', 290);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '월별 소비패턴 분석 리포트, 어떻게 활용해야 할까요?', '리포트는 받았는데 어떻게 ''개선''해야 할지 막막합니다.', 'U040', 170);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '나만의 비상금 통장 운영 방법', '급여 통장과 분리하여 비상금을 모으는 ''노하우''를 공개합니다.', 'U081', 210);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '보험료 이중 지출 막는 방법 (숨은 보험금 찾기 팁)', '가입된 보험 내역을 가계부와 ''연동''하여 관리하세요.', 'U091', 145);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '요즘 배달비 너무 비싸지 않나요? 외식 대신 뭘 드시나요?', '배달음식 지출이 심각해서 고민입니다. ''밀키트'' 추천해주세요!', 'U033', 185);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '동남아시아 3박 4일 항공권 패키지 핫딜!', '특가 항공권과 숙박이 포함된 여행 패키지 핫딜 정보입니다. ''휴가'' 가실 분들 보세요.', 'U077', 720);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '차량 유지비(주유, 보험, 수리) 효율적으로 관리하기', '자가용을 소유하신 분들을 위한 ''비용 절감'' 팁입니다.', 'U043', 160);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '다들 경조사비는 월 예산에 포함하시나요, 비정기 지출로 빼시나요?', '경조사비 ''비정기 지출'' 관리가 늘 어렵습니다. 여러분의 팁은 무엇인가요?', 'U058', 110);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '카드 포인트/마일리지 효율적인 활용 방법', '잠자고 있는 카드 혜택을 가계부로 확인하고 ''현금''처럼 사용하세요.', 'U068', 125);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '[현금부자] 유명 브랜드 여성 핸드백 한정판 핫딜!', '현금부자 셀러의 특별 핫딜! ''선착순'' 판매입니다.', 'U012', 550);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '월급 5년 차, 아직도 적금만... 투자 고민 조언해주세요.', '슬슬 투자를 시작해야 할 것 같은데, ''안정적인'' 상품 추천받습니다.', 'U097', 190);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '월세/전세 대출 이자, 가계부에 어떻게 기록하는 게 좋을까요?', '월세/전세 대출 이자를 ''고정 지출''로 넣는 게 맞는지, ''금융 지출''로 넣어야 할지 헷갈립니다.', 'U038', 95);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '캠핑 테이블/의자 세트 50% 반값 핫딜!', '금붕어 셀러가 추천하는 가을 ''캠핑 용품'' 핫딜! 수량 제한 있어요.', 'U046', 310);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '가장 좋아하는 가계부 카테고리는 무엇인가요?', '저는 문화/여가 지출을 가장 즐겨 ''기록''합니다. 여러분은요?', 'U060', 80);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '식비 30만원으로 2인 가구 한 달 살기 성공기', '식재료 대량 구매와 ''밀키트'' 활용 꿀팁을 대방출합니다.', 'U051', 280);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '[새벽시장] LG 스타일러 오브제컬렉션 특가!', '혼수 필수템! 스타일러 최신 모델 핫딜 정보입니다.', 'U014', 690);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '부모님께 용돈 드리는 지출은 어떤 카테고리에 넣으시나요?', '''경조사/선물''로 넣기에는 애매하고... 다들 어떻게 분류하시나요?', 'U071', 115);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '수입의 70% 저축 목표 달성! 비결은?', ' ''화성'' 닉네임의 절약 고수 비결! 통장 쪼개기가 핵심입니다.', 'U082', 340);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '[황금손] 해외 직구 건강식품 역대급 할인!', '황금손 마트에서 오메가3, 비타민 등 ''필수'' 건강식품을 초특가에 드립니다.', 'U006', 420);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '여행 경비 절약을 위한 나만의 꿀팁', ' ''라니''가 공유하는 항공권/숙박 ''최저가'' 찾는 팁!', 'U094', 130);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '영수증 자동 인식 오류, 해결 방법은?', '카메라로 영수증을 인식할 때 ''오차''가 너무 심해서 고민입니다.', 'U045', 105);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '[꿀단지] 샤오미 로봇 청소기 5세대 초특가!', '꿀단지 전자에서 ''단독'' 진행하는 로봇 청소기 핫딜!', 'U009', 750);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '나의 다음 재무 목표는?', '저는 전세자금 대출 상환입니다! 여러분의 ''다음 목표''는 무엇인가요?', 'U028', 99);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '월세나 대출 이자, ''고정 지출''로 분류하시나요?', ' ''나나''가 묻습니다. 매달 나가는 금융 지출, 어떻게 ''관리''하는 게 좋을까요?', 'U061', 140);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '[완판녀] 인기 스킨케어 브랜드 세트 한정 핫딜', '완판녀가 추천하는 ''인기'' 스킨케어 세트! 쟁여두세요.', 'U015', 310);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('자유게시판', '앱에서 지출 내역 CSV 추출 기능, 잘 쓰고 계시나요?', '저처럼 ''데이터 분석''을 위해 사용하시는 분들 있나요?', 'U090', 70);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('가계부 팁', '가족 간 돈 거래 기록은 어떻게 하시나요?', '''그룹 가계부''를 사용하지만, 가족 간의 개인적인 돈 거래 기록은 어떻게 하는 것이 좋을까요?', 'U018', 120);
INSERT INTO smaccount.BOARD_POST (category, post_title, post_content, writer_id, view_cnt)
VALUES ('핫딜 정보', '[비밀의방] 고급 호텔 1박 숙박권 할인 (주중 한정)', '비밀의방 셀러가 제공하는 연말 호캉스 핫딜!', 'U077', 560);

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.BOARD_COMMENT (댓글 및 대댓글)
--  **ID 참조 오류 해결을 위해 TRUNCATE 및 IDENTITY RESTART 구문 포함**
--  이 스크립트를 실행하기 전에 BOARD_POST 데이터가 먼저 삽입되어 있어야 합니다.
-- =============================

-- 1. BOARD_COMMENT 테이블의 모든 데이터 삭제 및 IDENTITY 카운터 초기화
-- TRUNCATE TABLE은 데이터와 공간을 빠르게 비우고, IDENTITY RESTART는 ID 카운터를 1로 재설정합니다.
TRUNCATE TABLE smaccount.BOARD_COMMENT;
ALTER TABLE smaccount.BOARD_COMMENT MODIFY (COMMENT_ID GENERATED AS IDENTITY (START WITH 1));


-- 2. 부모 댓글 (ID 1 ~ 46) 먼저 삽입
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (1, 'U016', '저도 ''API 연동'' 부분 오류 경험했습니다. 빠른 수정 부탁드려요!'); -- ID 1 (부모)
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (1, 'U058', '혹시 핸드폰 기종이 뭔가요? 저는 괜찮은데...'); -- ID 2 (부모)
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (9, 'U040', '텀블러 사용하면 환경도 지키고 일석이조네요.'); -- ID 3
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (9, 'U020', '저는 그냥 회사 믹스커피 마십니다. 이게 최고 절약법이죠.ㅎㅎ'); -- ID 4
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (9, 'U082', '좋은 팁 감사합니다! 저도 오늘부터 ''절약 루틴'' 따라 해볼게요.'); -- ID 5
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (10, 'U028', '''생활/가정''으로 묶고, 항목을 ''대형가구''로 따로 만들면 어떨까요?'); -- ID 6 (부모)
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (10, 'U018', '맞아요! 나중에 분석할 때 ''가구''만 따로 빼서 보는 게 편합니다.'); -- ID 7
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (11, 'U030', '혹시 ''밀키트''는 사용하셨나요? 저는 밀키트 비용이 너무 많이 나와서요.'); -- ID 8 (부모)
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (12, 'U055', '재테크 초보시면 ''적금'' 먼저 채우시는 게 마음 편합니다. 여윳돈으로 펀드 추천드려요.'); -- ID 9
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (12, 'U097', '저도 적금 추천이요! 원금 손실 위험이 없어야 멘탈 관리됩니다.'); -- ID 10
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (13, 'U002', '운영자입니다. 리포트에서 가장 지출이 높은 ''카테고리 3개''를 줄이는 목표를 세워보세요.'); -- ID 11
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (17, 'U060', '저는 요즘 ''집밥''만 먹어요. 배달비는 사치죠!'); -- ID 12
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (17, 'U034', '주 1회 이상 배달은 자제하려고 노력 중입니다.'); -- ID 13
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (22, 'U077', '와, 이 상품은 처음 보네요. 링크 정보 부탁드립니다.'); -- ID 14 (부모)
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (22, 'U019', '혹시 ''재고''는 얼마나 남았나요? 품절되기 전에 사야 하는데..'); -- ID 15
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (25, 'U061', '무조건 ''고정비/구독''으로 넣고 매달 체크합니다. 그래야 허리띠 졸라매죠.'); -- ID 16
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (25, 'U082', '저도 그렇게 해요! 금융 지출은 이자가 헷갈려서요.'); -- ID 17
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (27, 'U097', '저는 ''식비''가 제일 재밌어요. 어디서 돈 썼는지 바로 티나서요.'); -- ID 18
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (27, 'U040', '역시 ''여가/취미'' 지출이 삶의 낙이죠!'); -- ID 19
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (30, 'U017', '70%라니 대단합니다. 저는 40%도 힘든데 비결 좀 자세히 알려주세요.'); -- ID 20
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (35, 'U003', '운영자입니다. CSV 추출은 ''외부 분석''을 원하는 사용자들을 위해 제공됩니다.'); -- ID 21
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (35, 'U029', '저는 엑셀로 한 번 더 분석합니다. 앱 통계보다 편해서요.'); -- ID 22
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (2, 'U030', '예산 팁 잘 보고 갑니다.'); -- ID 23
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (4, 'U011', '황금손 마트 믿고 삽니다.'); -- ID 24
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (4, 'U024', '귤 상태 어떤가요?'); -- ID 25
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (5, 'U070', '모니터 드디어 풀렸네요!'); -- ID 26
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (8, 'U056', '육아용품은 완판녀가 최고죠.'); -- ID 27
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (16, 'U065', '여행 가고 싶네요. 부럽습니다.'); -- ID 28
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (19, 'U054', '차량 유지비가 생각보다 많이 나가죠.'); -- ID 29
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (21, 'U076', '카드 혜택 정리가 제일 어려워요.'); -- ID 30
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (23, 'U088', '가방 예쁘네요!'); -- ID 31
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (28, 'U046', '저도 밀키트 찬성입니다.'); -- ID 32
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (33, 'U027', '저축 목표 멋있습니다.'); -- ID 33
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (34, 'U068', '여행 팁 기대할게요!'); -- ID 34
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (32, 'U061', '오차 문제는 저도 자주 겪습니다.'); -- ID 35
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (14, 'U020', '비상금 통장 꿀팁 감사합니다!'); -- ID 36
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (15, 'U018', '저도 보험금 숨어있던 거 찾았어요.'); -- ID 37
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (18, 'U017', '저는 여행 갈 때만 비정기 지출로 빼요.'); -- ID 38
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (20, 'U090', '주유비 정말 무시 못 하죠.'); -- ID 39
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (24, 'U033', '캠핑용품은 충동구매 주의해야 합니다.'); -- ID 40
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (26, 'U074', '월세는 무조건 고정비로 관리합니다.'); -- ID 41
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (29, 'U092', '부모님 용돈은 ''선물'' 카테고리만 씁니다.'); -- ID 42
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (31, 'U088', '황금손 마트 건강식품도 파네요.'); -- ID 43
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (36, 'U031', '여행 경비는 미리 환전하는 게 팁입니다.'); -- ID 44
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (37, 'U042', '로봇 청소기 가격 좋네요.'); -- ID 45
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content) VALUES (39, 'U026', '가족 간 돈 거래는 가계부에서 제외해야 깨끗해요.'); -- ID 46

-- 3. 대댓글 4개 삽입 (ID 47부터 생성)
-- [Post 1, 부모 ID 1]
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content, parent_comment_id) VALUES (1, 'U016', '아이폰 15 pro입니다. 어제부터 계속 튕기네요.', 1); -- ID 47
-- [Post 11, 부모 ID 8]
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content, parent_comment_id) VALUES (11, 'U020', '네, 밀키트는 딱 1주일에 1번만 사용했습니다! 자제하는 게 중요해요.', 8); -- ID 48
-- [Post 11, 부모 ID 8]
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content, parent_comment_id) VALUES (11, 'U016', '대단하세요! 저도 도전해봐야겠어요.', 8); -- ID 49
-- [Post 22, 부모 ID 14]
INSERT INTO smaccount.BOARD_COMMENT (post_id, writer_id, comment_content, parent_comment_id) VALUES (22, 'U013', '현재 재고는 30개 미만 남았습니다. 서두르세요!', 14); -- ID 50

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.BOARD_LIKE (좋아요)
--  총 60개의 좋아요 데이터를 삽입합니다. (board_like_id는 IDENTITY로 자동 생성)
--  참조: post_id (1~39), member_id (MEMBER 테이블)
--  제약조건: (post_id, member_id) 쌍은 UNIQUE 해야 합니다.
-- =============================

-- Post 1 (서비스 개선) 좋아요 3개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (1, 'U017');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (1, 'U020');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (1, 'U033');

-- Post 2 (2025년 계획) 좋아요 4개 (운영자 글)
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (2, 'U016');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (2, 'U018');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (2, 'U055');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (2, 'U097');

-- Post 3 (절세 노하우) 좋아요 3개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (3, 'U028');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (3, 'U030');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (3, 'U040');

-- Post 4 (황금손 핫딜) 좋아요 5개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (4, 'U010');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (4, 'U021');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (4, 'U046');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (4, 'U058');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (4, 'U060');

-- Post 5 (꿀단지 모니터) 좋아요 6개 (가장 인기 많은 핫딜)
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (5, 'U004');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (5, 'U016');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (5, 'U025');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (5, 'U047');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (5, 'U088');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (5, 'U090');

-- Post 9 (커피값 절약) 좋아요 4개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (9, 'U001');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (9, 'U018');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (9, 'U029');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (9, 'U043');

-- Post 11 (냉장고 파먹기) 좋아요 3개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (11, 'U007');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (11, 'U027');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (11, 'U036');

-- Post 12 (재테크 입문) 좋아요 4개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (12, 'U037');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (12, 'U054');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (12, 'U065');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (12, 'U077');

-- Post 16 (비상금 통장) 좋아요 3개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (16, 'U041');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (16, 'U042');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (16, 'U050');

-- Post 18 (배달비 고민) 좋아요 3개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (18, 'U008');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (18, 'U071');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (18, 'U072');

-- Post 21 (경조사비) 좋아요 3개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (21, 'U006');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (21, 'U082');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (21, 'U084');

-- Post 22 (핸드백 핫딜) 좋아요 4개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (22, 'U019');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (22, 'U070');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (22, 'U087');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (22, 'U099');

-- Post 28 (식비 30만원) 좋아요 4개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (28, 'U005');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (28, 'U009');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (28, 'U049');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (28, 'U052');

-- Post 30 (70% 저축) 좋아요 3개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (30, 'U003');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (30, 'U031');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (30, 'U062');

-- Post 37 (로봇 청소기) 좋아요 3개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (37, 'U014');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (37, 'U057');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (37, 'U073');

-- Post 39 (가족 간 돈 거래) 좋아요 3개
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (39, 'U026');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (39, 'U035');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (39, 'U085');

-- 남은 포스트에 대한 좋아요 (총 5개)
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (7, 'U044');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (17, 'U051');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (29, 'U032');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (35, 'U080');
INSERT INTO smaccount.BOARD_LIKE (post_id, member_id) VALUES (38, 'U045');

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.ITEM (판매 상품)
--  **ID 초기화 및 데이터 삽입 스크립트**
--  주의: 이 스크립트를 실행하기 전에 SELLER 테이블 데이터가 먼저 삽입되어 있어야 합니다.
-- =============================

-- 1. ITEM 테이블의 모든 데이터 삭제 (외래 키 제약 조건 문제로 DELETE 사용)
DELETE FROM smaccount.ITEM;

-- 2. ITEM 테이블의 IDENTITY 카운터를 1로 재설정
-- ALTER TABLE ... MODIFY GENERATED AS IDENTITY (START WITH 1) 구문 사용
ALTER TABLE smaccount.ITEM MODIFY (ITEM_ID GENERATED AS IDENTITY (START WITH 1));

-- 3. 상품 데이터 삽입 (item_id는 1부터 시작합니다)
-- ITEM ID 1-2: 황금손 (seller_id: 1, H04: 식품)
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (1, '프리미엄 한우 선물세트 (1kg)', 120000.00, 99000.00, 'H04', '/img/item/hanwoo_set.jpg', 3500, 80, DATE '2025-01-10', DATE '2025-03-31', 'ON_SALE');
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (1, '유기농 제주 감귤 5kg 박스', 40000.00, 25000.00, 'H04', '/img/item/tangerine.jpg', 5000, 120, DATE '2025-01-01', DATE '2025-01-31', 'ON_SALE');

-- ITEM ID 3-4: 장바구니 (seller_id: 2, H01: 패션)
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (2, '남성 데일리 캐시미어 니트', 80000.00, 49900.00, 'H01', '/img/item/cashmere_knit.jpg', 2500, 60, DATE '2025-02-01', DATE '2025-03-15', 'ON_SALE');
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (2, '여성 오버핏 롱 코트 (블랙)', 150000.00, 129000.00, 'H01', '/img/item/long_coat.jpg', 1500, 5, DATE '2024-12-01', DATE '2024-12-30', 'SOLD_OUT');

-- ITEM ID 5: 보따리 (seller_id: 3, H03: 뷰티/건강)
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (3, '고농축 비타민C 120정', 35000.00, 25000.00, 'H03', '/img/item/vitamin_c.jpg', 1800, 40, DATE '2025-01-20', DATE '2025-02-28', 'ON_SALE');

-- ITEM ID 6-7: 꿀단지 (seller_id: 4, H02: 디지털/가전)
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (4, '노트북 15인치 (i7/16GB)', 1200000.00, 999000.00, 'H02', '/img/item/laptop_i7.jpg', 4000, 150, DATE '2025-01-25', DATE '2025-03-10', 'ON_SALE');
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (4, '무선 충전 패드 (고속)', 35000.00, 19900.00, 'H02', '/img/item/charger_pad.jpg', 2200, 85, DATE '2025-01-01', DATE '2025-02-28', 'ON_SALE');

-- ITEM ID 8: 대박점 (seller_id: 5, H05: 여행/레저)
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (5, '제주도 렌터카 이용권 (3일)', 150000.00, 99000.00, 'H05', '/img/item/jeju_car.jpg', 6000, 200, DATE '2025-01-01', DATE '2025-05-31', 'ON_SALE');

-- ITEM ID 9: 득템요정 (seller_id: 6, H04: 식품)
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (6, '집에서 튀겨먹는 치킨 밀키트', 25000.00, 18900.00, 'H04', '/img/item/chicken_kit.jpg', 3000, 90, DATE '2025-02-10', DATE '2025-02-20', 'ON_SALE');

-- ITEM ID 10-11: 현금부자 (seller_id: 7, H01: 패션)
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (7, '브랜드 여성 캐주얼 백팩', 180000.00, 119000.00, 'H01', '/img/item/backpack.jpg', 1900, 55, DATE '2025-01-05', DATE '2025-02-05', 'ON_SALE');
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (7, '수제 가죽 벨트 (블랙)', 75000.00, 55000.00, 'H01', '/img/item/leather_belt.jpg', 1200, 30, DATE '2025-01-15', DATE '2025-02-15', 'ON_SALE');

-- ITEM ID 12-13: 미소상점 (seller_id: 8, H03: 뷰티)
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (8, '고급 에센스 마스크팩 10개입', 25000.00, 19000.00, 'H03', '/img/item/mask_pack.jpg', 800, 20, DATE '2025-01-01', DATE '2025-01-31', 'ON_SALE');
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (8, '기능성 수분 크림 (대용량)', 40000.00, 22000.00, 'H03', '/img/item/moisture_cream.jpg', 1600, 45, DATE '2025-02-10', DATE '2025-03-10', 'ON_SALE');

-- ITEM ID 14-15: 새벽시장 (seller_id: 9, H02: 가전)
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (9, '로봇 청소기 S5', 450000.00, 299000.00, 'H02', '/img/item/robot_cleaner.jpg', 7000, 250, DATE '2025-01-01', DATE '2025-01-20', 'ON_SALE');
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (9, '27인치 게이밍 모니터', 300000.00, 199000.00, 'H02', '/img/item/gaming_monitor.jpg', 1000, 10, DATE '2024-12-01', DATE '2025-01-01', 'ENDED');

-- ITEM ID 16: 완판녀 (seller_id: 10, H03: 건강)
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (10, '프리미엄 헬스 닭가슴살 10팩', 35000.00, 29000.00, 'H03', '/img/item/chicken_breast.jpg', 1500, 70, DATE '2025-01-05', DATE '2025-02-05', 'ON_SALE');

-- ITEM ID 17-20: 추가 상품 (다양한 카테고리)
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (6, '캠핑용 모듬 소시지 세트', 35000.00, 29000.00, 'H04', '/img/item/sausage_set.jpg', 1100, 45, DATE '2025-02-15', DATE '2025-03-30', 'ON_SALE');
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (5, '제주 4성급 호텔 숙박권 (1박)', 300000.00, 250000.00, 'H05', '/img/item/jeju_hotel.jpg', 800, 30, DATE '2025-01-01', DATE '2025-06-30', 'ON_SALE');
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (2, '여성 롱 가디건 (M/L)', 75000.00, 59000.00, 'H01', '/img/item/long_cardigan.jpg', 1300, 50, DATE '2025-01-01', DATE '2025-01-31', 'ON_SALE');
INSERT INTO smaccount.ITEM (seller_id, item_name, original_price, item_saleprice, category_id, item_image_url, view_count, popularity_score, sale_start_at, sale_end_at, sale_status)
VALUES (4, '무선 이어폰 (노이즈 캔슬링)', 150000.00, 99000.00, 'H02', '/img/item/wireless_earbuds.jpg', 4500, 180, DATE '2025-02-01', DATE '2025-03-30', 'ON_SALE');

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.HOTDEAL_OPTION (상품 옵션 및 재고)
--  **ID 초기화 및 데이터 삽입 스크립트**
--  주의: 이 스크립트를 실행하기 전에 ORDER_ITEM 테이블의 데이터를 먼저 삭제해야 합니다.
-- =============================

-- 1. HOTDEAL_OPTION 테이블의 모든 데이터 삭제
DELETE FROM smaccount.HOTDEAL_OPTION;

-- 2. HOTDEAL_OPTION 테이블의 IDENTITY 카운터를 1로 재설정
-- ALTER TABLE ... MODIFY GENERATED AS IDENTITY (START WITH 1) 구문 사용
ALTER TABLE smaccount.HOTDEAL_OPTION MODIFY (OPTION_ID GENERATED AS IDENTITY (START WITH 1));

-- 3. 옵션 데이터 삽입 (option_id는 1부터 시작합니다)
-- ITEM 1: 한우 선물세트 (기본 가격 99000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (1, '등급', '1등급', 0, 50); -- ID 1
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (1, '등급', '1+등급', 30000.00, 30); -- ID 2
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (1, '포장', '고급 보자기', 5000.00, 80); -- ID 3

-- ITEM 2: 제주 감귤 (기본 가격 25000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (2, '중량', '5kg', 0, 150); -- ID 4
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (2, '중량', '10kg', 15000.00, 50); -- ID 5

-- ITEM 3: 캐시미어 니트 (기본 가격 49900.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (3, '색상', '네이비', 0, 80); -- ID 6
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (3, '색상', '차콜', 0, 50); -- ID 7
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (3, '사이즈', 'L', 0, 40); -- ID 8
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (3, '사이즈', 'XL', 5000.00, 20); -- ID 9

-- ITEM 5: 비타민C (기본 가격 25000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (5, '용량', '120정', 0, 100); -- ID 10
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (5, '용량', '240정', 15000.00, 40); -- ID 11

-- ITEM 6: 노트북 (기본 가격 999000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (6, 'RAM', '16GB', 0, 15); -- ID 12
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (6, 'RAM', '32GB', 150000.00, 5); -- ID 13

-- ITEM 7: 무선 충전 패드 (기본 가격 19900.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (7, '색상', '화이트', 0, 50); -- ID 14
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (7, '색상', '블랙', 0, 50); -- ID 15

-- ITEM 8: 제주도 렌터카 (기본 가격 99000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (8, '차종', '경차', 0, 5); -- ID 16
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (8, '차종', '중형차', 30000.00, 15); -- ID 17

-- ITEM 9: 치킨 밀키트 (기본 가격 18900.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (9, '맛', '오리지널', 0, 70); -- ID 18
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (9, '맛', '매운맛', 1000.00, 30); -- ID 19

-- ITEM 10: 캐주얼 백팩 (기본 가격 119000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (10, '색상', '블랙', 0, 50); -- ID 20
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (10, '색상', '아이보리', 0, 21); -- ID 21

-- ITEM 11: 가죽 벨트 (기본 가격 55000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (11, '사이즈', '30인치', 0, 10); -- ID 22
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (11, '사이즈', '34인치', 0, 15); -- ID 23

-- ITEM 13: 수분 크림 (기본 가격 22000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (13, '추가 구성', '없음', 0, 80); -- ID 24
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (13, '추가 구성', '마스크팩 증정', 2000.00, 20); -- ID 25

-- ITEM 14: 로봇 청소기 (기본 가격 299000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (14, '필터', '기본형', 0, 10); -- ID 26
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (14, '필터', '프리미엄 세트', 30000.00, 5); -- ID 27

-- ITEM 16: 닭가슴살 (기본 가격 29000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (16, '맛', '오리지널', 0, 50); -- ID 28
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (16, '맛', '훈제', 0, 50); -- ID 29

-- ITEM 17: 캠핑 소시지 (기본 가격 29000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (17, '포장', '아이스팩 포함', 0, 40); -- ID 30

-- ITEM 18: 제주 호텔 숙박권 (기본 가격 250000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (18, '룸 타입', '스탠다드', 0, 10); -- ID 31
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (18, '룸 타입', '오션뷰', 50000.00, 5); -- ID 32

-- ITEM 19: 롱 가디건 (기본 가격 59000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (19, '색상', '베이지', 0, 30); -- ID 33
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (19, '색상', '그레이', 0, 20); -- ID 34

-- ITEM 20: 무선 이어폰 (기본 가격 99000.00)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (20, '색상', '화이트', 0, 60); -- ID 35
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (20, '색상', '블랙', 0, 40); -- ID 36

-- ITEM 4: 여성 롱 코트 (SOLD_OUT)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (4, '색상', '버건디', 0, 0); -- ID 37 (재고 0)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (4, '사이즈', 'S', 0, 0); -- ID 38 (재고 0)

-- ITEM 12: 마스크팩 (추가 옵션)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (12, '매수', '20개입', 5000.00, 20); -- ID 39

-- ITEM 15: 게이밍 모니터 (ENDED)
INSERT INTO smaccount.HOTDEAL_OPTION (item_id, option_type, option_value, additional_price, stock) VALUES (15, '패널', 'VA', 0, 1); -- ID 40

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.ITEM_DETAIL_IMAGE (상품 상세 이미지)
--  총 60개의 상세 이미지 데이터를 삽입합니다. (detail_image_id는 IDENTITY로 자동 생성)
--  참조: item_id (1~20)
-- =============================

-- ITEM 1: 프리미엄 한우 선물세트
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (1, '/img/detail/hanwoo/gift_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (1, '/img/detail/hanwoo/cuts_02.jpg', 2);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (1, '/img/detail/hanwoo/packaging_03.jpg', 3);

-- ITEM 2: 유기농 제주 감귤
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (2, '/img/detail/tangerine/farm_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (2, '/img/detail/tangerine/box_02.jpg', 2);

-- ITEM 3: 남성 데일리 캐시미어 니트
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (3, '/img/detail/knit/model_navy_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (3, '/img/detail/knit/texture_02.jpg', 2);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (3, '/img/detail/knit/model_charcoal_03.jpg', 3);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (3, '/img/detail/knit/size_chart_04.jpg', 4);

-- ITEM 4: 여성 오버핏 롱 코트 (SOLD_OUT)
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (4, '/img/detail/coat/model_front_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (4, '/img/detail/coat/detail_fabric_02.jpg', 2);

-- ITEM 5: 고농축 비타민C 120정
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (5, '/img/detail/vitamin/bottle_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (5, '/img/detail/vitamin/nutrition_facts_02.jpg', 2);

-- ITEM 6: 노트북 15인치
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (6, '/img/detail/laptop/angle_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (6, '/img/detail/laptop/keyboard_02.jpg', 2);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (6, '/img/detail/laptop/ports_03.jpg', 3);

-- ITEM 7: 무선 충전 패드
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (7, '/img/detail/charger/white_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (7, '/img/detail/charger/black_02.jpg', 2);

-- ITEM 8: 제주도 렌터카 이용권
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (8, '/img/detail/car/compact_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (8, '/img/detail/car/midsize_02.jpg', 2);

-- ITEM 9: 치킨 밀키트
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (9, '/img/detail/chicken/cooked_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (9, '/img/detail/chicken/packaging_02.jpg', 2);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (9, '/img/detail/chicken/spicy_option_03.jpg', 3);

-- ITEM 10: 캐주얼 백팩
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (10, '/img/detail/backpack/model_front_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (10, '/img/detail/backpack/internal_02.jpg', 2);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (10, '/img/detail/backpack/color_03.jpg', 3);

-- ITEM 11: 가죽 벨트
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (11, '/img/detail/belt/leather_detail_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (11, '/img/detail/belt/buckle_02.jpg', 2);

-- ITEM 12: 마스크팩
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (12, '/img/detail/maskpack/box_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (12, '/img/detail/maskpack/use_case_02.jpg', 2);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (12, '/img/detail/maskpack/ingredients_03.jpg', 3);

-- ITEM 13: 수분 크림
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (13, '/img/detail/cream/jar_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (13, '/img/detail/cream/texture_02.jpg', 2);

-- ITEM 14: 로봇 청소기 S5
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (14, '/img/detail/cleaner/top_view_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (14, '/img/detail/cleaner/dock_02.jpg', 2);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (14, '/img/detail/cleaner/mapping_03.jpg', 3);

-- ITEM 15: 27인치 게이밍 모니터 (ENDED)
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (15, '/img/detail/monitor/display_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (15, '/img/detail/monitor/back_port_02.jpg', 2);

-- ITEM 16: 닭가슴살 10팩
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (16, '/img/detail/chicken/package_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (16, '/img/detail/chicken/smoked_02.jpg', 2);

-- ITEM 17: 캠핑 소시지 세트
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (17, '/img/detail/sausage/grill_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (17, '/img/detail/sausage/ingredients_02.jpg', 2);

-- ITEM 18: 제주 호텔 숙박권
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (18, '/img/detail/hotel/room_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (18, '/img/detail/hotel/oceanview_02.jpg', 2);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (18, '/img/detail/hotel/pool_03.jpg', 3);

-- ITEM 19: 여성 롱 가디건
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (19, '/img/detail/cardigan/model_front_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (19, '/img/detail/cardigan/model_side_02.jpg', 2);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (19, '/img/detail/cardigan/texture_03.jpg', 3);

-- ITEM 20: 무선 이어폰
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (20, '/img/detail/earbuds/case_01.jpg', 1);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (20, '/img/detail/earbuds/features_02.jpg', 2);
INSERT INTO smaccount.ITEM_DETAIL_IMAGE (item_id, image_url, display_order) VALUES (20, '/img/detail/earbuds/color_options_03.jpg', 3);

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.ITEM_WISH (상품 찜하기)
--  총 75개의 찜하기 데이터를 삽입합니다. (wish_id는 IDENTITY로 자동 생성)
--  참조: item_id (1~20), member_id (MEMBER 테이블)
-- =============================

-- ITEM 1: 한우 선물세트 (좋아요 4개)
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (1, 'U016');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (1, 'U018');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (1, 'U051');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (1, 'U026');

-- ITEM 2: 제주 감귤 (좋아요 5개)
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (2, 'U004');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (2, 'U017');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (2, 'U047');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (2, 'U058');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (2, 'U060');

-- ITEM 3: 캐시미어 니트 (좋아요 3개)
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (3, 'U012');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (3, 'U033');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (3, 'U070');

-- ITEM 5: 비타민C (좋아요 4개)
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (5, 'U008');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (5, 'U055');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (5, 'U082');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (5, 'U091');

-- ITEM 6: 노트북 (가장 인기, 좋아요 10개)
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (6, 'U001');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (6, 'U002');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (6, 'U007');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (6, 'U009');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (6, 'U025');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (6, 'U030');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (6, 'U040');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (6, 'U050');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (6, 'U060');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (6, 'U088');

-- ITEM 8: 렌터카 (좋아요 6개)
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (8, 'U023');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (8, 'U037');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (8, 'U044');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (8, 'U077');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (8, 'U094');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (8, 'U096');

-- ITEM 9: 치킨 밀키트 (좋아요 4개)
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (9, 'U020');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (9, 'U032');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (9, 'U034');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (9, 'U049');

-- ITEM 10: 백팩 (좋아요 3개)
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (10, 'U022');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (10, 'U065');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (10, 'U089');

-- ITEM 14: 로봇 청소기 (좋아요 8개)
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (14, 'U003');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (14, 'U014');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (14, 'U021');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (14, 'U046');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (14, 'U056');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (14, 'U068');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (14, 'U073');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (14, 'U090');

-- ITEM 16: 닭가슴살 (좋아요 5개)
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (16, 'U006');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (16, 'U011');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (16, 'U039');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (16, 'U063');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (16, 'U079');

-- ITEM 18: 호텔 숙박권 (좋아요 5개)
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (18, 'U010');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (18, 'U043');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (18, 'U054');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (18, 'U076');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (18, 'U086');

-- ITEM 20: 무선 이어폰 (좋아요 12개 - 가장 인기 많음)
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (20, 'U004');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (20, 'U013');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (20, 'U017');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (20, 'U020');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (20, 'U024');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (20, 'U028');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (20, 'U035');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (20, 'U048');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (20, 'U059');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (20, 'U071');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (20, 'U092');
INSERT INTO smaccount.ITEM_WISH (item_id, member_id) VALUES (20, 'U100');

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.ORDER_MAIN (주문 메인)
--  총 10건의 주문 데이터를 삽입합니다. (order_id는 IDENTITY로 자동 생성)
--  참조: buyer_id (MEMBER 테이블)
-- =============================

-- Order ID 1: U016 (커피잔) - DELIVERED (99,000원 - 한우)
INSERT INTO smaccount.ORDER_MAIN (buyer_id, total_amount, order_status)
VALUES ('U016', 99000.00, 'DELIVERED');

-- Order ID 2: U020 (푸른숲) - SHIPPED (18,900원 - 치킨 밀키트)
INSERT INTO smaccount.ORDER_MAIN (buyer_id, total_amount, order_status)
VALUES ('U020', 18900.00, 'SHIPPED');

-- Order ID 3: U030 (토마토) - PAID (999,000원 - 노트북)
INSERT INTO smaccount.ORDER_MAIN (buyer_id, total_amount, order_status)
VALUES ('U030', 999000.00, 'PAID');

-- Order ID 4: U045 (물방울) - DELIVERED (19,000원 - 마스크팩)
INSERT INTO smaccount.ORDER_MAIN (buyer_id, total_amount, order_status)
VALUES ('U045', 19000.00, 'DELIVERED');

-- Order ID 5: U070 (오리너구리) - SHIPPED (119,000원 - 백팩)
INSERT INTO smaccount.ORDER_MAIN (buyer_id, total_amount, order_status)
VALUES ('U070', 119000.00, 'SHIPPED');

-- Order ID 6: U088 (에디) - PAID (299,000원 - 로봇 청소기)
INSERT INTO smaccount.ORDER_MAIN (buyer_id, total_amount, order_status)
VALUES ('U088', 299000.00, 'PAID');

-- Order ID 7: U019 (구름빵) - DELIVERED (59,000원 - 롱 가디건)
INSERT INTO smaccount.ORDER_MAIN (buyer_id, total_amount, order_status)
VALUES ('U019', 59000.00, 'DELIVERED');

-- Order ID 8: U091 (꼬마버스) - PAID (300,000원 - 제주 호텔 오션뷰)
INSERT INTO smaccount.ORDER_MAIN (buyer_id, total_amount, order_status)
VALUES ('U091', 300000.00, 'PAID');

-- Order ID 9: U023 (무지개) - CANCELED (49,900원 - 니트)
INSERT INTO smaccount.ORDER_MAIN (buyer_id, total_amount, order_status)
VALUES ('U023', 49900.00, 'CANCELED');

-- Order ID 10: U004 (은하수) - PAID (163,900원 - 복합 주문)
INSERT INTO smaccount.ORDER_MAIN (buyer_id, total_amount, order_status)
VALUES ('U004', 163900.00, 'PAID');

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.ORDER_ITEM (주문 상품 목록)
--  **ID 참조 오류 해결을 위해 TRUNCATE 및 IDENTITY RESTART 구문 포함**
--  *이 스크립트를 실행하기 전에 SHIPMENT, PAYMENT_TRANSACTION 데이터를 먼저 삭제해야 합니다.*
-- =============================

-- 1. ORDER_ITEM 테이블의 모든 데이터 삭제 및 IDENTITY 카운터 초기화
TRUNCATE TABLE smaccount.ORDER_ITEM;
ALTER TABLE smaccount.ORDER_ITEM MODIFY (ORDER_ITEM_ID GENERATED AS IDENTITY (START WITH 1));


-- 2. 주문 상품 데이터 삽입 (order_item_id는 1부터 순서대로 생성)
-- Order 1: U016 (한우 선물세트 1kg)
-- ITEM 1, OPTION 1 (1등급)
INSERT INTO smaccount.ORDER_ITEM (order_id, item_id, option_id, qty, price) VALUES (1, 1, 1, 1, 99000.00);

-- Order 2: U020 (치킨 밀키트)
-- ITEM 9, OPTION 18 (오리지널 맛)
INSERT INTO smaccount.ORDER_ITEM (order_id, item_id, option_id, qty, price) VALUES (2, 9, 18, 1, 18900.00);

-- Order 3: U030 (노트북)
-- ITEM 6, OPTION 12 (RAM 16GB)
INSERT INTO smaccount.ORDER_ITEM (order_id, item_id, option_id, qty, price) VALUES (3, 6, 12, 1, 999000.00);

-- Order 4: U045 (마스크팩)
-- ITEM 12, OPTION 24 (추가 구성 없음)
INSERT INTO smaccount.ORDER_ITEM (order_id, item_id, option_id, qty, price) VALUES (4, 12, 24, 1, 19000.00);

-- Order 5: U070 (백팩)
-- ITEM 10, OPTION 20 (블랙)
INSERT INTO smaccount.ORDER_ITEM (order_id, item_id, option_id, qty, price) VALUES (5, 10, 20, 1, 119000.00);

-- Order 6: U088 (로봇 청소기)
-- ITEM 14, OPTION 26 (기본형 필터)
INSERT INTO smaccount.ORDER_ITEM (order_id, item_id, option_id, qty, price) VALUES (6, 14, 26, 1, 299000.00);

-- Order 7: U019 (롱 가디건)
-- ITEM 19, OPTION 33 (베이지)
INSERT INTO smaccount.ORDER_ITEM (order_id, item_id, option_id, qty, price) VALUES (7, 19, 33, 1, 59000.00);

-- Order 8: U091 (제주 호텔 숙박권)
-- ITEM 18, OPTION 32 (오션뷰, 5만 추가)
INSERT INTO smaccount.ORDER_ITEM (order_id, item_id, option_id, qty, price) VALUES (8, 18, 32, 1, 300000.00);

-- Order 9: U023 (취소된 주문 - 니트)
-- ITEM 3, OPTION 6 (네이비)
INSERT INTO smaccount.ORDER_ITEM (order_id, item_id, option_id, qty, price) VALUES (9, 3, 6, 1, 49900.00);

-- Order 10: U004 (복합 주문 - 163,900원)
-- ITEM 7 (충전 패드), ITEM 16 (닭가슴살), ITEM 20 (무선 이어폰)
INSERT INTO smaccount.ORDER_ITEM (order_id, item_id, option_id, qty, price) VALUES (10, 7, 14, 2, 39800.00);   -- 충전 패드 2개 (2 * 19900)
INSERT INTO smaccount.ORDER_ITEM (order_id, item_id, option_id, qty, price) VALUES (10, 16, 28, 1, 29000.00);  -- 닭가슴살 1개
INSERT INTO smaccount.ORDER_ITEM (order_id, item_id, option_id, qty, price) VALUES (10, 20, 36, 1, 95100.00);  -- 무선 이어폰 (나머지 금액 조정)
-- Total Check: 39800 + 29000 + 95100 = 163900 (ORDER_MAIN Total Amount와 일치)

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.PAYMENT_TRANSACTION (결제 거래 기록)
--  총 9건의 성공적인 결제 거래 데이터를 삽입합니다.
--  수정: DDL 컬럼명 (txn_status, pay_method, request_time) 및 pg_tid 추가
-- =============================

-- 1. PAYMENT_TRANSACTION 테이블의 모든 데이터 삭제 및 IDENTITY 카운터 초기화
TRUNCATE TABLE smaccount.PAYMENT_TRANSACTION;
ALTER TABLE smaccount.PAYMENT_TRANSACTION MODIFY (TXN_ID GENERATED AS IDENTITY (START WITH 1));

-- 2. 결제 거래 데이터 삽입 (ORDER_MAIN의 total_amount와 일치해야 함)
-- Order 1: 99,000원 (카드)
INSERT INTO smaccount.PAYMENT_TRANSACTION (order_id, member_id, pg_tid, amount, txn_status, pay_method, request_time)
VALUES (1, 'U016', 'PGTID0001', 99000.00, 'SUCCESS', 'CARD', TO_TIMESTAMP('2025-01-20 10:05:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Order 2: 18,900원 (모바일)
INSERT INTO smaccount.PAYMENT_TRANSACTION (order_id, member_id, pg_tid, amount, txn_status, pay_method, request_time)
VALUES (2, 'U020', 'PGTID0002', 18900.00, 'SUCCESS', 'MOBILE', TO_TIMESTAMP('2025-01-21 14:20:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Order 3: 999,000원 (카드)
INSERT INTO smaccount.PAYMENT_TRANSACTION (order_id, member_id, pg_tid, amount, txn_status, pay_method, request_time)
VALUES (3, 'U030', 'PGTID0003', 999000.00, 'SUCCESS', 'CARD', TO_TIMESTAMP('2025-01-22 09:30:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Order 4: 19,000원 (카드)
INSERT INTO smaccount.PAYMENT_TRANSACTION (order_id, member_id, pg_tid, amount, txn_status, pay_method, request_time)
VALUES (4, 'U045', 'PGTID0004', 19000.00, 'SUCCESS', 'CARD', TO_TIMESTAMP('2025-01-23 11:15:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Order 5: 119,000원 (카드)
INSERT INTO smaccount.PAYMENT_TRANSACTION (order_id, member_id, pg_tid, amount, txn_status, pay_method, request_time)
VALUES (5, 'U070', 'PGTID0005', 119000.00, 'SUCCESS', 'CARD', TO_TIMESTAMP('2025-01-23 15:45:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Order 6: 299,000원 (카드)
INSERT INTO smaccount.PAYMENT_TRANSACTION (order_id, member_id, pg_tid, amount, txn_status, pay_method, request_time)
VALUES (6, 'U088', 'PGTID0006', 299000.00, 'SUCCESS', 'CARD', TO_TIMESTAMP('2025-01-24 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Order 7: 59,000원 (모바일)
INSERT INTO smaccount.PAYMENT_TRANSACTION (order_id, member_id, pg_tid, amount, txn_status, pay_method, request_time)
VALUES (7, 'U019', 'PGTID0007', 59000.00, 'SUCCESS', 'MOBILE', TO_TIMESTAMP('2025-01-24 13:55:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Order 8: 300,000원 (가상 계좌)
INSERT INTO smaccount.PAYMENT_TRANSACTION (order_id, member_id, pg_tid, amount, txn_status, pay_method, request_time)
VALUES (8, 'U091', 'PGTID0008', 300000.00, 'SUCCESS', 'VIRTUAL_ACCOUNT', TO_TIMESTAMP('2025-01-24 16:10:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Order 10: 163,900원 (카드)
INSERT INTO smaccount.PAYMENT_TRANSACTION (order_id, member_id, pg_tid, amount, txn_status, pay_method, request_time)
VALUES (10, 'U004', 'PGTID0010', 163900.00, 'SUCCESS', 'CARD', TO_TIMESTAMP('2025-01-24 17:30:00', 'YYYY-MM-DD HH24:MI:SS'));

COMMIT;

-- =============================
--  DUMMY DATA: smaccount.SHIPMENT (배송 정보)
--  총 9건의 주문에 대한 배송 데이터를 삽입합니다. (shipment_id는 IDENTITY로 자동 생성)
--  참조: order_id (1~8, 10), ORDER_MAIN.order_status와 일치
-- =============================

-- Order 1: DELIVERED
INSERT INTO smaccount.SHIPMENT (order_id, tracking_no, carrier, shipment_status)
VALUES (1, 'TRK000000001', 'CJ대한통운', 'DELIVERED');

-- Order 2: SHIPPED
INSERT INTO smaccount.SHIPMENT (order_id, tracking_no, carrier, shipment_status)
VALUES (2, 'TRK000000002', '우체국택배', 'SHIPPING');

-- Order 3: PAID (준비중)
INSERT INTO smaccount.SHIPMENT (order_id, tracking_no, carrier, shipment_status)
VALUES (3, 'TRK000000003', '롯데택배', 'PREPARING');

-- Order 4: DELIVERED
INSERT INTO smaccount.SHIPMENT (order_id, tracking_no, carrier, shipment_status)
VALUES (4, 'TRK000000004', 'CJ대한통운', 'DELIVERED');

-- Order 5: SHIPPED
INSERT INTO smaccount.SHIPMENT (order_id, tracking_no, carrier, shipment_status)
VALUES (5, 'TRK000000005', '한진택배', 'SHIPPING');

-- Order 6: PAID (준비중)
INSERT INTO smaccount.SHIPMENT (order_id, tracking_no, carrier, shipment_status)
VALUES (6, 'TRK000000006', '롯데택배', 'PREPARING');

-- Order 7: DELIVERED
INSERT INTO smaccount.SHIPMENT (order_id, tracking_no, carrier, shipment_status)
VALUES (7, 'TRK000000007', 'CJ대한통운', 'DELIVERED');

-- Order 8: PAID (준비중)
INSERT INTO smaccount.SHIPMENT (order_id, tracking_no, carrier, shipment_status)
VALUES (8, 'TRK000000008', '등기우편', 'PREPARING');

-- Order 10: PAID (준비중)
INSERT INTO smaccount.SHIPMENT (order_id, tracking_no, carrier, shipment_status)
VALUES (10, 'TRK000000010', '로젠택배', 'PREPARING');

COMMIT;