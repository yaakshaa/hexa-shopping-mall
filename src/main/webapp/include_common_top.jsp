<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.itwill.shop.member.Member" %>
<%@ page import="com.itwill.shop.cart.CartService" %>
<%@ page session="true" %>
<%
    String sMemberId = (String) session.getAttribute("sMemberId");
    Member sMember = (Member) session.getAttribute("sMember");
    int cartCount = 0;

    // 로그인한 경우에만 장바구니 수량을 가져옴
    if (sMemberId != null) {
        try {
            CartService cartService = new CartService();
            cartCount = cartService.getCartTotalQty(sMemberId); // 장바구니 총 수량 가져오기
        } catch (Exception e) {
            cartCount = 0;  // 예외 발생 시 기본값으로 0 설정
            e.printStackTrace();
        }
    }
%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">

<header>
    <div class="left-header">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/shop_main.jsp">HexaShop</a>
        </div>
        <% if (sMemberId != null && sMember != null) { %>
        <span class="welcome-box">
            <a href="${pageContext.request.contextPath}/member_edit_form.jsp" class="member-name"><%= sMember.getMemberName() %></a>님&nbsp;환영합니다!
        </span>
        <% } %>
    </div>

    <nav>
        <a href="${pageContext.request.contextPath}/product_list.jsp">상품</a>

        <!-- 로그인한 경우에만 장바구니 수량 표시 -->
        <a href="${pageContext.request.contextPath}/cart_list.jsp">
            장바구니 <%= (sMemberId != null && cartCount > 0) ? ("[" + cartCount + "]") : "" %>
        </a>

        <% if (sMemberId == null || sMember == null) { %>
        <a href="${pageContext.request.contextPath}/member_login_form.jsp">로그인</a>
        <% } else { %>
        <a href="${pageContext.request.contextPath}/orderList.jsp" class="order-link">주문내역</a>
        <a href="${pageContext.request.contextPath}/member_edit_form.jsp">마이페이지</a>
        <a href="javascript: void(0);" onclick="confirmLogout()">로그아웃</a>
        <% } %>
    </nav>
</header>

<script type="text/javascript">
    function confirmLogout() {
        if (confirm("정말 로그아웃 하시겠습니까?")) {
            location.href = "<%= request.getContextPath() %>/member_logout_action.jsp";
        }
    }
</script>
