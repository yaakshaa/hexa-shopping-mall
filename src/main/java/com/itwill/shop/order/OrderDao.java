package com.itwill.shop.order;

import java.util.List;
import java.util.Map;

import com.itwill.shop.product.ProductDao;
import com.itwill.shop.product.ProductDaoImplMyBatis;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.cart.Cart;

public class OrderDao {
	private SqlSessionFactory sqlSessionFactory;

	public OrderDao() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}

	/*
	 * 주문목록(order)
	 */
	public List<Order> getOrderList(Map<String, Object> paramMap) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Order> rtnList = sqlSession.selectList("OrderMapper.getOrderList", paramMap);
		sqlSession.close();
		return rtnList;
	}

	/*
	 * 주문 상세 list(orderitem)
	 */
	public List<OrderItem> getOrderItemList(int ordersNo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<OrderItem> rtnList = sqlSession.selectList("OrderMapper.getOrderItemList", ordersNo);
		sqlSession.close();
		return rtnList;
	}

	/*
	 * 장바구니 정보 저장(order, orderItem) //구매->주문정보 저장->주문번호 리턴->주문상세
	 */
	public int saveCartToOrder(List<Cart> cartlist) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Order order = new Order();
		int ordersTotPrice=0;
		int ordersNo1=  sqlSession.selectOne("OrderMapper.getOrderNoseq");
		for (Cart cart : cartlist) {
			
			ordersTotPrice += cart.getProduct().getProductPrice() * cart.getCartQty();
		}
		order.setOrdersTotPrice(ordersTotPrice);
		order.setOrdersStatus("주문완료");
		order.setMemberId(cartlist.get(0).getMemberId());
		order.setOrdersNo(ordersNo1);
		order.setOrdersDate(new java.util.Date());
		sqlSession.insert("OrderMapper.saveCartToOrder", order);
		
		int ordersNo = order.getOrdersNo();

		// 상세
		for (Cart cart : cartlist) {

			OrderItem oi = new OrderItem();
			oi.setOrdersNo(ordersNo1);
			oi.setProductNo(cart.getProduct().getProductNo());
			oi.setOiQty(cart.getCartQty());
			oi.setOiPrice(cart.getProduct().getProductPrice());

			sqlSession.insert("OrderMapper.insertOrderItem", oi);

			int oldStock = cart.getProduct().getProductStock();
			int newStock = oldStock - cart.getCartQty();

			//재고 업데이트 수행
			try {
				ProductDao productDao = new ProductDaoImplMyBatis();
				productDao.modifyStock(cart.getProduct().getProductNo(), newStock);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		sqlSession.close();
		return ordersNo;
	}

	/*
	 * 바로구매 //구매->주문정보 저장->주문번호 리턴->주문상세 
	*/
	public int getOrderNo() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int ordersNo1=  sqlSession.selectOne("OrderMapper.getOrderNoseq");
		sqlSession.close();
		return ordersNo1;
	}
	
	public int saveProductToOrder(Order order) {
	    SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    try {
	        sqlSession.insert("OrderMapper.saveProductToOrder", order);

	        return 0;
	    } finally {
	        sqlSession.close();
	    }
	}
	public int saveProductToOrderItem(OrderItem oi) {
	    SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    try {
	        sqlSession.insert("OrderMapper.insertOrderItem", oi);
	        return 0;
	    } finally {
	        sqlSession.close();
	    }
	}

	/*
	 * 전체 주문 취소(order의 상태 변경-취소)
	 */
	public boolean cancelOrder(int ordersNo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		try {
			int deletedCount = sqlSession.update("OrderMapper.cancelOrder", ordersNo);
			return deletedCount > 0; // 1건 이상 수정되면 true 반환
		} finally {
			sqlSession.close();
		}
	}

	/*
	 * 부분 취소
	 */
	public boolean deleteOrderItem(OrderItem orderItem) {
	    SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    try {
	        int resultCount = sqlSession.update("OrderMapper.deleteOrderItem", orderItem);
	        return resultCount > 0;
	    } finally {
	        sqlSession.close();
	    }
	}
	
	public boolean deleteOrderAllItem(int ordersNo) {
	    SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    try {
	        int resultCount = sqlSession.update("OrderMapper.deleteOrderAllItem", ordersNo);
	        return resultCount > 0;
	    } finally {
	        sqlSession.close();
	    }
	}
	
	public boolean updateOrderStatus(int ordersNo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		try {
			int  updateCnt= sqlSession.update("OrderMapper.updateOrderStatus", ordersNo);
			return updateCnt > 0; // 1건 이상 수정되면 true 반환
		} finally {
			sqlSession.close();
		}
	}
}
