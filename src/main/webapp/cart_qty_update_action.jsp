<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.itwill.shop.cart.CartService" %>

<%
  // get 방식일 시 메인화면 가기
  if(request.getMethod().equalsIgnoreCase("GET")) {
    response.sendRedirect("shop_main.jsp");
    return;
  }
  try {
    // 파라미터 꺼내기
    int cartNo = Integer.parseInt(request.getParameter("cartNo"));
    int cartQty = Integer.parseInt(request.getParameter("cartQty"));

    // 유효성 검사 (수량이 0보다 작으면 최소 1로 변경)
    if (cartQty < 1) {
      cartQty = 1;
    }

    // 서비스 호출
    CartService cartService = new CartService();
    cartService.updateCartByCartNo(cartNo, cartQty);

    // 다시 장바구니 목록으로 리다이렉트
    response.sendRedirect("cart_list.jsp");
  } catch (Exception e) {
    e.printStackTrace();
  }

%>
