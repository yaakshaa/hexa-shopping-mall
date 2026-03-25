package com.itwill.shop.order;

public class OrderSQL {
	//public final static String ORDER_DELETE_BY_MEMBER_ID = "delete from orders where member_id=?";
	//public final static String ORDER_DELETE_BY_ORDERS_NO = "delete from orders where orders_no=?";
	public final static String ORDERS_INSERT = "insert into orders (orders_no, orders_date, orders_tot_price, orders_status, member_id) VALUES (orders_orders_no_SEQ.nextval, sysdate, ?, ?, ?)";
	public final static String ORDERITEM_INSERT = "insert into order_item (oi_no, oi_price, oi_qty, product_no, orders_no) VALUES (order_item_oi_no_SEQ.nextval, ?, ?, (SELECT product_no FROM product WHERE product_name = ?), (SELECT orders_no FROM orders WHERE member_id = ?));";
	
	public final static String ORDERS_SELECT_BY_USERID = "select * from orders where member_id=?";
	public final static String ORDERS_SELECT_WITH_ORDERITEM_BY_O_NO = 
			"select * from orders o join order_item oi on o.o_no=oi.o_no  join  product p on oi.p_no=p.p_no where  o.o_no = ?";
	
	public final static String ORDERS_SELECT_WITH_ORDERITEM_BY_MEMBERID = "select * from orders o join order_item oi on o.o_no=oi.o_no  join  product p on oi.p_no=p.p_no where  o.userid = ?";


	public final static String ORDERS_UPDATE_BY_USERID = "update orders SET orders_status = ? WHERE orders_no = ?";
	
	public final static String ORDER_SELECT_BY_USERID = "select * from orders where member_id=?";
}
