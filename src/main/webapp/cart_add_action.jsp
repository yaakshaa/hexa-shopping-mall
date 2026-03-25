<%@ page import="com.itwill.shop.cart.CartService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String memberId = (String) session.getAttribute("sMemberId");
    if (memberId == null) {
%>

<script>
    alert("로그인이 필요합니다.");
    location.href = "member_login_form.jsp";
</script>

<%
        return;
    }

    String productNoStr = request.getParameter("productNo");
    String cartQtyStr = request.getParameter("qty");

    if (productNoStr == null || productNoStr.trim().isEmpty() ||
            cartQtyStr == null || cartQtyStr.trim().isEmpty()) {
%>
<script>
    alert("상품 정보가 누락되었습니다. 다시 시도해주세요.");
    history.back();
</script>

<%
        return;
    }
    try {
        int productNo = Integer.parseInt(request.getParameter("productNo"));
        int cartQty = Integer.parseInt(request.getParameter("qty"));

        CartService cartService = new CartService();
        cartService.insertCart(memberId, productNo, cartQty);
%>
<script>
    alert("장바구니에 상품이 담겼습니다!");
    location.href = "product_list.jsp";
</script>

<%
    return;
} catch (Exception e) {
    e.printStackTrace();
%>
<script>
    alert("장바구니 담기에 실패했습니다. 다시 시도해주세요");
    history.back();
</script>
<% } %>