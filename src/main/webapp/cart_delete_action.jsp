<%@ page import="com.itwill.shop.cart.CartService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  if(request.getMethod().equalsIgnoreCase("GET")) {
    response.sendRedirect("shop_main.jsp");
    return;
  }
  try {
  int cartNo = Integer.parseInt(request.getParameter("cartNo"));
  CartService cartService = new CartService();
  cartService.deleteCartItem(cartNo);
  response.sendRedirect("cart_list.jsp");
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
