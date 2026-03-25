<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="com.itwill.shop.product.*"%>
<%@ page import="com.itwill.shop.member.Member"%>
<%@ include file="include_common_top.jsp"%>

<%
java.text.DecimalFormat formatter = new java.text.DecimalFormat("###,###");

String productNoParam = request.getParameter("productNo");
if (productNoParam == null || productNoParam.trim().equals("")) {
	response.sendRedirect("product_list.jsp");
	return;
}

int productNo = Integer.parseInt(productNoParam);
ProductServiceImpl productService = new ProductServiceImpl();
Product product = productService.findByPrimaryKey(productNo);

if (product == null) {
%>
<script>
	alert("존재하지 않는 상품입니다.");
	location.href = "product_list.jsp";
</script>
<%
return;
}

Member loginUser = (Member) session.getAttribute("sMember");
boolean isAdmin = (loginUser != null && "Y".equalsIgnoreCase(loginUser.getIsAdmin()));
%>

<main style="padding: 30px; max-width: 1000px; margin: auto;">
	<h2 style="text-align: center;"><%=product.getProductName()%></h2>
	<div style="display: flex; gap: 40px; margin-top: 30px;">
		<img src="/image/<%=product.getProductImg()%>" width="300"
			alt="상품 이미지">
		<div style="flex: 1;">
			<p>
				<strong>상품 번호:</strong>
				<%=product.getProductNo()%></p>
			<p>
				<strong>가격:</strong>
				<%=formatter.format(product.getProductPrice())%>원
			</p>
			<p>
				<strong>재고:</strong>
				<%=product.getProductStock()%>개
			</p>
			<p>
				<strong>설명:</strong><br><%=product.getProductDesc()%></p>

			<%-- 로그인 여부를 JavaScript에서 사용할 수 있도록 설정 --%>
			<script>
				const isLoggedIn =
			<%=(loginUser != null) ? "true" : "false"%>
				;

				function goToOrder() {
					if (!isLoggedIn) {
						alert("로그인이 필요합니다.");
						location.href = "member_login_form.jsp";
					} else {
						document.getElementById("orderForm").action = "/OrderAdd";
						document.getElementById("orderForm").submit();
					}
				}
			</script>

			<form method="post" id="orderForm" action="cart_add_action.jsp"
				style="margin-top: 20px;">
				<input type="hidden" name="productNo"
					value="<%=product.getProductNo()%>"> <label for="qty">수량:</label>
				<input type="number" name="qty" id="qty" value="1" min="1"
					max="<%=product.getProductStock()%>"> <br>
				<br>
				<button type="submit" class="cart-button">장바구니 담기</button>
				<button type="button" onclick="goToOrder()" class="cart-button">바로
					구매하기</button>
			</form>


			<%
			if (isAdmin) {
			%>
			<form method="get" action="product_update_form.jsp"
				style="margin-top: 15px;">
				<input type="hidden" name="productNo"
					value="<%=product.getProductNo()%>">
				<button type="submit" class="cart-button">상품 수정하기</button>
			</form>
			<%
			}
			%>
		</div>
	</div>
</main>

<%@ include file="include_common_bottom.jsp"%>
