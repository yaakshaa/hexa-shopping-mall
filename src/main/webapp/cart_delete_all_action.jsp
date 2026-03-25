<%@ page import="com.itwill.shop.cart.CartService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    if(request.getMethod().equalsIgnoreCase("GET")) {
        response.sendRedirect("shop_main.jsp");
        return;
    }
    try {
        String memberId = (String) session.getAttribute("sMemberId");
        if (memberId != null) {
            CartService cartService = new CartService();
            cartService.clearCart(memberId);
            response.sendRedirect("cart_list.jsp");
        } else {
            response.sendRedirect("member_login_form.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
