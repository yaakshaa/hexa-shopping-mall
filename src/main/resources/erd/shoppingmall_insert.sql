/************************ member insert ****************************/
INSERT INTO member(member_id, member_password, member_name, member_email, member_phone, member_address) 
            VALUES('bird1', '1111', '병아리', 'bird1@naver.com', '111-1111', '서울');
INSERT INTO member(member_id, member_password, member_name, member_email, member_phone, member_address) 
            VALUES('bird2', '2222', '참새', 'bird2@naver.com', '222-2222', '강원도');
INSERT INTO member(member_id, member_password, member_name, member_email, member_phone, member_address) 
            VALUES('bird3', '3333', '펭귄', 'bird3@naver.com', '333-3333', '부산');
INSERT INTO member(member_id, member_password, member_name, member_email, member_phone, member_address)
            VALUES('dog1','4444','비글','dog1@evil.com','444-4444','대구');
INSERT INTO member(member_id, member_password, member_name, member_email, member_phone, member_address)
            VALUES('dog2','5555','리트리버','dog2@angle.com','555-5555','대전');
 INSERT INTO member(member_id, member_password, member_name, member_email, member_phone, member_address)
            VALUES('hong','1111','홍','hong@angle.com','000-0000','서울');           
INSERT INTO member(member_id, member_password, member_name, member_email, member_phone, member_address)
            VALUES('dog3','6666','핏불','dog3@ddog.com','666-6666','광주');
INSERT INTO member(member_id, member_password, member_name, member_email, member_phone, member_address,is_admin)
            VALUES('admin','admin','나야나','admin@naya.com','900-9090','세종','Y');


/************************ category insert ****************************/
INSERT INTO category VALUES(category_category_no_SEQ.nextval, '셔츠/블라우스');
INSERT INTO category VALUES(category_category_no_SEQ.nextval, '반소매 티셔츠');
INSERT INTO category VALUES(category_category_no_SEQ.nextval, '니트/스웨터');


INSERT INTO category VALUES(category_category_no_SEQ.nextval, '데님펜츠');
INSERT INTO category VALUES(category_category_no_SEQ.nextval, '트레이닝/조거팬츠');
INSERT INTO category VALUES(category_category_no_SEQ.nextval, '숏팬츠');

INSERT INTO category VALUES(category_category_no_SEQ.nextval, '스니커즈');
INSERT INTO category VALUES(category_category_no_SEQ.nextval, '부츠/워커');
INSERT INTO category VALUES(category_category_no_SEQ.nextval, '구두');
INSERT INTO category VALUES(category_category_no_SEQ.nextval, '신발용품');


/************************ product insert ****************************/
-- 1. 셔츠/블라우스
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '클래식 화이트 셔츠', 49000, 30, '정장이나 캐주얼에 모두 어울리는 기본 화이트 셔츠입니다.', 'white_shirt.jpg', 1);
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '리넨 블라우스', 55000, 15, '시원한 리넨 소재의 여성용 블라우스입니다.', 'linen_blouse.jpg', 1);

-- 2. 반소매 티셔츠
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '베이직 반팔 티셔츠', 19000, 50, '기본에 충실한 데일리 반팔 티셔츠입니다.', 'basic_tshirt.jpg', 2);
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '스트라이프 티셔츠', 22000, 40, '스트라이프 패턴으로 포인트를 준 반팔 티셔츠입니다.', 'stripe_tshirt.jpg', 2);

-- 3. 니트/스웨터
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '브이넥 니트', 42000, 25, '간절기에 입기 좋은 브이넥 니트입니다.', 'vneck_knit.jpg', 3);
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '오버핏 스웨터', 47000, 20, '편안한 착용감의 오버핏 스웨터입니다.', 'oversize_sweater.jpg', 3);

-- 4. 데님팬츠
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '슬림핏 데님 팬츠', 59000, 35, '슬림한 실루엣의 데님 팬츠입니다.', 'slimfit_denim.jpg', 4);
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '와이드 진', 61000, 18, '트렌디한 와이드 핏의 청바지입니다.', 'wide_jeans.jpg', 4);

-- 5. 트레이닝/조거팬츠
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '기본 트레이닝 팬츠', 33000, 40, '활동성 좋은 트레이닝 팬츠입니다.', 'training_pants.jpg', 5);
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '카고 조거 팬츠', 38000, 20, '포켓이 많은 조거 팬츠 스타일입니다.', 'cargo_jogger.jpg', 5);

-- 6. 숏팬츠
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '데님 숏팬츠', 27000, 25, '여름용 데님 숏팬츠입니다.', 'denim_shorts.jpg', 6);
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '면 반바지', 25000, 30, '가볍고 편한 면 반바지입니다.', 'cotton_shorts.jpg', 6);

-- 7. 스니커즈
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '화이트 로우탑 스니커즈', 69000, 30, '어디에나 어울리는 클래식한 스니커즈입니다.', 'white_sneakers.jpg', 7);
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '컬러 포인트 스니커즈', 72000, 15, '유니크한 컬러 조합의 스니커즈입니다.', 'color_sneakers.jpg', 7);

-- 8. 부츠/워커
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '블랙 첼시 부츠', 89000, 20, '세련된 블랙 첼시 부츠입니다.', 'chelsea_boots.jpg', 8);
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '워커 스타일 부츠', 95000, 10, '아웃도어 느낌의 튼튼한 워커입니다.', 'walker_boots.jpg', 8);

-- 9. 구두
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '베이직 로퍼', 77000, 18, '남녀공용 베이직 스타일 로퍼입니다.', 'basic_loafer.jpg', 9);
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '굽 있는 정장화', 81000, 12, '정장용 포멀한 굽 있는 구두입니다.', 'formal_shoes.jpg', 9);

-- 10. 신발용품
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '가죽 클리너', 12000, 50, '가죽 신발 전용 클리너입니다.', 'leather_cleaner.jpg', 10);
INSERT INTO product VALUES (product_product_no_SEQ.nextval, '신발 깔창', 8000, 60, '편안한 착용감을 위한 기본 깔창입니다.', 'shoe_insole.jpg', 10);

/************************ cart insert ****************************/
-- bird1님이 화이트 셔츠 2개, 블랙 청바지 1개, 네이비 자켓 3개를 담음  
INSERT INTO cart (cart_no, cart_qty, member_id, product_no)
VALUES (cart_cart_no_SEQ.nextval, 2, 'hong', (SELECT product_no FROM product WHERE product_name = '클래식 화이트 셔츠'));

INSERT INTO cart (cart_no, cart_qty, member_id, product_no)
VALUES (cart_cart_no_SEQ.nextval, 1, 'hong', (SELECT product_no FROM product WHERE product_name = '슬림핏 데님 팬츠'));

INSERT INTO cart (cart_no, cart_qty, member_id, product_no)
VALUES (cart_cart_no_SEQ.nextval, 3, 'hong', (SELECT product_no FROM product WHERE product_name = '워커 스타일 부츠'));

-- bird2님이 화이트 셔츠 2개, 그레이 후드티 1개를 담음
INSERT INTO cart (cart_no, cart_qty, member_id, product_no)
VALUES (cart_cart_no_SEQ.nextval, 2, 'bird2', (SELECT product_no FROM product WHERE product_name = '리넨 블라우스'));

INSERT INTO cart (cart_no, cart_qty, member_id, product_no)
VALUES (cart_cart_no_SEQ.nextval, 1, 'bird2', (SELECT product_no FROM product WHERE product_name = '와이드 진'));

-- bird3님이 블랙 청바지 2개, 베이지 코트 1개를 담음
INSERT INTO cart (cart_no, cart_qty, member_id, product_no)
VALUES (cart_cart_no_SEQ.nextval, 2, 'bird3', (SELECT product_no FROM product WHERE product_name = '신발 깔창'));

INSERT INTO cart (cart_no, cart_qty, member_id, product_no)
VALUES (cart_cart_no_SEQ.nextval, 1, 'bird3', (SELECT product_no FROM product WHERE product_name = '기본 트레이닝 팬츠'));


/************************ orders insert ****************************/

-- bird1님 주문

-- bird2님 주문
INSERT INTO orders (orders_no, orders_date, orders_tot_price, orders_status, member_id)
VALUES (orders_orders_no_SEQ.nextval, sysdate, 116000, '주문완료', 'bird2');

-- bird3님 주문
INSERT INTO orders (orders_no, orders_date, orders_tot_price, orders_status, member_id)
VALUES (orders_orders_no_SEQ.nextval, sysdate, 41000, '주문완료', 'bird3');


/************************ order_item insert ****************************/
-- bird1님의 주문 상세
-- 화이트 셔츠 2개
INSERT INTO order_item (oi_no, oi_price, oi_qty, product_no, orders_no)
VALUES (order_item_oi_no_SEQ.nextval, 49000, 2, (SELECT product_no FROM product WHERE product_name = '클래식 화이트 셔츠'), (SELECT orders_no FROM orders WHERE member_id = 'hong'));

-- 블랙 청바지 1개
INSERT INTO order_item (oi_no, oi_price, oi_qty, product_no, orders_no)
VALUES (order_item_oi_no_SEQ.nextval, 59000, 1, (SELECT product_no FROM product WHERE product_name = '슬림핏 데님 팬츠'), (SELECT orders_no FROM orders WHERE member_id = 'hong'));

-- 네이비 자켓 3개
INSERT INTO order_item (oi_no, oi_price, oi_qty, product_no, orders_no)
VALUES (order_item_oi_no_SEQ.nextval, 95000, 3, (SELECT product_no FROM product WHERE product_name = '워커 스타일 부츠'), (SELECT orders_no FROM orders WHERE member_id = 'hong'));

-- bird2님의 주문 상세
-- 화이트 셔츠 2개
INSERT INTO order_item (oi_no, oi_price, oi_qty, product_no, orders_no)
VALUES (order_item_oi_no_SEQ.nextval, 55000, 2, (SELECT product_no FROM product WHERE product_name = '리넨 블라우스'), (SELECT orders_no FROM orders WHERE member_id = 'bird2'));

-- 그레이 후드티 1개
INSERT INTO order_item (oi_no, oi_price, oi_qty, product_no, orders_no)
VALUES (order_item_oi_no_SEQ.nextval, 61000, 1, (SELECT product_no FROM product WHERE product_name = '와이드 진'), (SELECT orders_no FROM orders WHERE member_id = 'bird2'));

-- bird3님의 주문 상세
-- 블랙 청바지 2개
INSERT INTO order_item (oi_no, oi_price, oi_qty, product_no, orders_no)
VALUES (order_item_oi_no_SEQ.nextval, 8000, 2, (SELECT product_no FROM product WHERE product_name = '신발 깔창'), (SELECT orders_no FROM orders WHERE member_id = 'bird3'));

-- 베이지 코트 1개
INSERT INTO order_item (oi_no, oi_price, oi_qty, product_no, orders_no)
VALUES (order_item_oi_no_SEQ.nextval, 33000, 1, (SELECT product_no FROM product WHERE product_name = '기본 트레이닝 팬츠'), (SELECT orders_no FROM orders WHERE member_id = 'bird3'));

commit;