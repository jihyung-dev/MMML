-- =============================
--  DUMMY DATA: smaccount.MEMBER
--  총 100개의 회원 데이터를 삽입합니다. (member_name은 유지, member_nickname을 창의적인 이름으로 변경)
-- =============================

-- 관리자 (ADMIN): ID U001 ~ U005
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U001', 'hashed_admin_pass', 'ADMIN', '김민준', '샛별', '서울시 종로구 세종대로 1', '010-1111-0001', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U002', 'hashed_admin_pass', 'ADMIN', '이서준', '해찬', '서울시 종로구 세종대로 2', '010-1111-0002', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U003', 'hashed_admin_pass', 'ADMIN', '박지아', '달무리', '서울시 종로구 세종대로 3', '010-1111-0003', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U004', 'hashed_admin_pass', 'ADMIN', '최은우', '은하수', '서울시 종로구 세종대로 4', '010-1111-0004', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U005', 'hashed_admin_pass', 'ADMIN', '정하윤', '바람꽃', '서울시 종로구 세종대로 5', '010-1111-0005', 'Y');

-- 판매자 (SELLER): ID U006 ~ U015
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U006', 'hashed_seller_pass', 'SELLER', '김태영', '황금손', '경기도 성남시 분당구 판교로 6', '010-2222-0006', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U007', 'hashed_seller_pass', 'SELLER', '이지유', '장바구니', '경기도 성남시 분당구 판교로 7', '010-2222-0007', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U008', 'hashed_seller_pass', 'SELLER', '박시후', '보따리', '경기도 성남시 분당구 판교로 8', '010-2222-0008', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U009', 'hashed_seller_pass', 'SELLER', '최서윤', '꿀단지', '경기도 성남시 분당구 판교로 9', '010-2222-0009', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U010', 'hashed_seller_pass', 'SELLER', '정윤호', '대박점', '경기도 성남시 분당구 판교로 10', '010-2222-0010', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U011', 'hashed_seller_pass', 'SELLER', '김예나', '득템요정', '경기도 성남시 분당구 판교로 11', '010-2222-0011', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U012', 'hashed_seller_pass', 'SELLER', '이로운', '현금부자', '경기도 성남시 분당구 판교로 12', '010-2222-0012', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U013', 'hashed_seller_pass', 'SELLER', '박도준', '미소상점', '경기도 성남시 분당구 판교로 13', '010-2222-0013', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U014', 'hashed_seller_pass', 'SELLER', '최아린', '새벽시장', '경기도 성남시 분당구 판교로 14', '010-2222-0014', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U015', 'hashed_seller_pass', 'SELLER', '정서우', '완판녀', '경기도 성남시 분당구 판교로 15', '010-2222-0015', 'Y');

-- 일반회원 (GENERAL): ID U016 ~ U100
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U016', 'hashed_general_pass', 'GENERAL', '김지훈', '커피잔', '인천 연수구 송도동 16', '010-3000-0016', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U017', 'hashed_general_pass', 'GENERAL', '이서현', '연필심', '인천 연수구 송도동 17', '010-3000-0017', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U018', 'hashed_general_pass', 'GENERAL', '박주원', '그림자', '인천 연수구 송도동 18', '010-3000-0018', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U019', 'hashed_general_pass', 'GENERAL', '최유진', '구름빵', '인천 연수구 송도동 19', '010-3000-0019', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U020', 'hashed_general_pass', 'GENERAL', '정승우', '푸른숲', '인천 연수구 송도동 20', '010-3000-0020', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U021', 'hashed_general_pass', 'GENERAL', '강하늘', '고양이발', '부산 해운대구 우동 21', '010-3000-0021', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U022', 'hashed_general_pass', 'GENERAL', '조민서', '달팽이', '부산 해운대구 우동 22', '010-3000-0022', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U023', 'hashed_general_pass', 'GENERAL', '윤수빈', '무지개', '부산 해운대구 우동 23', '010-3000-0023', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U024', 'hashed_general_pass', 'GENERAL', '임재현', '아침이슬', '부산 해운대구 우동 24', '010-3000-0024', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U025', 'hashed_general_pass', 'GENERAL', '홍도현', '별똥별', '부산 해운대구 우동 25', '010-3000-0025', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U026', 'hashed_general_pass', 'GENERAL', '변지우', '시계탑', '대구 수성구 범어동 26', '010-3000-0026', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U027', 'hashed_general_pass', 'GENERAL', '유시은', '바다소금', '대구 수성구 범어동 27', '010-3000-0027', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U028', 'hashed_general_pass', 'GENERAL', '신준서', '민트향', '대구 수성구 범어동 28', '010-3000-0028', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U029', 'hashed_general_pass', 'GENERAL', '고은채', '노을빛', '대구 수성구 범어동 29', '010-3000-0029', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U030', 'hashed_general_pass', 'GENERAL', '문찬우', '토마토', '대구 수성구 범어동 30', '010-3000-0030', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U031', 'hashed_general_pass', 'GENERAL', '하서준', '솜사탕', '광주 서구 상무지구 31', '010-3000-0031', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U032', 'hashed_general_pass', 'GENERAL', '오지호', '보름달', '광주 서구 상무지구 32', '010-3000-0032', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U033', 'hashed_general_pass', 'GENERAL', '서하윤', '꼬꼬마', '광주 서구 상무지구 33', '010-3000-0033', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U034', 'hashed_general_pass', 'GENERAL', '전도윤', '단풍잎', '광주 서구 상무지구 34', '010-3000-0034', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U035', 'hashed_general_pass', 'GENERAL', '배가은', '봄햇살', '광주 서구 상무지구 35', '010-3000-0035', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U036', 'hashed_general_pass', 'GENERAL', '백현서', '철수', '대전 유성구 도룡동 36', '010-3000-0036', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U037', 'hashed_general_pass', 'GENERAL', '노이안', '영희', '대전 유성구 도룡동 37', '010-3000-0037', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U038', 'hashed_general_pass', 'GENERAL', '양채은', '뚝배기', '대전 유성구 도룡동 38', '010-3000-0038', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U039', 'hashed_general_pass', 'GENERAL', '황주안', '짱구', '대전 유성구 도룡동 39', '010-3000-0039', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U040', 'hashed_general_pass', 'GENERAL', '송나현', '유리구슬', '대전 유성구 도룡동 40', '010-3000-0040', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U041', 'hashed_general_pass', 'GENERAL', '남현진', '잠만보', '울산 남구 삼산동 41', '010-3000-0041', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U042', 'hashed_general_pass', 'GENERAL', '곽민재', '춤추는돌', '울산 남구 삼산동 42', '010-3000-0042', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U043', 'hashed_general_pass', 'GENERAL', '손소율', '미역국', '울산 남구 삼산동 43', '010-3000-0043', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U044', 'hashed_general_pass', 'GENERAL', '정하준', '은쟁반', '울산 남구 삼산동 44', '010-3000-0044', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U045', 'hashed_general_pass', 'GENERAL', '김아윤', '물방울', '울산 남구 삼산동 45', '010-3000-0045', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U046', 'hashed_general_pass', 'GENERAL', '이준영', '금붕어', '제주 제주시 연동 46', '010-3000-0046', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U047', 'hashed_general_pass', 'GENERAL', '박지유', '종이배', '제주 제주시 연동 47', '010-3000-0047', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U048', 'hashed_general_pass', 'GENERAL', '최민서', '멜로디', '제주 제주시 연동 48', '010-3000-0048', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U049', 'hashed_general_pass', 'GENERAL', '정우진', '수수께끼', '제주 제주시 연동 49', '010-3000-0049', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U050', 'hashed_general_pass', 'GENERAL', '강서아', '몽글몽글', '제주 제주시 연동 50', '010-3000-0050', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U051', 'hashed_general_pass', 'GENERAL', '조현우', '푸딩', '경기도 수원시 팔달구 51', '010-3000-0051', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U052', 'hashed_general_pass', 'GENERAL', '윤가온', '딸기잼', '경기도 수원시 팔달구 52', '010-3000-0052', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U053', 'hashed_general_pass', 'GENERAL', '임태희', '호두과자', '경기도 수원시 팔달구 53', '010-3000-0053', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U054', 'hashed_general_pass', 'GENERAL', '홍다인', '달콤이', '경기도 수원시 팔달구 54', '010-3000-0054', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U055', 'hashed_general_pass', 'GENERAL', '변서우', '솜털', '경기도 수원시 팔달구 55', '010-3000-0055', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U056', 'hashed_general_pass', 'GENERAL', '유지호', '핑크퐁', '경기도 고양시 일산동구 56', '010-3000-0056', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U057', 'hashed_general_pass', 'GENERAL', '신지우', '아기상어', '경기도 고양시 일산동구 57', '010-3000-0057', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U058', 'hashed_general_pass', 'GENERAL', '고태준', '곰젤리', '경기도 고양시 일산동구 58', '010-3000-0058', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U059', 'hashed_general_pass', 'GENERAL', '문서현', '보라돌이', '경기도 고양시 일산동구 59', '010-3000-0059', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U060', 'hashed_general_pass', 'GENERAL', '하예나', '뚜비', '경기도 고양시 일산동구 60', '010-3000-0060', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U061', 'hashed_general_pass', 'GENERAL', '오민재', '나나', '충청남도 천안시 서북구 61', '010-3000-0061', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U062', 'hashed_general_pass', 'GENERAL', '서하진', '뽀', '충청남도 천안시 서북구 62', '010-3000-0062', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U063', 'hashed_general_pass', 'GENERAL', '전이안', '코알라', '충청남도 천안시 서북구 63', '010-3000-0063', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U064', 'hashed_general_pass', 'GENERAL', '배지우', '하마', '충청남도 천안시 서북구 64', '010-3000-0064', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U065', 'hashed_general_pass', 'GENERAL', '백정우', '기린', '충청남도 천안시 서북구 65', '010-3000-0065', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U066', 'hashed_general_pass', 'GENERAL', '노소율', '코끼리', '경상남도 창원시 성산구 66', '010-3000-0066', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U067', 'hashed_general_pass', 'GENERAL', '양준서', '홍학', '경상남도 창원시 성산구 67', '010-3000-0067', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U068', 'hashed_general_pass', 'GENERAL', '황주원', '앵무새', '경상남도 창원시 성산구 68', '010-3000-0068', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U069', 'hashed_general_pass', 'GENERAL', '송하은', '얼룩말', '경상남도 창원시 성산구 69', '010-3000-0069', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U070', 'hashed_general_pass', 'GENERAL', '남현진', '오리너구리', '경상남도 창원시 성산구 70', '010-3000-0070', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U071', 'hashed_general_pass', 'GENERAL', '곽태현', '수달', '전라북도 전주시 완산구 71', '010-3000-0071', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U072', 'hashed_general_pass', 'GENERAL', '손서아', '두더지', '전라북도 전주시 완산구 72', '010-3000-0072', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U073', 'hashed_general_pass', 'GENERAL', '정시후', '다람쥐', '전라북도 전주시 완산구 73', '010-3000-0073', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U074', 'hashed_general_pass', 'GENERAL', '김예준', '펭귄', '전라북도 전주시 완산구 74', '010-3000-0074', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U075', 'hashed_general_pass', 'GENERAL', '이하윤', '북극곰', '전라북도 전주시 완산구 75', '010-3000-0075', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U076', 'hashed_general_pass', 'GENERAL', '박지호', '아지트', '강원도 춘천시 퇴계동 76', '010-3000-0076', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U077', 'hashed_general_pass', 'GENERAL', '최가은', '비밀의방', '강원도 춘천시 퇴계동 77', '010-3000-0077', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U078', 'hashed_general_pass', 'GENERAL', '정윤서', '쪽지', '강원도 춘천시 퇴계동 78', '010-3000-0078', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U079', 'hashed_general_pass', 'GENERAL', '강도현', '우주선', '강원도 춘천시 퇴계동 79', '010-3000-0079', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U080', 'hashed_general_pass', 'GENERAL', '조서윤', '외계인', '강원도 춘천시 퇴계동 80', '010-3000-0080', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U081', 'hashed_general_pass', 'GENERAL', '윤태영', '태양계', '서울 강서구 마곡동 81', '010-3000-0081', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U082', 'hashed_general_pass', 'GENERAL', '임지우', '화성', '서울 강서구 마곡동 82', '010-3000-0082', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U083', 'hashed_general_pass', 'GENERAL', '홍시은', '목성', '서울 강서구 마곡동 83', '010-3000-0083', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U084', 'hashed_general_pass', 'GENERAL', '변준서', '토성', '서울 강서구 마곡동 84', '010-3000-0084', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U085', 'hashed_general_pass', 'GENERAL', '유은채', '명왕성', '서울 강서구 마곡동 85', '010-3000-0085', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U086', 'hashed_general_pass', 'GENERAL', '신찬우', '뽀로로', '서울 강남구 역삼동 86', '010-3000-0086', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U087', 'hashed_general_pass', 'GENERAL', '고서준', '루피', '서울 강남구 역삼동 87', '010-3000-0087', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U088', 'hashed_general_pass', 'GENERAL', '문지호', '에디', '서울 강남구 역삼동 88', '010-3000-0088', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U089', 'hashed_general_pass', 'GENERAL', '하하윤', '패티', '서울 강남구 역삼동 89', '010-3000-0089', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U090', 'hashed_general_pass', 'GENERAL', '오도윤', '크롱', '서울 강남구 역삼동 90', '010-3000-0090', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U091', 'hashed_general_pass', 'GENERAL', '서가은', '꼬마버스', '서울 서초구 반포동 91', '010-3000-0091', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U092', 'hashed_general_pass', 'GENERAL', '전현서', '타요', '서울 서초구 반포동 92', '010-3000-0092', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U093', 'hashed_general_pass', 'GENERAL', '배이안', '로기', '서울 서초구 반포동 93', '010-3000-0093', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U094', 'hashed_general_pass', 'GENERAL', '백채은', '라니', '서울 서초구 반포동 94', '010-3000-0094', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U095', 'hashed_general_pass', 'GENERAL', '노주안', '가니', '서울 서초구 반포동 95', '010-3000-0095', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U096', 'hashed_general_pass', 'GENERAL', '양나현', '젤리곰', '서울 송파구 잠실동 96', '010-3000-0096', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U097', 'hashed_general_pass', 'GENERAL', '황민재', '마카롱', '서울 송파구 잠실동 97', '010-3000-0097', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U098', 'hashed_general_pass', 'GENERAL', '송소율', '식빵', '서울 송파구 잠실동 98', '010-3000-0098', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U099', 'hashed_general_pass', 'GENERAL', '남하준', '오렌지', '서울 송파구 잠실동 99', '010-3000-0099', 'Y');
INSERT INTO smaccount.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled)
VALUES ('U100', 'hashed_general_pass', 'GENERAL', '곽아윤', '레몬즙', '서울 송파구 잠실동 100', '010-3000-0100', 'Y');

