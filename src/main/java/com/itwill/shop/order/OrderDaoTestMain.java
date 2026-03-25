package com.itwill.shop.order;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.cart.Cart;
import com.itwill.shop.product.Product;
import com.itwill.shop.product.ProductDao;
import com.itwill.shop.product.ProductDaoImplMyBatis;
import com.itwill.shop.product.ProductService;
import com.itwill.shop.product.ProductServiceImpl;

public class OrderDaoTestMain {
	public static void main(String[] args) throws Exception {
		OrderService orderService = new OrderService();

		/*
		 * System.out.println("===== 1. 바로 구매 테스트 ====="); Product product = new
		 * Product(); product.setProductNo(5); // 존재하는 상품 번호 OrderItem oi = new
		 * OrderItem(); oi.setOiQty(2); // 수량 2개 // OrderDao에서 oi.getOiQty()를 쓰는 구조면
		 * setter로 넣어줘야 됨
		 */
	
		// 바로 구매 테스트
		/*
		 * int directOrderNo = orderService.saveProductToOrder(product2,2,"bird1");
		 * System.out.println("바로 구매한 주문번호: " + directOrderNo);
		 */
		System.out.println("===== 2. 장바구니 기반 주문 테스트 =====");
		ProductService productService=new ProductServiceImpl();
		Product product1 = productService.findByPrimaryKey(2);
		Product product2 = productService.findByPrimaryKey(3);
			
		//cartNo  cartQty memberId product
		List<Cart> cartList = new ArrayList<>();
		Cart cart1 = new Cart(1, 2, "bird1",product1); // 2개
		Cart cart2 = new Cart(4, 2, "bird1",product2); // 1개
		cartList.add(cart1);
		cartList.add(cart2);
		
		int cartOrderNo = orderService.saveCartToOrder(cartList);
		System.out.println("장바구니 주문번호: " + cartOrderNo);
	
		
		 System.out.println("===== 3. 주문 상세 조회 ====="); List<OrderItem> itemList =
		  orderService.getOrderItemList(cartOrderNo); for (OrderItem item : itemList) {
		  System.out.println(item); }
		 
		 System.out.println("===== 4. 전체 주문 취소 ====="); boolean cancelResult =
		 orderService.cancelOrder(cartOrderNo); System.out.println("취소 성공 여부: " +
		 cancelResult);
		 
		 System.out.println("===== 5. 부분 취소 및 수량 변경 ====="); 
		 List<OrderItem>
		 updateItemList = new ArrayList<>();
		  
		 OrderItem itemToUpdate = new OrderItem();
	      itemToUpdate.setOiNo(1); // 존재하는 oi_no
	      itemToUpdate.setOiQty(1); // 수량 1개로 수정

	      OrderItem itemToDelete = new OrderItem();
	      itemToDelete.setOiNo(2); // 존재하는 oi_no
	      itemToDelete.setOiQty(0); // 0이면 삭제됨

	      updateItemList.add(itemToUpdate);
	      updateItemList.add(itemToDelete);

	      List<OrderItem> cancelList = new ArrayList<>();

	      OrderItem oi = new OrderItem();
	      oi.setOiNo(1);  // 존재하는 oi_no
	      oi.setOiQty(0); // 수량 0이면 삭제

	      OrderItem oi2 = new OrderItem();
	      oi2.setOiNo(2);  // 존재하는 oi_no
	      oi2.setOiQty(2); // 수량 0이 아니면 무시됨

	      cancelList.add(oi);
	      cancelList.add(oi2);

	     // boolean result = orderService.deleteOrderItems(cancelList);
	      //System.out.println("부분 취소 성공 여부: " + result);
	      
	   }
	}
