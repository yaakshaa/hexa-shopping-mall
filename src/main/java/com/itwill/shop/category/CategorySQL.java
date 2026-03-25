package com.itwill.shop.category;

public class CategorySQL {
	public static final String CATEGORY_INSERT = "INSERT INTO category VALUES(category_category_no_SEQ.nextval, ?)";
	public static final String CATEGORY_UPDATE_BY_CATEGORY_NO = "UPDATE category SET category_name = ? WHERE category_no = ?";
	public static final String CATEGORY_DELETE_BT_CATEGORY_NO = "DELETE FROM category WHERE category_no = ?";
	public static final String CATEGORY_SELECT_BY_CATEGORY_NO = "SELECT * FROM category WHERE category_no = ?";
	public static final String CATEGORY_SELECT_BY_CATEGORY_NO_ASC = "SELECT * FROM category ORDER BY category_no ASC";
}
