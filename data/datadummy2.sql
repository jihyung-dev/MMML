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

-- =============================
--  DUMMY DATA: smaccount.SUB_CATEGORY (소분류)
-- =============================

-- C01: 식비 (Food)
-- INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0101', '외식', 'C01');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0102', '식재료/장보기', 'C01');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0103', '간식/커피', 'C01');

-- C02: 교통/차량 (Traffic/Vehicle)
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0201', '대중교통', 'C02');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0202', '택시/주차', 'C02');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0203', '주유/차량관리', 'C02');

-- C03: 생활/가정 (Living/Household)
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0301', '공과금/통신', 'C03');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0302', '생활용품', 'C03');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0303', '가구/인테리어', 'C03');

-- C08: 급여 (Income - Salary)
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0801', '정기급여', 'C08');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC0802', '부수입', 'C08');

-- C10: 패션/의류 (HotDeal - Fashion)
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC1001', '남성의류', 'C10');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC1002', '여성의류', 'C10');

-- C11: 가전/디지털 (HotDeal - Electronics)
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC1101', 'TV/영상가전', 'C11');
INSERT INTO smaccount.SUB_CATEGORY (sub_id, sub_category_name, category_id) VALUES ('SC1102', '컴퓨터/노트북', 'C11');

-- =============================
--  DUMMY DATA: smaccount.BUDGET_GROUP
--  총 5개의 가계부 그룹 데이터를 삽입합니다.
-- =============================

-- 1. 가족 가계부 (소유자: U016 - 커피잔)
INSERT INTO smaccount.BUDGET_GROUP (group_id, group_name, owner_id)
VALUES (smaccount.SEQ_GROUP.NEXTVAL, '행복한 우리 가족 가계부', 'U016');

-- 2. 신혼부부 가계부 (소유자: U017 - 연필심)
INSERT INTO smaccount.BUDGET_GROUP (group_id, group_name, owner_id)
VALUES (smaccount.SEQ_GROUP.NEXTVAL, '연필심&그림자 신혼 지출', 'U017');

-- 3. 자취생 생활비 (소유자: U020 - 푸른숲)
INSERT INTO smaccount.BUDGET_GROUP (group_id, group_name, owner_id)
VALUES (smaccount.SEQ_GROUP.NEXTVAL, '푸른숲의 알뜰 자취 생활', 'U020');

-- 4. 직장 동료 점심 그룹 (소유자: U021 - 고양이발)
INSERT INTO smaccount.BUDGET_GROUP (group_id, group_name, owner_id)
VALUES (smaccount.SEQ_GROUP.NEXTVAL, '판교 직장인 공동 식비', 'U021');

-- 5. 비상금 관리 그룹 (소유자: U025 - 별똥별)
INSERT INTO smaccount.BUDGET_GROUP (group_id, group_name, owner_id)
VALUES (smaccount.SEQ_GROUP.NEXTVAL, '별똥별 비상금 및 저축', 'U025');

-- =============================
--  DUMMY DATA: smaccount.GROUP_MEMBER
--  그룹(GROUP_ID: 1~5)에 멤버를 연결합니다.
-- =============================

-- 그룹 1: 행복한 우리 가족 가계부 (U016 소유)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 1, 'U016', 'OWNER'); -- 김지훈 (커피잔)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 1, 'U018', 'MEMBER'); -- 박주원 (그림자)

-- 그룹 2: 연필심&그림자 신혼 지출 (U017 소유)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 2, 'U017', 'OWNER'); -- 이서현 (연필심)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 2, 'U019', 'MEMBER'); -- 최유진 (구름빵)

-- 그룹 3: 푸른숲의 알뜰 자취 생활 (U020 소유 - 1인 그룹)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 3, 'U020', 'OWNER'); -- 정승우 (푸른숲)

-- 그룹 4: 판교 직장인 공동 식비 (U021 소유)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 4, 'U021', 'OWNER');  -- 강하늘 (고양이발)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 4, 'U022', 'MEMBER'); -- 조민서 (달팽이)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 4, 'U023', 'MEMBER'); -- 윤수빈 (무지개)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 4, 'U024', 'MEMBER'); -- 임재현 (아침이슬)

-- 그룹 5: 별똥별 비상금 및 저축 (U025 소유)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 5, 'U025', 'OWNER'); -- 홍도현 (별똥별)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 5, 'U026', 'MEMBER'); -- 변지우 (시계탑)
INSERT INTO smaccount.GROUP_MEMBER (group_member_id, group_id, member_id, role)
VALUES (smaccount.SEQ_GROUP_MEMBER.NEXTVAL, 5, 'U030', 'MEMBER'); -- 문찬우 (토마토)

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

-- =============================
--  DUMMY DATA: smaccount.BOARD_POST (게시글)
--  총 35개의 게시글 데이터를 삽입합니다.
--  카테고리: 자유게시판, 가계부 팁, 핫딜 정보
--  참조: writer_id (U001~U100)
-- =============================

-- ADMIN (U001: 샛별, U002: 해찬, U003: 달무리)
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '서비스 개선 요청 및 버그 보고', '최근 업데이트된 기능 중 오류가 발견되어 문의 드립니다. 빠른 확인 부탁드립니다. 특히 ''API 연동'' 부분에서 오류가 자주 발생합니다.', 'U001', 180);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '2025년 가계부 계획: 예산 책정 시 고려할 5가지 요소', '내년도 가계부 계획을 위한 전문가의 팁입니다. 항목별 예산 비율을 확인하세요.', 'U002', 450);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '운영자가 추천하는 절세 노하우 공유', '놓치기 쉬운 연말 소득 공제 항목들을 정리했습니다. 반드시 ''확인''하세요.', 'U003', 380);

-- SELLER (U006: 황금손, U009: 꿀단지, U013: 미소상점, U014: 새벽시장, U015: 완판녀)
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', '황금손 마트: 신선한 과일 3종 한정 핫딜!', '오늘 새벽 수확한 제철 과일 모음 핫딜! 재고 200개 한정 판매합니다.', 'U006', 700);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', '꿀단지 전자: 4K 모니터 27인치 특가!', '재택 근무 필수템! 꿀단지 전자에서 초고화질 모니터를 한정 수량 판매합니다. ''최저가'' 보장합니다.', 'U009', 950);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', '미소상점: 여성 겨울 부츠/신발 대규모 할인전', '미소상점에서 겨울 신상품을 최대 70%까지 할인합니다. 사이즈 ''품절'' 주의! (U013)', 'U013', 620);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', '새벽시장: 인스턴트 커피/티 대용량 번들 핫딜', '사무실/가정용 대용량 커피 및 차를 저렴하게 구매하세요. 유통기한 ''넉넉''합니다.', 'U014', 490);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', '완판녀: 인기 육아용품(기저귀, 분유) 선착순 핫딜', '맘카페 인기 육아용품을 빠르게 겟하세요! 1인당 2개 한정. ''품절임박''.', 'U015', 880);

-- GENERAL MEMBER (주요 멤버)
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '커피값 절약 노하우: 텀블러 사용 & 편의점 커피 활용', '매일 마시는 커피값만 줄여도 연말에 큰 돈이 모입니다. 저의 ''절약 루틴''을 공유해요.', 'U016', 310);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '신혼 가구 구매 비용, 어느 카테고리에 넣어야 할까요?', '가구/인테리어 vs 생활/가정? ''고민''입니다.', 'U017', 150);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '자취생 냉장고 파먹기 챌린지 1주차 후기', '식재료 낭비 없이 알뜰하게 요리하는 방법 공유. ''이거'' 모르면 손해예요!', 'U020', 550);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '재테크 입문자, 첫 투자 상품 추천해주세요!', '주식, 펀드, 적금 중 어떤 것으로 시작해야 할지 모르겠습니다. ''전문가'' 조언 환영합니다.', 'U025', 290);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '월별 소비패턴 분석 리포트, 어떻게 활용해야 할까요?', '리포트는 받았는데 어떻게 ''개선''해야 할지 막막합니다.', 'U040', 170);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '나만의 비상금 통장 운영 방법', '급여 통장과 분리하여 비상금을 모으는 ''노하우''를 공개합니다.', 'U081', 210);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '보험료 이중 지출 막는 방법 (숨은 보험금 찾기 팁)', '가입된 보험 내역을 가계부와 ''연동''하여 관리하세요.', 'U091', 145);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '요즘 배달비 너무 비싸지 않나요? 외식 대신 뭘 드시나요?', '배달음식 지출이 심각해서 고민입니다. ''밀키트'' 추천해주세요!', 'U033', 185);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', '동남아시아 3박 4일 항공권 패키지 핫딜!', '특가 항공권과 숙박이 포함된 여행 패키지 핫딜 정보입니다. ''휴가'' 가실 분들 보세요.', 'U077', 720);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '차량 유지비(주유, 보험, 수리) 효율적으로 관리하기', '자가용을 소유하신 분들을 위한 ''비용 절감'' 팁입니다.', 'U043', 160);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '다들 경조사비는 월 예산에 포함하시나요, 비정기 지출로 빼시나요?', '경조사비 ''비정기 지출'' 관리가 늘 어렵습니다. 여러분의 팁은 무엇인가요?', 'U058', 110);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '카드 포인트/마일리지 효율적인 활용 방법', '잠자고 있는 카드 혜택을 가계부로 확인하고 ''현금''처럼 사용하세요.', 'U068', 125);

-- 기타 일반 회원 글 (Post ID 23 ~ 35)
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', '유명 브랜드 여성 핸드백 한정판 핫딜!', '현금부자 셀러의 특별 핫딜! ''선착순'' 판매입니다.', 'U012', 550); -- SELLER
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '월급 5년 차, 아직도 적금만... 투자 고민 조언해주세요.', '슬슬 투자를 시작해야 할 것 같은데, ''안정적인'' 상품 추천받습니다.', 'U097', 190);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '월세/전세 대출 이자, 가계부에 어떻게 기록하는 게 좋을까요?', '월세/전세 대출 이자를 ''고정 지출''로 넣는 게 맞는지, ''금융 지출''로 넣어야 할지 헷갈립니다.', 'U038', 95);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', '캠핑 테이블/의자 세트 50% 반값 핫딜!', '금붕어 셀러가 추천하는 가을 ''캠핑 용품'' 핫딜! 수량 제한 있어요.', 'U046', 310);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '가장 좋아하는 가계부 카테고리는 무엇인가요?', '저는 문화/여가 지출을 가장 즐겨 ''기록''합니다. 여러분은요?', 'U060', 80);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '식비 30만원으로 2인 가구 한 달 살기 성공기', '식재료 대량 구매와 ''밀키트'' 활용 꿀팁을 대방출합니다.', 'U051', 280);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', 'LG 스타일러 오브제컬렉션 특가!', '혼수 필수템! 스타일러 최신 모델 핫딜 정보입니다. ''새벽시장''에서 만나보세요.', 'U014', 690); -- SELLER
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '부모님께 용돈 드리는 지출은 어떤 카테고리에 넣으시나요?', '''경조사/선물''로 넣기에는 애매하고... 다들 어떻게 분류하시나요?', 'U071', 115);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '수입의 70% 저축 목표 달성! 비결은?', ' ''화성'' 닉네임의 절약 고수 비결! 통장 쪼개기가 핵심입니다.', 'U082', 340);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', '해외 직구 건강식품 역대급 할인!', '황금손 마트에서 오메가3, 비타민 등 ''필수'' 건강식품을 초특가에 드립니다.', 'U006', 420); -- SELLER
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '여행 경비 절약을 위한 나만의 꿀팁', ' ''라니''가 공유하는 항공권/숙박 ''최저가'' 찾는 팁!', 'U094', 130);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '영수증 자동 인식 오류, 해결 방법은?', '카메라로 영수증을 인식할 때 ''오차''가 너무 심해서 고민입니다.', 'U045', 105);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', '샤오미 로봇 청소기 5세대 초특가!', '꿀단지 전자에서 ''단독'' 진행하는 로봇 청소기 핫딜!', 'U009', 750); -- SELLER
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '나의 다음 재무 목표는?', '저는 전세자금 대출 상환입니다! 여러분의 ''다음 목표''는 무엇인가요?', 'U028', 99);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '월세나 대출 이자, ''고정 지출''로 분류하시나요?', ' ''나나''가 묻습니다. 매달 나가는 금융 지출, 어떻게 ''관리''하는 게 좋을까요?', 'U061', 140);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', '인기 스킨케어 브랜드 세트 한정 핫딜', '완판녀가 추천하는 ''인기'' 스킨케어 세트! 쟁여두세요.', 'U015', 310); -- SELLER
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '자유게시판', '앱에서 지출 내역 CSV 추출 기능, 잘 쓰고 계시나요?', '저처럼 ''데이터 분석''을 위해 사용하시는 분들 있나요?', 'U090', 70);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '가계부 팁', '가족 간 돈 거래 기록은 어떻게 하시나요?', '''그룹 가계부''를 사용하지만, 가족 간의 개인적인 돈 거래 기록은 어떻게 하는 것이 좋을까요?', 'U018', 120);
INSERT INTO smaccount.BOARD_POST (post_id, category, post_title, post_content, writer_id, view_cnt)
VALUES (smaccount.SEQ_POST.NEXTVAL, '핫딜 정보', '고급 호텔 1박 숙박권 할인 (주중 한정)', '''비밀의 방'' 셀러가 제공하는 연말 호캉스 핫딜!', 'U077', 560);

-- =============================
--  DUMMY DATA: smaccount.BOARD_COMMENT (댓글 및 대댓글)
--  총 50개의 댓글 데이터를 삽입합니다.
--  참조: post_id (1~35), writer_id (U001~U100)
-- =============================

-- POST 1 (서비스 개선 요청) 댓글
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 1, 'U004', NULL, 'UI/UX 디자인이 아직 복잡한 것 같아요. 특히 모바일에서 지출 입력이 불편합니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 1, 'U001', NULL, '의견 감사합니다. 해당 부분은 최우선으로 검토하겠습니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 1, 'U084', 2, '맞아요, 특히 지출 입력 시 ''카드/현금'' 선택 단계가 너무 많아요.');

-- POST 5 (황금손 마트 핫딜) 댓글
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 4, 'U044', NULL, '황금손 마트의 과일 품질은 어떤가요? 리뷰 궁금합니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 4, 'U006', 4, '직접 수확한 상품으로 최상급 품질을 보장합니다! ''극찬'' 후기가 많습니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 4, 'U055', NULL, '유기농 채소는 못 참고 구매했어요! 기대됩니다.');

-- POST 11 (자취생 냉장고 파먹기) 댓글
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 11, 'U033', NULL, '저도 냉장고 파먹기에 도전했는데 3일 만에 포기했어요..ㅜㅠ 비결이 있나요?');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 11, 'U020', 7, '파이팅입니다! ''소스류''만 잘 갖춰놓으면 성공하실 거예요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 11, 'U037', 8, '혹시 추천하는 만능 소스 레시피가 있나요? 쪽지로 부탁드려요.');

-- POST 15 (보험료 이중 지출) 댓글
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 15, 'U013', NULL, '저도 숨은 보험금 팁 덕분에 불필요한 보험료를 ''해지''했습니다. 감사해요!');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 15, 'U090', NULL, '보험금은 정기 지출로 잡고 월별로 ''보장 내용''을 확인하는 것이 필수인 것 같아요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 15, 'U042', 10, '맞습니다. 특히 ''실비''는 꼭 확인해야 합니다.');

-- POST 16 (배달비 고민) 댓글
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 18, 'U004', NULL, '저는 주 1회만 배달시키고, 나머지는 ''밀키트''로 대체하고 있습니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 18, 'U089', NULL, '배달비가 아까워서 ''포장 할인''만 이용합니다! 외식은 자제 중이에요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 18, 'U033', 14, '포장 할인, 좋은 팁이네요! ''오늘'' 저녁부터 시도해봐야겠어요.');

-- POST 21 (경조사비) 댓글
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 21, 'U096', NULL, '저는 월별 예산에 포함하지 않고 ''비정기 지출'' 통장에 따로 모아둡니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content)
VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 21, 'U095', 17, '비정기 지출 통장! 저도 그 방법으로 바꿔야겠어요. ''총알 장전''에 최고입니다.');

-- 기타 댓글 (20-50)
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 2, 'U041', NULL, '예산 책정 팁 감사합니다! ''급여'' 카테고리는 월별 변동이 없어서 편하네요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 3, 'U052', NULL, '연말정산 미리 준비해야 하는데 막막합니다. ''달무리''님 팁 감사합니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 6, 'U011', NULL, '모니터 ''색감''은 어떤지 궁금합니다. 디자인 작업용으로 쓸 수 있을까요?');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 6, 'U009', 22, '판매자입니다. ''전문가''급은 아니지만, 일반적인 디자인 작업에는 충분합니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 10, 'U036', NULL, '신혼 가구는 ''가구/인테리어''로 크게 잡고 서브 카테고리를 나누는 게 깔끔해요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 10, 'U017', 24, '저희도 그렇게 정했습니다. 감사합니다!');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 12, 'U074', NULL, '재테크 입문은 무조건 ''소액''으로 펀드부터 시작하는 것을 추천합니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 12, 'U025', 26, '맞아요. ''별똥별''님 말씀대로 소액으로 시작해보세요!');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 13, 'U098', NULL, '소비패턴 리포트에서 ''커피 지출''이 가장 많아서 충격받았습니다. 절약해야겠어요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 13, 'U040', 28, '리포트를 보고 개선하는 것이 중요합니다! 화이팅!');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 14, 'U038', NULL, '비상금 통장 운영 팁은 ''자동 이체''와 ''적금 만기일'' 활용입니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 17, 'U053', NULL, 'LG 스타일러 핫딜이라니! 품절되기 전에 달려갑니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 17, 'U014', 31, '새벽시장입니다. ''재고 소진 임박''입니다!');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 19, 'U048', NULL, '주말 숙박권은 없나요? 주중에 시간을 내기 어렵네요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 19, 'U077', 33, '현재는 주중 한정입니다. 주말 특가도 ''준비 중''입니다!');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 20, 'U065', NULL, '차량 유지비는 ''보험료''가 가장 큰 고정 지출인 것 같아요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 20, 'U043', 35, '맞습니다. ''연납'' 할인 팁을 활용해보세요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 23, 'U056', NULL, '핸드백 핫딜 구경 왔어요! ''현금부자''님 감사합니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 27, 'U021', NULL, '식비 30만원 챌린지! ''비법서''가 따로 있나요?');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 27, 'U051', 38, '따로 없고, 모든 식재료를 ''최대한'' 활용하는 것이 비결입니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 29, 'U093', NULL, '70% 저축은 ''신의 경지''입니다. 비결 공유 감사합니다!');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 31, 'U094', NULL, '여행 경비는 ''현지 물가''를 고려하여 예산을 짜는 게 중요해요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 33, 'U009', NULL, '로봇 청소기 핫딜은 ''오늘''까지입니다! 서두르세요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 34, 'U062', NULL, '가족 간 돈 거래는 ''차입금''으로 기록하고 상환하는 것이 좋더라고요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 34, 'U018', 43, '맞아요. 나중에 ''정산''할 때 편합니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 35, 'U070', NULL, 'CSV 추출 기능으로 ''월간 분석''을 해봤는데 정말 유용했어요.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 1, 'U050', 3, '저도 ''모바일 입력''에 대한 의견에 한 표입니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 10, 'U092', 24, '저도 미니멀 라이프 도전 중입니다!');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 24, 'U066', 36, '맞습니다. ''작은 핫딜''이라도 놓치지 않는 게 중요하죠.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 32, 'U099', 40, '저도 ''오차'' 문제 때문에 수동으로 수정하는 경우가 많습니다.');
INSERT INTO smaccount.BOARD_COMMENT (comment_id, post_id, writer_id, parent_comment_id, comment_content) VALUES (smaccount.SEQ_COMMENT.NEXTVAL, 32, 'U045', 49, '''수동 수정'' 기능이 좀 더 편해졌으면 좋겠어요.');

-- =============================
--  DUMMY DATA: smaccount.BOARD_LIKE (좋아요)
--  총 60개의 좋아요 데이터를 삽입합니다. (post_id와 member_id는 UNIQUE)
-- =============================

-- POST 2 (2025년 가계부 계획)에 대한 좋아요 (총 10개)
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 2, 'U016');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 2, 'U017');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 2, 'U018');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 2, 'U019');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 2, 'U020');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 2, 'U021');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 2, 'U022');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 2, 'U023');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 2, 'U024');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 2, 'U025');

-- POST 7 (교통비 절약 팁)에 대한 좋아요 (총 10개)
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 7, 'U031');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 7, 'U032');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 7, 'U033');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 7, 'U034');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 7, 'U035');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 7, 'U036');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 7, 'U037');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 7, 'U038');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 7, 'U039');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 7, 'U040');

-- POST 19 (호텔/리조트 핫딜)에 대한 좋아요 (총 10개)
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 19, 'U041');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 19, 'U042');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 19, 'U043');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 19, 'U044');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 19, 'U045');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 19, 'U046');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 19, 'U047');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 19, 'U048');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 19, 'U049');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 19, 'U050');

-- 기타 게시글에 대한 좋아요 (총 30개)
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 1, 'U051');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 3, 'U052');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 4, 'U053');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 5, 'U054');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 6, 'U055');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 8, 'U056');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 9, 'U057');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 10, 'U058');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 11, 'U059');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 12, 'U060');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 13, 'U061');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 14, 'U062');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 15, 'U063');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 16, 'U064');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 17, 'U065');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 18, 'U066');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 20, 'U067');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 21, 'U068');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 22, 'U069');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 23, 'U070');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 24, 'U071');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 25, 'U072');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 26, 'U073');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 27, 'U074');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 28, 'U075');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 29, 'U076');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 30, 'U078');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 31, 'U079');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 32, 'U080');
INSERT INTO smaccount.BOARD_LIKE (board_like_id, post_id, member_id) VALUES (smaccount.SEQ_BOARD_LIKE.NEXTVAL, 34, 'U081');

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

commit;