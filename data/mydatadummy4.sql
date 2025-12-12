-- ============================================================
--  DUMMY DATA: MMML.MEMBER (총 100개)
--  Gender, Age, Email 데이터 추가
-- ============================================================

-- 관리자 (ADMIN): ID U001 ~ U005
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U001', 'hashed_admin_pass', 'ADMIN', '김민준', '샛별', '서울시 종로구 세종대로 1', '010-1111-0001', 'Y', 'M', 35, 'minjun.kim@smu.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U002', 'hashed_admin_pass', 'ADMIN', '이서준', '해찬', '서울시 종로구 세종대로 2', '010-1111-0002', 'Y', 'M', 28, 'seojun.lee@smu.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U003', 'hashed_admin_pass', 'ADMIN', '박지아', '달무리', '서울시 종로구 세종대로 3', '010-1111-0003', 'Y', 'F', 24, 'jiya.park@smu.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U004', 'hashed_admin_pass', 'ADMIN', '최은우', '은하수', '서울시 종로구 세종대로 4', '010-1111-0004', 'Y', 'F', 31, 'eunwoo.choi@smu.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U005', 'hashed_admin_pass', 'ADMIN', '정하윤', '바람꽃', '서울시 종로구 세종대로 5', '010-1111-0005', 'Y', 'M', 40, 'hayun.jung@smu.com');

-- 판매자 (SELLER) 역할 회원: ID U006 ~ U015
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U006', 'hashed_seller_pass', 'SELLER', '김태영', '황금손', '경기도 성남시 분당구 판교로 6', '010-2222-0006', 'Y', 'M', 45, 'ty.kim@seller.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U007', 'hashed_seller_pass', 'SELLER', '이지유', '장바구니', '경기도 성남시 분당구 판교로 7', '010-2222-0007', 'Y', 'F', 32, 'jiyu.lee@seller.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U008', 'hashed_seller_pass', 'SELLER', '박시후', '보따리', '경기도 성남시 분당구 판교로 8', '010-2222-0008', 'Y', 'M', 29, 'sh.park@seller.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U009', 'hashed_seller_pass', 'SELLER', '최서윤', '꿀단지', '경기도 성남시 분당구 판교로 9', '010-2222-0009', 'Y', 'F', 38, 'sy.choi@seller.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U010', 'hashed_seller_pass', 'SELLER', '정윤호', '대박점', '경기도 성남시 분당구 판교로 10', '010-2222-0010', 'Y', 'M', 51, 'yh.jung@seller.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U011', 'hashed_seller_pass', 'SELLER', '김예나', '득템요정', '경기도 성남시 분당구 판교로 11', '010-2222-0011', 'Y', 'F', 26, 'yn.kim@seller.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U012', 'hashed_seller_pass', 'SELLER', '이로운', '현금부자', '경기도 성남시 분당구 판교로 12', '010-2222-0012', 'Y', 'M', 33, 'rw.lee@seller.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U013', 'hashed_seller_pass', 'SELLER', '박도준', '미소상점', '경기도 성남시 분당구 판교로 13', '010-2222-0013', 'Y', 'M', 41, 'dj.park@seller.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U014', 'hashed_seller_pass', 'SELLER', '최아린', '새벽시장', '경기도 성남시 분당구 판교로 14', '010-2222-0014', 'Y', 'F', 30, 'ar.choi@seller.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U015', 'hashed_seller_pass', 'SELLER', '정서우', '완판녀', '경기도 성남시 분당구 판교로 15', '010-2222-0015', 'Y', 'F', 27, 'sw.jung@seller.com');

-- 일반회원 (GENERAL): ID U016 ~ U100 (85명) - 일부만 표시
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U016', 'hashed_general_pass', 'GENERAL', '김지훈', '커피잔', '인천 연수구 송도동 16', '010-3000-0016', 'Y', 'M', 30, 'jh.kim@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U017', 'hashed_general_pass', 'GENERAL', '이서현', '연필심', '인천 연수구 송도동 17', '010-3000-0017', 'Y', 'F', 28, 'sh.lee@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U018', 'hashed_general_pass', 'GENERAL', '박주원', '그림자', '인천 연수구 송도동 18', '010-3000-0018', 'Y', 'M', 34, 'jw.park@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U019', 'hashed_general_pass', 'GENERAL', '최유진', '구름빵', '인천 연수구 송도동 19', '010-3000-0019', 'Y', 'F', 25, 'yj.choi@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U020', 'hashed_general_pass', 'GENERAL', '정승우', '푸른숲', '인천 연수구 송도동 20', '010-3000-0020', 'Y', 'M', 22, 'sw.jung@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U021', 'hashed_general_pass', 'GENERAL', '강하늘', '고양이발', '부산 해운대구 우동 21', '010-3000-0021', 'Y', 'M', 31, 'hn.kang@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U022', 'hashed_general_pass', 'GENERAL', '조민서', '달팽이', '부산 해운대구 우동 22', '010-3000-0022', 'Y', 'F', 29, 'ms.jo@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U023', 'hashed_general_pass', 'GENERAL', '윤수빈', '무지개', '부산 해운대구 우동 23', '010-3000-0023', 'Y', 'F', 24, 'sb.yoon@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U024', 'hashed_general_pass', 'GENERAL', '임재현', '아침이슬', '부산 해운대구 우동 24', '010-3000-0024', 'Y', 'M', 27, 'jh.lim@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U025', 'hashed_general_pass', 'GENERAL', '홍도현', '별똥별', '부산 해운대구 우동 25', '010-3000-0025', 'Y', 'M', 36, 'dh.hong@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U026', 'hashed_general_pass', 'GENERAL', '변지우', '시계탑', '대구 수성구 범어동 26', '010-3000-0026', 'Y', 'F', 39, 'jw.byun@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U027', 'hashed_general_pass', 'GENERAL', '유시은', '바다소금', '대구 수성구 범어동 27', '010-3000-0027', 'Y', 'F', 23, 'se.yoo@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U028', 'hashed_general_pass', 'GENERAL', '신준서', '민트향', '대구 수성구 범어동 28', '010-3000-0028', 'Y', 'M', 37, 'js.shin@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U029', 'hashed_general_pass', 'GENERAL', '고은채', '노을빛', '대구 수성구 범어동 29', '010-3000-0029', 'Y', 'F', 26, 'ec.go@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U030', 'hashed_general_pass', 'GENERAL', '문찬우', '토마토', '대구 수성구 범어동 30', '010-3000-0030', 'Y', 'M', 30, 'cw.moon@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U031', 'hashed_general_pass', 'GENERAL', '하서준', '솜사탕', '광주 서구 상무지구 31', '010-3000-0031', 'Y', 'M', 25, 'sj.ha@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U032', 'hashed_general_pass', 'GENERAL', '오지호', '보름달', '광주 서구 상무지구 32', '010-3000-0032', 'Y', 'M', 42, 'jh.oh@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U033', 'hashed_general_pass', 'GENERAL', '서하윤', '꼬꼬마', '광주 서구 상무지구 33', '010-3000-0033', 'Y', 'F', 21, 'hy.seo@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U034', 'hashed_general_pass', 'GENERAL', '전도윤', '단풍잎', '광주 서구 상무지구 34', '010-3000-0034', 'Y', 'M', 35, 'dy.jeon@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U035', 'hashed_general_pass', 'GENERAL', '배가은', '봄햇살', '광주 서구 상무지구 35', '010-3000-0035', 'Y', 'F', 28, 'ge.bae@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U036', 'hashed_general_pass', 'GENERAL', '백현서', '철수', '대전 유성구 도룡동 36', '010-3000-0036', 'Y', 'M', 33, 'hs.baek@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U037', 'hashed_general_pass', 'GENERAL', '노이안', '영희', '대전 유성구 도룡동 37', '010-3000-0037', 'Y', 'F', 40, 'ia.noh@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U038', 'hashed_general_pass', 'GENERAL', '양채은', '뚝배기', '대전 유성구 도룡동 38', '010-3000-0038', 'Y', 'F', 27, 'ce.yang@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U039', 'hashed_general_pass', 'GENERAL', '황주안', '짱구', '대전 유성구 도룡동 39', '010-3000-0039', 'Y', 'M', 31, 'ja.hwang@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U040', 'hashed_general_pass', 'GENERAL', '송나현', '유리구슬', '대전 유성구 도룡동 40', '010-3000-0040', 'Y', 'F', 29, 'nh.song@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U041', 'hashed_general_pass', 'GENERAL', '남현진', '잠만보', '울산 남구 삼산동 41', '010-3000-0041', 'Y', 'M', 44, 'hj.nam@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U042', 'hashed_general_pass', 'GENERAL', '곽민재', '춤추는돌', '울산 남구 삼산동 42', '010-3000-0042', 'Y', 'M', 25, 'mj.kwak@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U043', 'hashed_general_pass', 'GENERAL', '손소율', '미역국', '울산 남구 삼산동 43', '010-3000-0043', 'Y', 'F', 37, 'sy.sohn@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U044', 'hashed_general_pass', 'GENERAL', '정하준', '은쟁반', '울산 남구 삼산동 44', '010-3000-0044', 'Y', 'M', 30, 'hj.jung@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U045', 'hashed_general_pass', 'GENERAL', '김아윤', '물방울', '울산 남구 삼산동 45', '010-3000-0045', 'Y', 'F', 22, 'ay.kim@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U046', 'hashed_general_pass', 'GENERAL', '이준영', '금붕어', '제주 제주시 연동 46', '010-3000-0046', 'Y', 'M', 36, 'jy.lee@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U047', 'hashed_general_pass', 'GENERAL', '박지유', '종이배', '제주 제주시 연동 47', '010-3000-0047', 'Y', 'F', 29, 'ju.park@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U048', 'hashed_general_pass', 'GENERAL', '최민서', '멜로디', '제주 제주시 연동 48', '010-3000-0048', 'Y', 'M', 27, 'ms.choi@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U049', 'hashed_general_pass', 'GENERAL', '정우진', '수수께끼', '제주 제주시 연동 49', '010-3000-0049', 'Y', 'M', 34, 'wj.jung@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U050', 'hashed_general_pass', 'GENERAL', '강서아', '몽글몽글', '제주 제주시 연동 50', '010-3000-0050', 'Y', 'F', 25, 'sa.kang@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U051', 'hashed_general_pass', 'GENERAL', '조현우', '푸딩', '경기도 수원시 팔달구 51', '010-3000-0051', 'Y', 'M', 31, 'hw.jo@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U052', 'hashed_general_pass', 'GENERAL', '윤가온', '딸기잼', '경기도 수원시 팔달구 52', '010-3000-0052', 'Y', 'F', 38, 'go.yoon@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U053', 'hashed_general_pass', 'GENERAL', '임태희', '호두과자', '경기도 수원시 팔달구 53', '010-3000-0053', 'Y', 'M', 28, 'th.lim@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U054', 'hashed_general_pass', 'GENERAL', '홍다인', '달콤이', '경기도 수원시 팔달구 54', '010-3000-0054', 'Y', 'F', 24, 'di.hong@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U055', 'hashed_general_pass', 'GENERAL', '변서우', '솜털', '경기도 수원시 팔달구 55', '010-3000-0055', 'Y', 'M', 33, 'sw.byun@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U056', 'hashed_general_pass', 'GENERAL', '유지호', '핑크퐁', '경기도 고양시 일산동구 56', '010-3000-0056', 'Y', 'M', 45, 'jh.yoo@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U057', 'hashed_general_pass', 'GENERAL', '신지우', '아기상어', '경기도 고양시 일산동구 57', '010-3000-0057', 'Y', 'F', 22, 'jw.shin@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U058', 'hashed_general_pass', 'GENERAL', '고태준', '곰젤리', '경기도 고양시 일산동구 58', '010-3000-0058', 'Y', 'M', 39, 'tj.go@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U059', 'hashed_general_pass', 'GENERAL', '문서현', '보라돌이', '경기도 고양시 일산동구 59', '010-3000-0059', 'Y', 'F', 31, 'sh.moon@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U060', 'hashed_general_pass', 'GENERAL', '하예나', '뚜비', '경기도 고양시 일산동구 60', '010-3000-0060', 'Y', 'F', 28, 'yn.ha@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U061', 'hashed_general_pass', 'GENERAL', '오민재', '나나', '충청남도 천안시 서북구 61', '010-3000-0061', 'Y', 'M', 40, 'mj.oh@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U062', 'hashed_general_pass', 'GENERAL', '서하진', '뽀', '충청남도 천안시 서북구 62', '010-3000-0062', 'Y', 'F', 25, 'hj.seo@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U063', 'hashed_general_pass', 'GENERAL', '전이안', '코알라', '충청남도 천안시 서북구 63', '010-3000-0063', 'Y', 'M', 23, 'ia.jeon@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U064', 'hashed_general_pass', 'GENERAL', '배지우', '하마', '충청남도 천안시 서북구 64', '010-3000-0064', 'Y', 'F', 37, 'jw.bae@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U065', 'hashed_general_pass', 'GENERAL', '백정우', '기린', '충청남도 천안시 서북구 65', '010-3000-0065', 'Y', 'M', 28, 'jw.baek@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U066', 'hashed_general_pass', 'GENERAL', '노소율', '코끼리', '경상남도 창원시 성산구 66', '010-3000-0066', 'Y', 'F', 30, 'sy.roh@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U067', 'hashed_general_pass', 'GENERAL', '양준서', '홍학', '경상남도 창원시 성산구 67', '010-3000-0067', 'Y', 'M', 32, 'js.yang@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U068', 'hashed_general_pass', 'GENERAL', '황주원', '앵무새', '경상남도 창원시 성산구 68', '010-3000-0068', 'Y', 'M', 26, 'jw.hwang@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U069', 'hashed_general_pass', 'GENERAL', '송하은', '얼룩말', '경상남도 창원시 성산구 69', '010-3000-0069', 'Y', 'F', 29, 'he.song@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U070', 'hashed_general_pass', 'GENERAL', '남현진', '오리너구리', '경상남도 창원시 성산구 70', '010-3000-0070', 'Y', 'M', 34, 'hj.nam@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U071', 'hashed_general_pass', 'GENERAL', '곽태현', '수달', '전라북도 전주시 완산구 71', '010-3000-0071', 'Y', 'M', 41, 'th.kwak@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U072', 'hashed_general_pass', 'GENERAL', '손서아', '두더지', '전라북도 전주시 완산구 72', '010-3000-0072', 'Y', 'F', 27, 'sa.sohn@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U073', 'hashed_general_pass', 'GENERAL', '정시후', '다람쥐', '전라북도 전주시 완산구 73', '010-3000-0073', 'Y', 'M', 25, 'sh.jung@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U074', 'hashed_general_pass', 'GENERAL', '김예준', '펭귄', '전라북도 전주시 완산구 74', '010-3000-0074', 'Y', 'M', 38, 'yj.kim@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U075', 'hashed_general_pass', 'GENERAL', '이하윤', '북극곰', '전라북도 전주시 완산구 75', '010-3000-0075', 'Y', 'F', 29, 'hy.lee@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U076', 'hashed_general_pass', 'GENERAL', '박지호', '아지트', '강원도 춘천시 퇴계동 76', '010-3000-0076', 'Y', 'M', 31, 'jh.park@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U077', 'hashed_general_pass', 'GENERAL', '최가은', '비밀의방', '강원도 춘천시 퇴계동 77', '010-3000-0077', 'Y', 'F', 24, 'ge.choi@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U078', 'hashed_general_pass', 'GENERAL', '정윤서', '쪽지', '강원도 춘천시 퇴계동 78', '010-3000-0078', 'Y', 'F', 35, 'ys.jung@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U079', 'hashed_general_pass', 'GENERAL', '강도현', '우주선', '강원도 춘천시 퇴계동 79', '010-3000-0079', 'Y', 'M', 28, 'dh.kang@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U080', 'hashed_general_pass', 'GENERAL', '조서윤', '외계인', '강원도 춘천시 퇴계동 80', '010-3000-0080', 'Y', 'F', 43, 'sy.jo@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U081', 'hashed_general_pass', 'GENERAL', '윤태영', '태양계', '서울 강서구 마곡동 81', '010-3000-0081', 'Y', 'M', 37, 'ty.yoon@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U082', 'hashed_general_pass', 'GENERAL', '임지우', '화성', '서울 강서구 마곡동 82', '010-3000-0082', 'Y', 'F', 29, 'jw.lim@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U083', 'hashed_general_pass', 'GENERAL', '홍시은', '목성', '서울 강서구 마곡동 83', '010-3000-0083', 'Y', 'F', 22, 'se.hong@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U084', 'hashed_general_pass', 'GENERAL', '변준서', '토성', '서울 강서구 마곡동 84', '010-3000-0084', 'Y', 'M', 30, 'js.byun@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U085', 'hashed_general_pass', 'GENERAL', '유은채', '명왕성', '서울 강서구 마곡동 85', '010-3000-0085', 'Y', 'F', 26, 'ec.yoo@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U086', 'hashed_general_pass', 'GENERAL', '신찬우', '뽀로로', '서울 강남구 역삼동 86', '010-3000-0086', 'Y', 'M', 38, 'cw.shin@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U087', 'hashed_general_pass', 'GENERAL', '고서준', '루피', '서울 강남구 역삼동 87', '010-3000-0087', 'Y', 'M', 25, 'sj.go@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U088', 'hashed_general_pass', 'GENERAL', '문지호', '에디', '서울 강남구 역삼동 88', '010-3000-0088', 'Y', 'M', 31, 'jh.moon@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U089', 'hashed_general_pass', 'GENERAL', '하하윤', '패티', '서울 강남구 역삼동 89', '010-3000-0089', 'Y', 'F', 28, 'hy.ha@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U090', 'hashed_general_pass', 'GENERAL', '오도윤', '크롱', '서울 강남구 역삼동 90', '010-3000-0090', 'Y', 'M', 40, 'dy.oh@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U091', 'hashed_general_pass', 'GENERAL', '서가은', '꼬마버스', '서울 서초구 반포동 91', '010-3000-0091', 'Y', 'F', 33, 'ge.seo@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U092', 'hashed_general_pass', 'GENERAL', '전현서', '타요', '서울 서초구 반포동 92', '010-3000-0092', 'Y', 'M', 24, 'hs.jeon@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U093', 'hashed_general_pass', 'GENERAL', '배이안', '로기', '서울 서초구 반포동 93', '010-3000-0093', 'Y', 'M', 29, 'ia.bae@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U094', 'hashed_general_pass', 'GENERAL', '백채은', '라니', '서울 서초구 반포동 94', '010-3000-0094', 'Y', 'F', 36, 'ce.baek@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U095', 'hashed_general_pass', 'GENERAL', '노주안', '가니', '서울 서초구 반포동 95', '010-3000-0095', 'Y', 'M', 28, 'ja.noh@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U096', 'hashed_general_pass', 'GENERAL', '양나현', '젤리곰', '서울 송파구 잠실동 96', '010-3000-0096', 'Y', 'F', 23, 'nh.yang@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U097', 'hashed_general_pass', 'GENERAL', '황민재', '마카롱', '서울 송파구 잠실동 97', '010-3000-0097', 'Y', 'M', 39, 'mj.hwang@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U098', 'hashed_general_pass', 'GENERAL', '송소율', '식빵', '서울 송파구 잠실동 98', '010-3000-0098', 'Y', 'F', 31, 'sy.song@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U099', 'hashed_general_pass', 'GENERAL', '남하준', '오렌지', '서울 송파구 잠실동 99', '010-3000-0099', 'Y', 'M', 27, 'hj.nam@user.com');
INSERT INTO MMML.MEMBER (member_id, password, role, member_name, member_nickname, address, phone, enabled, gender, age, email)
VALUES ('U100', 'hashed_general_pass', 'GENERAL', '곽아윤', '레몬즙', '서울 송파구 잠실동 100', '010-3000-0100', 'Y', 'F', 34, 'ay.kwak@user.com');

COMMIT;

-- ============================================================
--  DUMMY DATA UPDATE: MMML.MEMBER
--  목적: 이미 존재하는 MEMBER 데이터에 GENDER, AGE, EMAIL 값 업데이트
--  주의: 이 스크립트를 실행하기 전에 ALTER TABLE로 컬럼이 추가되어 있어야 합니다.
-- ============================================================

USE MMML;

-- 1. 관리자 (ADMIN): U001 ~ U005
UPDATE MMML.MEMBER SET gender = 'M', age = 35, email = 'minjun.kim@smu.com' WHERE member_id = 'U001';
UPDATE MMML.MEMBER SET gender = 'M', age = 28, email = 'seojun.lee@smu.com' WHERE member_id = 'U002';
UPDATE MMML.MEMBER SET gender = 'F', age = 24, email = 'jiya.park@smu.com' WHERE member_id = 'U003';
UPDATE MMML.MEMBER SET gender = 'F', age = 31, email = 'eunwoo.choi@smu.com' WHERE member_id = 'U004';
UPDATE MMML.MEMBER SET gender = 'M', age = 40, email = 'hayun.jung@smu.com' WHERE member_id = 'U005';

-- 2. 판매자 (SELLER): U006 ~ U015
UPDATE MMML.MEMBER SET gender = 'M', age = 45, email = 'ty.kim@seller.com' WHERE member_id = 'U006';
UPDATE MMML.MEMBER SET gender = 'F', age = 32, email = 'jiyu.lee@seller.com' WHERE member_id = 'U007';
UPDATE MMML.MEMBER SET gender = 'M', age = 29, email = 'sh.park@seller.com' WHERE member_id = 'U008';
UPDATE MMML.MEMBER SET gender = 'F', age = 38, email = 'sy.choi@seller.com' WHERE member_id = 'U009';
UPDATE MMML.MEMBER SET gender = 'M', age = 51, email = 'yh.jung@seller.com' WHERE member_id = 'U010';
UPDATE MMML.MEMBER SET gender = 'F', age = 26, email = 'yn.kim@seller.com' WHERE member_id = 'U011';
UPDATE MMML.MEMBER SET gender = 'M', age = 33, email = 'rw.lee@seller.com' WHERE member_id = 'U012';
UPDATE MMML.MEMBER SET gender = 'M', age = 41, email = 'dj.park@seller.com' WHERE member_id = 'U013';
UPDATE MMML.MEMBER SET gender = 'F', age = 30, email = 'ar.choi@seller.com' WHERE member_id = 'U014';
UPDATE MMML.MEMBER SET gender = 'F', age = 27, email = 'sw.jung@seller.com' WHERE member_id = 'U015';

-- 3. 일반회원 (GENERAL): U016 ~ U100 (일부만 표시, 나머지 랜덤 업데이트)
UPDATE MMML.MEMBER SET gender = 'M', age = 30, email = 'jh.kim@user.com' WHERE member_id = 'U016';
UPDATE MMML.MEMBER SET gender = 'F', age = 28, email = 'sh.lee@user.com' WHERE member_id = 'U017';
UPDATE MMML.MEMBER SET gender = 'M', age = 34, email = 'jw.park@user.com' WHERE member_id = 'U018';
UPDATE MMML.MEMBER SET gender = 'F', age = 25, email = 'yj.choi@user.com' WHERE member_id = 'U019';
UPDATE MMML.MEMBER SET gender = 'M', age = 22, email = 'sw.jung@user.com' WHERE member_id = 'U020';
UPDATE MMML.MEMBER SET gender = 'M', age = 31, email = 'hn.kang@user.com' WHERE member_id = 'U021';
UPDATE MMML.MEMBER SET gender = 'F', age = 29, email = 'ms.jo@user.com' WHERE member_id = 'U022';
UPDATE MMML.MEMBER SET gender = 'F', age = 24, email = 'sb.yoon@user.com' WHERE member_id = 'U023';
UPDATE MMML.MEMBER SET gender = 'M', age = 27, email = 'jh.lim@user.com' WHERE member_id = 'U024';
UPDATE MMML.MEMBER SET gender = 'M', age = 36, email = 'dh.hong@user.com' WHERE member_id = 'U025';
UPDATE MMML.MEMBER SET gender = 'F', age = 39, email = 'jw.byun@user.com' WHERE member_id = 'U026';
UPDATE MMML.MEMBER SET gender = 'F', age = 23, email = 'se.yoo@user.com' WHERE member_id = 'U027';
UPDATE MMML.MEMBER SET gender = 'M', age = 37, email = 'js.shin@user.com' WHERE member_id = 'U028';
UPDATE MMML.MEMBER SET gender = 'F', age = 26, email = 'ec.go@user.com' WHERE member_id = 'U029';
UPDATE MMML.MEMBER SET gender = 'M', age = 30, email = 'cw.moon@user.com' WHERE member_id = 'U030';
UPDATE MMML.MEMBER SET gender = 'M', age = 25, email = 'sj.ha@user.com' WHERE member_id = 'U031';
UPDATE MMML.MEMBER SET gender = 'M', age = 42, email = 'jh.oh@user.com' WHERE member_id = 'U032';
UPDATE MMML.MEMBER SET gender = 'F', age = 21, email = 'hy.seo@user.com' WHERE member_id = 'U033';
UPDATE MMML.MEMBER SET gender = 'M', age = 35, email = 'dy.jeon@user.com' WHERE member_id = 'U034';
UPDATE MMML.MEMBER SET gender = 'F', age = 28, email = 'ge.bae@user.com' WHERE member_id = 'U035';
UPDATE MMML.MEMBER SET gender = 'M', age = 33, email = 'hs.baek@user.com' WHERE member_id = 'U036';
UPDATE MMML.MEMBER SET gender = 'F', age = 40, email = 'ia.noh@user.com' WHERE member_id = 'U037';
UPDATE MMML.MEMBER SET gender = 'F', age = 27, email = 'ce.yang@user.com' WHERE member_id = 'U038';
UPDATE MMML.MEMBER SET gender = 'M', age = 31, email = 'ja.hwang@user.com' WHERE member_id = 'U039';
UPDATE MMML.MEMBER SET gender = 'F', age = 29, email = 'nh.song@user.com' WHERE member_id = 'U040';
UPDATE MMML.MEMBER SET gender = 'M', age = 44, email = 'hj.nam@user.com' WHERE member_id = 'U041';
UPDATE MMML.MEMBER SET gender = 'M', age = 25, email = 'mj.kwak@user.com' WHERE member_id = 'U042';
UPDATE MMML.MEMBER SET gender = 'F', age = 37, email = 'sy.sohn@user.com' WHERE member_id = 'U043';
UPDATE MMML.MEMBER SET gender = 'M', age = 30, email = 'hj.jung@user.com' WHERE member_id = 'U044';
UPDATE MMML.MEMBER SET gender = 'F', age = 22, email = 'ay.kim@user.com' WHERE member_id = 'U045';
UPDATE MMML.MEMBER SET gender = 'M', age = 36, email = 'jy.lee@user.com' WHERE member_id = 'U046';
UPDATE MMML.MEMBER SET gender = 'F', age = 29, email = 'ju.park@user.com' WHERE member_id = 'U047';
UPDATE MMML.MEMBER SET gender = 'M', age = 27, email = 'ms.choi@user.com' WHERE member_id = 'U048';
UPDATE MMML.MEMBER SET gender = 'M', age = 34, email = 'wj.jung@user.com' WHERE member_id = 'U049';
UPDATE MMML.MEMBER SET gender = 'F', age = 25, email = 'sa.kang@user.com' WHERE member_id = 'U050';
UPDATE MMML.MEMBER SET gender = 'M', age = 31, email = 'hw.jo@user.com' WHERE member_id = 'U051';
UPDATE MMML.MEMBER SET gender = 'F', age = 38, email = 'go.yoon@user.com' WHERE member_id = 'U052';
UPDATE MMML.MEMBER SET gender = 'M', age = 28, email = 'th.lim@user.com' WHERE member_id = 'U053';
UPDATE MMML.MEMBER SET gender = 'F', age = 24, email = 'di.hong@user.com' WHERE member_id = 'U054';
UPDATE MMML.MEMBER SET gender = 'M', age = 33, email = 'sw.byun@user.com' WHERE member_id = 'U055';
UPDATE MMML.MEMBER SET gender = 'M', age = 45, email = 'jh.yoo@user.com' WHERE member_id = 'U056';
UPDATE MMML.MEMBER SET gender = 'F', age = 22, email = 'jw.shin@user.com' WHERE member_id = 'U057';
UPDATE MMML.MEMBER SET gender = 'M', age = 39, email = 'tj.go@user.com' WHERE member_id = 'U058';
UPDATE MMML.MEMBER SET gender = 'F', age = 31, email = 'sh.moon@user.com' WHERE member_id = 'U059';
UPDATE MMML.MEMBER SET gender = 'F', age = 28, email = 'yn.ha@user.com' WHERE member_id = 'U060';
UPDATE MMML.MEMBER SET gender = 'M', age = 40, email = 'mj.oh@user.com' WHERE member_id = 'U061';
UPDATE MMML.MEMBER SET gender = 'F', age = 25, email = 'hj.seo@user.com' WHERE member_id = 'U062';
UPDATE MMML.MEMBER SET gender = 'M', age = 23, email = 'ia.jeon@user.com' WHERE member_id = 'U063';
UPDATE MMML.MEMBER SET gender = 'F', age = 37, email = 'jw.bae@user.com' WHERE member_id = 'U064';
UPDATE MMML.MEMBER SET gender = 'M', age = 28, email = 'jw.baek@user.com' WHERE member_id = 'U065';
UPDATE MMML.MEMBER SET gender = 'F', age = 30, email = 'sy.roh@user.com' WHERE member_id = 'U066';
UPDATE MMML.MEMBER SET gender = 'M', age = 32, email = 'js.yang@user.com' WHERE member_id = 'U067';
UPDATE MMML.MEMBER SET gender = 'M', age = 26, email = 'jw.hwang@user.com' WHERE member_id = 'U068';
UPDATE MMML.MEMBER SET gender = 'F', age = 29, email = 'he.song@user.com' WHERE member_id = 'U069';
UPDATE MMML.MEMBER SET gender = 'M', age = 34, email = 'hj.nam@user.com' WHERE member_id = 'U070';
UPDATE MMML.MEMBER SET gender = 'M', age = 41, email = 'th.kwak@user.com' WHERE member_id = 'U071';
UPDATE MMML.MEMBER SET gender = 'F', age = 27, email = 'sa.sohn@user.com' WHERE member_id = 'U072';
UPDATE MMML.MEMBER SET gender = 'M', age = 25, email = 'sh.jung@user.com' WHERE member_id = 'U073';
UPDATE MMML.MEMBER SET gender = 'M', age = 38, email = 'yj.kim@user.com' WHERE member_id = 'U074';
UPDATE MMML.MEMBER SET gender = 'F', age = 29, email = 'hy.lee@user.com' WHERE member_id = 'U075';
UPDATE MMML.MEMBER SET gender = 'M', age = 31, email = 'jh.park@user.com' WHERE member_id = 'U076';
UPDATE MMML.MEMBER SET gender = 'F', age = 24, email = 'ge.choi@user.com' WHERE member_id = 'U077';
UPDATE MMML.MEMBER SET gender = 'F', age = 35, email = 'ys.jung@user.com' WHERE member_id = 'U078';
UPDATE MMML.MEMBER SET gender = 'M', age = 28, email = 'dh.kang@user.com' WHERE member_id = 'U079';
UPDATE MMML.MEMBER SET gender = 'F', age = 43, email = 'sy.jo@user.com' WHERE member_id = 'U080';
UPDATE MMML.MEMBER SET gender = 'M', age = 37, email = 'ty.yoon@user.com' WHERE member_id = 'U081';
UPDATE MMML.MEMBER SET gender = 'F', age = 29, email = 'jw.lim@user.com' WHERE member_id = 'U082';
UPDATE MMML.MEMBER SET gender = 'F', age = 22, email = 'se.hong@user.com' WHERE member_id = 'U083';
UPDATE MMML.MEMBER SET gender = 'M', age = 30, email = 'js.byun@user.com' WHERE member_id = 'U084';
UPDATE MMML.MEMBER SET gender = 'F', age = 26, email = 'ec.yoo@user.com' WHERE member_id = 'U085';
UPDATE MMML.MEMBER SET gender = 'M', age = 38, email = 'cw.shin@user.com' WHERE member_id = 'U086';
UPDATE MMML.MEMBER SET gender = 'M', age = 25, email = 'sj.go@user.com' WHERE member_id = 'U087';
UPDATE MMML.MEMBER SET gender = 'M', age = 31, email = 'jh.moon@user.com' WHERE member_id = 'U088';
UPDATE MMML.MEMBER SET gender = 'F', age = 28, email = 'hy.ha@user.com' WHERE member_id = 'U089';
UPDATE MMML.MEMBER SET gender = 'M', age = 40, email = 'dy.oh@user.com' WHERE member_id = 'U090';
UPDATE MMML.MEMBER SET gender = 'F', age = 33, email = 'ge.seo@user.com' WHERE member_id = 'U091';
UPDATE MMML.MEMBER SET gender = 'M', age = 24, email = 'hs.jeon@user.com' WHERE member_id = 'U092';
UPDATE MMML.MEMBER SET gender = 'M', age = 29, email = 'ia.bae@user.com' WHERE member_id = 'U093';
UPDATE MMML.MEMBER SET gender = 'F', age = 36, email = 'ce.baek@user.com' WHERE member_id = 'U094';
UPDATE MMML.MEMBER SET gender = 'M', age = 28, email = 'ja.noh@user.com' WHERE member_id = 'U095';
UPDATE MMML.MEMBER SET gender = 'F', age = 23, email = 'nh.yang@user.com' WHERE member_id = 'U096';
UPDATE MMML.MEMBER SET gender = 'M', age = 39, email = 'mj.hwang@user.com' WHERE member_id = 'U097';
UPDATE MMML.MEMBER SET gender = 'F', age = 31, email = 'sy.song@user.com' WHERE member_id = 'U098';
UPDATE MMML.MEMBER SET gender = 'M', age = 27, email = 'hj.nam@user.com' WHERE member_id = 'U099';
UPDATE MMML.MEMBER SET gender = 'F', age = 34, email = 'ay.kwak@user.com' WHERE member_id = 'U100';

COMMIT;

-- ============================================================
--  DUMMY DATA: MMML.ORDER_MAIN (총 10건, ID 9번 포함)
--  [수정 사항]
--  1. merchant_uid (주문번호) 추가
--  2. PAYMENT_TRANSACTION 데이터와 buyer_id, total_amount 일치
--  3. seller_id (1~10) 랜덤 매핑
--  4. order_id 컬럼 제외 (AUTO_INCREMENT 자동 생성)
-- ============================================================

-- 1. ORDER_MAIN 테이블 초기화 (필요시)
-- DELETE FROM MMML.ORDER_MAIN;
-- ALTER TABLE MMML.ORDER_MAIN AUTO_INCREMENT = 1;

-- Order 1: U016 (99,000원) - 매칭: Payment Transaction 1
INSERT INTO MMML.ORDER_MAIN (buyer_id, seller_id, total_amount, order_status, merchant_uid, created_at)
VALUES ('U016', 1, 99000.00, 'DELIVERED', 'ORD20250120-000001', '2025-01-20 10:00:00');

-- Order 2: U020 (18,900원) - 매칭: Payment Transaction 2
INSERT INTO MMML.ORDER_MAIN (buyer_id, seller_id, total_amount, order_status, merchant_uid, created_at)
VALUES ('U020', 6, 18900.00, 'SHIPPED', 'ORD20250121-000002', '2025-01-21 14:15:00');

-- Order 3: U030 (999,000원) - 매칭: Payment Transaction 3
INSERT INTO MMML.ORDER_MAIN (buyer_id, seller_id, total_amount, order_status, merchant_uid, created_at)
VALUES ('U030', 4, 999000.00, 'PAID', 'ORD20250122-000003', '2025-01-22 09:25:00');

-- Order 4: U045 (19,000원) - 매칭: Payment Transaction 4
INSERT INTO MMML.ORDER_MAIN (buyer_id, seller_id, total_amount, order_status, merchant_uid, created_at)
VALUES ('U045', 8, 19000.00, 'DELIVERED', 'ORD20250123-000004', '2025-01-23 11:10:00');

-- Order 5: U070 (119,000원) - 매칭: Payment Transaction 5
INSERT INTO MMML.ORDER_MAIN (buyer_id, seller_id, total_amount, order_status, merchant_uid, created_at)
VALUES ('U070', 7, 119000.00, 'SHIPPED', 'ORD20250123-000005', '2025-01-23 15:40:00');

-- Order 6: U088 (299,000원) - 매칭: Payment Transaction 6
INSERT INTO MMML.ORDER_MAIN (buyer_id, seller_id, total_amount, order_status, merchant_uid, created_at)
VALUES ('U088', 9, 299000.00, 'PAID', 'ORD20250124-000006', '2025-01-24 08:55:00');

-- Order 7: U019 (59,000원) - 매칭: Payment Transaction 7
INSERT INTO MMML.ORDER_MAIN (buyer_id, seller_id, total_amount, order_status, merchant_uid, created_at)
VALUES ('U019', 2, 59000.00, 'DELIVERED', 'ORD20250124-000007', '2025-01-24 13:50:00');

-- Order 8: U091 (300,000원) - 매칭: Payment Transaction 8
INSERT INTO MMML.ORDER_MAIN (buyer_id, seller_id, total_amount, order_status, merchant_uid, created_at)
VALUES ('U091', 5, 300000.00, 'PAID', 'ORD20250124-000008', '2025-01-24 16:05:00');

-- Order 9: U023 (49,900원) - CANCELED (결제 내역에는 없지만 주문 번호 연속성을 위해 추가)
INSERT INTO MMML.ORDER_MAIN (buyer_id, seller_id, total_amount, order_status, merchant_uid, created_at)
VALUES ('U023', 2, 49900.00, 'CANCELED', 'ORD20250124-000009', '2025-01-24 16:30:00');

-- Order 10: U004 (163,900원) - 매칭: Payment Transaction 10
INSERT INTO MMML.ORDER_MAIN (buyer_id, seller_id, total_amount, order_status, merchant_uid, created_at)
VALUES ('U004', 4, 163900.00, 'PAID', 'ORD20250124-000010', '2025-01-24 17:25:00');

COMMIT;

-- ============================================================
--  DUMMY DATA UPDATE: MMML.SELLER
--  목적: 이미 존재하는 SELLER 데이터에 추가된 컬럼(주소, 전화, 이메일) 값 업데이트
--  주의: SELLER 테이블에 U006 ~ U015 멤버에 해당하는 데이터가 이미 존재해야 합니다.
-- ============================================================

-- U006: 황금손
UPDATE MMML.SELLER
SET seller_address = '제주특별자치도 제주시 애월읍 1길',
    seller_phone = '010-2222-0006',
    seller_email = 'goldhand@seller.com'
WHERE member_id = 'U006';

-- U007: 장바구니
UPDATE MMML.SELLER
SET seller_address = '서울시 동대문구 패션거리 2길',
    seller_phone = '010-2222-0007',
    seller_email = 'cart_fashion@seller.com'
WHERE member_id = 'U007';

-- U008: 보따리
UPDATE MMML.SELLER
SET seller_address = '경기도 성남시 분당구 판교로 8',
    seller_phone = '010-2222-0008',
    seller_email = 'bottari_beauty@seller.com'
WHERE member_id = 'U008';

-- U009: 꿀단지
UPDATE MMML.SELLER
SET seller_address = '서울시 용산구 전자상가로 9',
    seller_phone = '010-2222-0009',
    seller_email = 'honey_tech@seller.com'
WHERE member_id = 'U009';

-- U010: 대박점
UPDATE MMML.SELLER
SET seller_address = '강원도 강릉시 해안로 10',
    seller_phone = '010-2222-0010',
    seller_email = 'jackpot_tour@seller.com'
WHERE member_id = 'U010';

-- U011: 득템요정
UPDATE MMML.SELLER
SET seller_address = '서울시 마포구 망원동 11',
    seller_phone = '010-2222-0011',
    seller_email = 'fairy_food@seller.com'
WHERE member_id = 'U011';

-- U012: 현금부자
UPDATE MMML.SELLER
SET seller_address = '서울시 강남구 청담동 12',
    seller_phone = '010-2222-0012',
    seller_email = 'cash_rich@seller.com'
WHERE member_id = 'U012';

-- U013: 미소상점
UPDATE MMML.SELLER
SET seller_address = '경기도 고양시 일산동구 13',
    seller_phone = '010-2222-0013',
    seller_email = 'smile_shop@seller.com'
WHERE member_id = 'U013';

-- U014: 새벽시장
UPDATE MMML.SELLER
SET seller_address = '인천광역시 남동구 공단로 14',
    seller_phone = '010-2222-0014',
    seller_email = 'dawn_market@seller.com'
WHERE member_id = 'U014';

-- U015: 완판녀
UPDATE MMML.SELLER
SET seller_address = '부산광역시 해운대구 센텀로 15',
    seller_phone = '010-2222-0015',
    seller_email = 'soldout_girl@seller.com'
WHERE member_id = 'U015';


INSERT INTO MMML.MEMBER_ADDRESS
(member_id, address_name, recipient_name, address_line1, address_line2, zipcode, phone, request_message, is_default)
VALUES
-- U001
('U001', '집',     '김철수', '서울특별시 강남구 테헤란로 101', '101동 1203호', '06236', '010-1111-0001',
 '공동현관 비밀번호 7777, 문 앞에 놓고 초인종 누르지 말아주세요.', 1),
('U001', '회사',   '김철수', '서울특별시 강남구 역삼로 55',   '2층',          '06221', '010-1111-0001',
 '리셉션에 맡겨주세요.', 0),

-- U002
('U002', '본가',   '박영희', '서울특별시 송파구 올림픽로 300', 'A동 902호',   '05551', '010-2222-0002',
 '부재 시 경비실에 맡겨주세요.', 1),
('U002', '자취방', '박영희', '경기도 성남시 분당구 불정로 10', '네이버빌딩 7층','13561','010-2222-0002',
 '오전 배송 부탁드립니다.', 0),

-- U003
('U003', '집',     '이민수', '부산광역시 해운대구 센텀서로 30', '302호',       '48060', '010-3333-0003',
 '택배함에 넣어주세요.', 1),
('U003', '숙소',   '이민수', '부산광역시 해운대구 우동 123',     '5층',         '48094', '010-3333-0003',
 '숙소 프론트에 맡겨주세요.', 0),

-- U004
('U004', '집',     '최다혜', '대구광역시 수성구 동대구로 300',   '1502호',      '42078', '010-4444-0004',
 '반려견 있으니 조심해주세요.', 1),
('U004', '부모님댁','최다혜','대구광역시 중구 동성로 22',        '3층',         '41919', '010-4444-0004',
 '부모님께 직접 전달 부탁드립니다.', 0),

-- U005
('U005', '집',     '정해준', '인천광역시 연수구 센트럴로 160',   '804호',       '22006', '010-5555-0005',
 '부재 시 택배함 이용해주세요.', 1),
('U005', '회사',   '정해준', '인천광역시 미추홀구 소성로 20',    '1층',         '22101', '010-5555-0005',
 '1층 안내데스크에 맡겨주세요.', 0);
commit;