/************************ member ****************************/
--update
UPDATE member SET member_name = '토종닭', 
                  member_email = 'tojong@chicken.com', 
                  member_phone = '452-5674',
                  member_address = '충남 서산'
                  WHERE member_id = 'bird1';
--delete
DELETE member WHERE member_id = 'dog3';
--select
--특정회원 조회
SELECT member_id, member_name, member_email, member_address FROM member WHERE member_id='bird3';
--전체회원 조회(관리자인 경우에만 가능)
SELECT member_id, member_password, member_name, member_email, member_address, member_phone FROM member;


/************************ product ****************************/
--update
UPDATE product SET product_name = '수정된 상품명', 
				   product_price = 50000, 
				   product_stock = 30, 
				   product_desc = '수정된 상품 설명입니다.', 
				   product_img = 'updated_product.jpg', 
				   category_no = 2 
				   WHERE product_no = 1;
--delete
DELETE FROM product WHERE product_no = 1;
--select
SELECT product.product_no, product.product_name, product.product_price, product.product_stock, product.product_desc, product.product_img, category.category_no, category.category_name 
FROM product
JOIN category ON product.category_no = category.category_no
WHERE category.category_no = 3
ORDER BY product.product_no DESC;
--제품 번호에 따른 제품 상세보기
SELECT * FROM product WHERE product_no = 1;


/************************ cart ****************************/
--update
--회원 카트에 있는 1번 제품 수량 증가
UPDATE cart SET cart_qty = cart_qty + 1 WHERE member_id = 'bird1' AND product_no = 1;
--회원 카트에 있는 cart_no 1 번의 수량 3개 수정
UPDATE cart SET cart_qty = 5 WHERE cart_no = 1;
--delete
--회원 카트아이템 1개 삭제
DELETE FROM cart WHERE cart_no = 1;
--회원 카트아이템 전부 삭제
DELETE FROM cart WHERE member_id = 'bird1';
--select
--특정 회원 카트의 제품번호 존재여부
SELECT count(*) AS product_count FROM cart WHERE member_id = 'bird1' AND product_no = 1;
--회원 한사람의 카트 제품 리스트 조회(ui용)
SELECT cart.cart_no, product.product_name, cart.cart_qty, product.product_price FROM cart JOIN product ON cart.product_no = product.product_no WHERE member_id = 'bird1';
--회원 한사람의 카트 제품 리스트 조회(내부 로직)
SELECT cart.*, product.* FROM cart join product ON cart.product_no = product.product_no WHERE member_id = 'bird1';
--카트 번호로 개별 제품 번호 조회(추후 제품 번호로 제품 상세 조회 가능)
SELECT product.product_no FROM cart JOIN product ON cart.product_no = product.product_no WHERE cart_no = 1;

/************************ category ****************************/
--update
UPDATE category SET category_name = '운동화' WHERE category_no = 7;
--delete
DELETE FROM category WHERE category_no = 10;
--select
SELECT * FROM category WHERE category_no = 1;
--UI 출력시 카테고리 번호순으로 정렬
SELECT * FROM category ORDER BY category_no ASC;


/************************ orders ****************************/
--update
--특정
UPDATE orders SET orders_status = '배송중' WHERE orders_no = 1;
UPDATE orders SET orders_status = '주문취소' WHERE orders_no = 2;
--delete(삭제대신 수정으로 주문 기록은 살림)

--select
SELECT * FROM orders;
--특정회원의 주문(구매내역) 조회
SELECT orders_no, orders_date, orders_tot_price, orders_status FROM orders WHERE member_id = 'bird1';
SELECT * FROM orders WHERE orders_no = 1;


/************************ order_item ****************************/
--update
UPDATE order_item SET oi_qty = 5 WHERE oi_no = 1;
--delete
DELETE FROM order_item WHERE oi_no = 1;  
--select
--특정주문내역 조회
SELECT * FROM order_item WHERE orders_no = 1;
--특정상품
SELECT * FROM order_item WHERE product_no = 1;