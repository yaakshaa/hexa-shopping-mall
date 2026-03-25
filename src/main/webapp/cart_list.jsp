<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.itwill.shop.cart.Cart" %>
<%@ page import="com.itwill.shop.cart.CartService" %>
<%@ page import="com.itwill.shop.product.Product" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="include_common_top.jsp" %>

<%
    DecimalFormat formatter = new DecimalFormat("###,###");
%>

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

    try {
        CartService cartService = new CartService();
        List<Cart> cartList = cartService.getCartList(memberId);
        int totalPrice = 0;

        if (cartList.isEmpty()) { %>
<div class="cart-empty">
    장바구니에 담은 상품이 없습니다.🛒

    <form action="product_list.jsp" method="get" style="margin-top: 20px;">
        <button type="submit" class="cart-button">상품 보러가기</button>
    </form>
</div>
<% } else { %>

<div class="cart-container">
    <h2>장바구니</h2>
    <table class="cart-table">
        <tr>
            <th>이미지</th>
            <th>상품명</th>
            <th>수량</th>
            <th>가격</th>
            <th>합계</th>
            <th>삭제</th>
        </tr>

        <%
            for (Cart cart : cartList) {
                Product p = cart.getProduct();
                int itemTotal = p.getProductPrice() * cart.getCartQty();
                totalPrice += itemTotal;
        %>
        <tr>
            <td><img src="<%= request.getContextPath() %>/image/<%= p.getProductImg() %>" alt="상품이미지"></td>
            <td><%= p.getProductName() %>
            </td>
            <td>
                <form action="cart_qty_update_action.jsp" method="post" onsubmit="updateCartCount()">
                    <input type="hidden" name="cartNo" value="<%= cart.getCartNo() %>"/>
                    <input type="number" class="cart-qty-input" name="cartQty" value="<%= cart.getCartQty() %>"
                           min="1"/>
                    <input type="submit" class="cart-button" value="변경"/>
                </form>
            </td>
            <td><%= formatter.format(p.getProductPrice()) %> 원</td>
            <td><%= formatter.format(itemTotal) %> 원</td>
            <td>
                <form action="cart_delete_action.jsp" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                    <input type="hidden" name="cartNo" value="<%= cart.getCartNo() %>"/>
                    <input type="submit" class="cart-button" value="삭제"/>
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>

    <!-- 총 결제 금액 표시 -->
    <div class="cart-summary">
        <div class="total-price">총 결제금액: <%= formatter.format(totalPrice) %> 원</div>
        <hr class="cart-summary-divider">

        <div class="cart-actions">
            <form action="shop_main.jsp" method="get">
                <button type="submit" class="cart-button">메인화면</button>
            </form>
            <form action="order_action.jsp" method="post">
                <button type="submit" class="cart-button">구매하기</button>
            </form>
            <form action="cart_delete_all_action.jsp" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                <button type="submit" class="cart-button">전체삭제</button>
            </form>
        </div>
    </div>
        <% }
} catch (Exception e) {
        e.printStackTrace();
%>
    <div style="color: red;">오류 발생: <%= e.getMessage() %></div>
<%
        }
%>
<%@ include file="include_common_bottom.jsp" %>

<script>
    function updateCartCount() {
        // 수량이 변경될 때마다 top.jsp의 장바구니 수량을 자동으로 업데이트
        location.reload();  // 페이지 새로고침을 통해 top.jsp 업데이트
    }
</script>
