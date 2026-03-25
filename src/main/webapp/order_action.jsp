<%@ page import="com.itwill.shop.cart.CartService" %>
<%@ page import="com.itwill.shop.cart.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="com.itwill.shop.order.OrderService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
if(request.getMethod().equalsIgnoreCase("GET")) {
        response.sendRedirect("shop_main.jsp");
        return;
    }

    String memberId = (String) session.getAttribute("sMemberId");
    if (memberId == null) {
        response.sendRedirect("member_login_form.jsp");
        return;
    }

    try {
        CartService cartService = new CartService();
        List<Cart> cartList = cartService.getCartListLogic(memberId);

        OrderService orderService = new OrderService();
        orderService.saveCartToOrder(cartList); //주문저장

        cartService.clearCart(memberId); //장바구니 초기화

        response.sendRedirect("order_success.jsp");

    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("주문 처리 중 오류가 발생했습니다. 다시 시도해주세요.");
            location.href = "cart_list.jsp";
        </script>
<%
    }
%>