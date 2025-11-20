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