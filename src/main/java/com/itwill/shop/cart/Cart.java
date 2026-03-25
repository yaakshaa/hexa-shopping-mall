package com.itwill.shop.cart;

import com.itwill.shop.product.Product;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cart {
	private int cartNo;
	private int cartQty;
	//FK
	private String memberId;
	private Product product;


	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", cartQty=" + cartQty + ", memberId=" + memberId + ", product=" + product
				+ "]";
	}



}


