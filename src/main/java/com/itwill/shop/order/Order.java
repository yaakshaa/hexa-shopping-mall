package com.itwill.shop.order;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Order {
	private int ordersNo; // 주문번호
	private Date ordersDate; // 주문일
	private int ordersTotPrice; // 총결제금액
	private String ordersStatus; // 주문상태 ( 주문완료/배송중/배송완료/주문취소)
	private String memberId; // 주문한 회원아이디
	private int oiCnt;
	private String oiImg;
	private String oiProductName;
	private int formatordersNo;
	private int qty;
	private int productNo;
	private int totalCancelAmount;
	
	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}



	public int getProductNo() {
		return productNo;
	}



	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

	
	private List<OrderItem> orderItemList; // 주문상세 리스트 (선택)

	// 기본 생성자
	public Order() {
	}

	

	// 생성자 (주요 필드만)
	public Order(int ordersNo, Date ordersDate, int ordersTotPrice, String ordersStatus, String memberId) {
		this.ordersNo = ordersNo;
		this.ordersDate = ordersDate;
		this.ordersTotPrice = ordersTotPrice;
		this.ordersStatus = ordersStatus;
		this.memberId = memberId;
	}

	// 전체 생성자
	public Order(int ordersNo, Date ordersDate, int ordersTotPrice, String ordersStatus, String memberId,
			List<OrderItem> orderItemList) {
		this.ordersNo = ordersNo;
		this.ordersDate = ordersDate;
		this.ordersTotPrice = ordersTotPrice;
		this.ordersStatus = ordersStatus;
		this.memberId = memberId;
		this.orderItemList = orderItemList;
	}

	// Getter/Setter
	public int getOrdersNo() {
		return ordersNo;
	}  

	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}

	public Date getOrdersDate() {
		return ordersDate;
	}

	public void setOrdersDate(Date ordersDate) {
		this.ordersDate = ordersDate;
	}

	public int getOrdersTotPrice() {
		return ordersTotPrice;
	}

	public void setOrdersTotPrice(int ordersTotPrice) {
		this.ordersTotPrice = ordersTotPrice;
	}

	public String getOrdersStatus() {
		return ordersStatus;
	}

	public void setOrdersStatus(String ordersStatus) {
		this.ordersStatus = ordersStatus;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {  
		this.memberId = memberId;
	}

	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}
	

	public int getOiCnt() {
		return oiCnt;
	}


	public void setOiCnt(int oiCnt) {
		this.oiCnt = oiCnt;
	}


	public String getOiImg() {
		return oiImg;
	}


	public void setOiImg(String oiImg) {
		this.oiImg = oiImg;
	}



	public String getOiProductName() {
		return oiProductName;
	}



	public void setOiProductName(String oiProductName) {
		this.oiProductName = oiProductName;
	}

	public String getformatordersNo() {
		String formatordersNo= dateFormat.format(getOrdersDate())+"-"+getOrdersNo();
		return formatordersNo;
	}


	@Override
	public String toString() {
		return "Order [ordersNo=" + ordersNo + ", ordersDate=" + ordersDate + ", ordersTotPrice=" + ordersTotPrice
				+ ", ordersStatus=" + ordersStatus + ", memberId=" + memberId + ", orderItemList=" + orderItemList
				+ "]";
	}

	
	
	public int getTotalCancelAmount() {
		return totalCancelAmount;
	}

	public void setTotalCancelAmount(int totalCancelAmount) {
		this.totalCancelAmount = totalCancelAmount;
		
	}
	
	
}
