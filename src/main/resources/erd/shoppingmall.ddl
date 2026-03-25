DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE order_item CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

CREATE TABLE member(
		member_id                     		VARCHAR2(100)		 NULL ,
		member_password               		VARCHAR2(100)		 NOT NULL,
		member_name                   		VARCHAR2(100)		 NOT NULL,
		member_email                  		VARCHAR2(100)		 NULL ,
		member_phone                  		VARCHAR2(100)		 NOT NULL,
		member_address                		VARCHAR2(100)		 NULL ,
		is_admin                      		VARCHAR2(10)		 DEFAULT 'N'		 NULL 
);


CREATE TABLE category(
		category_no                   		NUMBER(10)		 NULL ,
		category_name                 		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE category_category_no_SEQ;

CREATE SEQUENCE category_category_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE product(
		product_no                    		NUMBER(20)		 NULL ,
		product_name                  		VARCHAR2(100)		 NOT NULL,
		product_price                 		NUMBER(20)		 NULL ,
		product_stock                 		NUMBER(20)		 NULL ,
		product_desc                  		VARCHAR2(500)		 NULL ,
		product_img                   		VARCHAR2(100)		 NULL ,
		category_no                   		NUMBER(10)		 NULL 
);

DROP SEQUENCE product_product_no_SEQ;

CREATE SEQUENCE product_product_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE orders(
		orders_no                     		NUMBER(10)		 NULL ,
		orders_date                   		DATE		 DEFAULT sysdate		 NULL ,
		orders_tot_price              		NUMBER(20)		 NULL ,
		orders_status                 		VARCHAR2(100)		 NULL ,
		member_id                     		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE orders_orders_no_SEQ;

CREATE SEQUENCE orders_orders_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE order_item(
		oi_no                         		NUMBER(20)		 NULL ,
		oi_price                      		NUMBER(20)		 NULL ,
		oi_qty                        		NUMBER(20)		 NULL ,
		product_no                    		NUMBER(20)		 NULL ,
		orders_no                     		NUMBER(10)		 NULL 
);

DROP SEQUENCE order_item_oi_no_SEQ;

CREATE SEQUENCE order_item_oi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE cart(
		cart_no                       		NUMBER(20)		 NULL ,
		cart_qty                      		NUMBER(20)		 NULL ,
		member_id                     		VARCHAR2(100)		 NULL ,
		product_no                    		NUMBER(20)		 NULL 
);

DROP SEQUENCE cart_cart_no_SEQ;

CREATE SEQUENCE cart_cart_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (member_id);

ALTER TABLE category ADD CONSTRAINT IDX_category_PK PRIMARY KEY (category_no);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (product_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (category_no) REFERENCES category (category_no);

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (orders_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (member_id) REFERENCES member (member_id);

ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_PK PRIMARY KEY (oi_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK0 FOREIGN KEY (product_no) REFERENCES product (product_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK1 FOREIGN KEY (orders_no) REFERENCES orders (orders_no);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (cart_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (member_id) REFERENCES member (member_id);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (product_no) REFERENCES product (product_no);

-- 기존 외래 키 제약 삭제
ALTER TABLE product DROP CONSTRAINT IDX_product_FK0;
ALTER TABLE orders DROP CONSTRAINT IDX_orders_FK0;
ALTER TABLE order_item DROP CONSTRAINT IDX_order_item_FK0;
ALTER TABLE order_item DROP CONSTRAINT IDX_order_item_FK1;
ALTER TABLE cart DROP CONSTRAINT IDX_cart_FK0;
ALTER TABLE cart DROP CONSTRAINT IDX_cart_FK1;

-- product 테이블 외래 키 제약 추가 (ON DELETE CASCADE)
ALTER TABLE product 
ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (category_no) 
REFERENCES category (category_no)
ON DELETE CASCADE;

-- orders 테이블 외래 키 제약 추가 (ON DELETE CASCADE)
ALTER TABLE orders 
ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (member_id) 
REFERENCES member (member_id)
ON DELETE CASCADE;

-- order_item 테이블 외래 키 제약 추가 (ON DELETE CASCADE)
ALTER TABLE order_item 
ADD CONSTRAINT IDX_order_item_FK0 FOREIGN KEY (product_no) 
REFERENCES product (product_no)
ON DELETE CASCADE;

/*ALTER TABLE order_item 
ADD CONSTRAINT IDX_order_item_FK1 FOREIGN KEY (orders_no) 
REFERENCES orders (orders_no)
ON DELETE CASCADE;
*/

-- cart 테이블 외래 키 제약 추가 (ON DELETE CASCADE)
ALTER TABLE cart 
ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (member_id) 
REFERENCES member (member_id)
ON DELETE CASCADE;

ALTER TABLE cart 
ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (product_no) 
REFERENCES product (product_no)
ON DELETE CASCADE;

