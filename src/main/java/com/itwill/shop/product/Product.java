package com.itwill.shop.product;

public class Product {
	private int productNo;
	private String productName;
	private int productPrice;
	private int productStock;
	private String productDesc;
	private String productImg;
	private int categoryNo;

	public Product() {
	}

	public Product(int productNo, String productName, int productPrice, int productStock, String productDesc,
			String productImg, int categoryNo) {
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productDesc = productDesc;
		this.productImg = productImg;
		this.categoryNo = categoryNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productPrice="
				+ productPrice + ", productStock=" + productStock + ", productDesc=" + productDesc
				+ ", productImg=" + productImg + ", categoryNo=" + categoryNo + "]";
	}
}
