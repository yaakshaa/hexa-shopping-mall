package com.itwill.shop.order;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itwill.shop.cart.Cart;
import com.itwill.shop.product.Product;
import com.itwill.shop.product.ProductDao;
import com.itwill.shop.product.ProductDaoImplMyBatis;
import com.itwill.shop.product.ProductService;

public class OrderService {
	private OrderDao orderDao;

	public OrderService() throws Exception {
		orderDao = new OrderDao();

	}

	/*
	 * 주문목록(order)
	 */
	public List<Order> getOrderList(String memberId,int range) throws Exception {
		List<Order> orderlist = new ArrayList<Order>();
		Map<String ,Object> paramMap= new HashMap<String ,Object>();
		paramMap.put("memberId", memberId);
		paramMap.put("range", range);
		orderlist = orderDao.getOrderList(paramMap);
		//System.out.println(orderlist.size());
		
		
		return orderlist;
	}

	/*
	 * 주문 상세 list(orderitem  )
	 */
	public List<OrderItem> getOrderItemList(int ordersNo) throws Exception {
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		orderItemList = orderDao.getOrderItemList(ordersNo);
		return orderItemList;
	}

	/*
	 * 장바구니 정보 저장(order, orderItem) //구매->주문정보 저장->주문번호 리턴->주문상세
	 */
	public int saveCartToOrder(List<Cart> cartlist) throws Exception {
		int ordersNo = orderDao.saveCartToOrder(cartlist);
		return ordersNo;
	}

	/*
	 * 00
	 * 바로 구매하기 버튼(order, orderItem) 구매->주문정보 저장->주문번호 리턴->주문상세
	 */
	public int saveProductToOrder(int pno, int quantity, String memberId) throws Exception {
	      int orderNo1= orderDao.getOrderNo();
	      Order order= new Order();
	      order.setOrdersNo(orderNo1);
	      order.setOrdersDate(new java.util.Date());
	      order.setMemberId(memberId);
	      order.setProductNo(pno);
	      order.setQty(quantity);
	      order.setOrdersStatus("주문완료");
	      orderDao.saveProductToOrder(order);
	      
	      OrderItem oi= new OrderItem();
	      oi.setOiQty(quantity);
	      oi.setProductNo(pno);
	      oi.setOrdersNo(orderNo1);
	      
	      orderDao.saveProductToOrderItem(oi);

		  ProductDao productDao = new ProductDaoImplMyBatis();
		  Product product = productDao.findByPrimaryKey(pno);
		  int nowStock = product.getProductStock()  - quantity;
		  productDao.modifyStock(pno, nowStock);

	      return orderNo1;     

	   }

	/*
	 * 전체 주문 취소(order의 상태 변경-취소)
	 */
	public boolean cancelOrder(int ordersNo) throws Exception {
		//orderItem 전체 취소
		orderDao.deleteOrderAllItem(ordersNo);
		// 정상적으로 취소되면 true, 실패하면 false
		return orderDao.cancelOrder(ordersNo);

	}

	/*
	 * 부분 취소 및 수정(orderitem을 삭제 또는 수량 변경)
	 */
	public boolean deleteOrderItem(int ordersNo, int oiNo) throws Exception {
		//오더아이템->수랑0, 가격0
		OrderItem orderItem= new OrderItem();
		orderItem.setOrdersNo(ordersNo);
		orderItem.setOiNo(oiNo);
		
		orderDao.deleteOrderItem(orderItem);
		
		//Order상태(ORDERS_STATUS)변경(부분취소) , 가격(ORDERS_TOT_PRICE)수정
		boolean updateCheck= orderDao.updateOrderStatus(ordersNo);
		
		return updateCheck;
	}
	
	
}