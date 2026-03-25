package com.itwill.shop.cart;

import java.util.List;

public class CartService {
	private CartDao cartDao;

	public CartService() throws Exception {
		cartDao = new CartDaoImplMyBatis(); // 의존성 주입(Mybatis 구현체)
	}

	public int insertCart(String memberId, int productNo, int cartQty) throws Exception {
		if (cartDao.countByProductNo(memberId, productNo) > 0) {
			return cartDao.updateCartAddQty(memberId, productNo, cartQty);
		} else {
			return cartDao.insertCart(memberId, productNo, cartQty);
		}
	}

	public int updateCartAddQty(String memberId, int productNo, int cartQty) throws Exception {
		return cartDao.updateCartAddQty(memberId, productNo, cartQty);
	}

	public int updateCartByCartNo(int cartNo, int cartQty) throws Exception {
		return cartDao.updateCartByCartNo(cartNo, cartQty);
	}

	public int deleteCartItem(int cartNo) throws Exception {
		return cartDao.deleteCartByCartNo(cartNo);
	}

	public int clearCart(String memberId) throws Exception {
		return cartDao.deleteCartByMemberId(memberId);
	}

	public List<Cart> getCartList(String memberId) throws Exception {
		return cartDao.findCartByMemberId(memberId);
	}

	public List<Cart> getCartListLogic(String memberId) throws Exception {
		return cartDao.findCartByMemberIdForLogic(memberId);
	}

	public int getProductNoByCartNo(int cartNo) throws Exception {
		return cartDao.findProductNoByCartNo(cartNo);
	}

	// 🔥 추가: 회원 장바구니 총 수량 구하기
	public int getCartTotalQty(String memberId) throws Exception {
		List<Cart> cartList = cartDao.findCartByMemberId(memberId);
		int totalQty = 0;
		for (Cart cart : cartList) {
			totalQty += cart.getCartQty();
		}
		return totalQty;
	}
}
