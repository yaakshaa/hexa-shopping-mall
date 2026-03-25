package com.itwill.shop.order;

import java.util.Date;
import java.util.List;

import com.itwill.shop.product.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.lang.reflect.Member;
import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderItem {
	private int oiNo; // 주문상세 번호
	private int oiPrice; // 주문 가격 (상품 가격)
	private int oiQty; // 주문 수량
	// FK
	private int ordersNo;
	private int productNo;
	private String pImg;
	private String pName;
	private Date oDate; // 주문일
	private String oStatus;
	private String formatordersNo;
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	
	public String getformatordersNo() {
		String formatordersNo= dateFormat.format(getODate())+"-"+getOrdersNo();
		return formatordersNo;
	}

}
