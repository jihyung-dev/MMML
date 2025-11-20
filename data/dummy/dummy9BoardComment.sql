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