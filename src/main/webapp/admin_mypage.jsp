<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.itwill.shop.member.*" %>
<%@ page session="true" %>
<%
	String sMemberId = (String)session.getAttribute("sMemberId");
	Member sMember = (Member)session.getAttribute("sMember");

	// 관리자 권한 체크 (isAdmin 값이 "Y"여야 함)
	if (sMember == null || !"Y".equalsIgnoreCase(sMember.getIsAdmin())) {
		response.sendRedirect("shop_main.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 마이페이지</title>
	<style>
		body {
			font-family: 'Noto Sans KR', sans-serif;
			background-color: #f5f5f5;
			margin: 0;
			padding: 0;
		}
		.container {
			width: 90%;
			margin: 50px auto;
			text-align: center;
		}
		h1 {
			margin-bottom: 30px;
		}
		.card-grid {
			display: flex;
			justify-content: center;
			gap: 40px;
			flex-wrap: wrap;
		}
		.card {
			background-color: #ffffff;
			box-shadow: 0 4px 8px rgba(0,0,0,0.1);
			border-radius: 8px;
			padding: 30px 20px;
			width: 250px;
			text-align: center;
			text-decoration: none;
			color: #333;
			transition: all 0.2s ease-in-out;
		}
		.card:hover {
			transform: translateY(-5px);
			box-shadow: 0 8px 16px rgba(0,0,0,0.2);
		}
		.card-title {
			font-size: 20px;
			margin-bottom: 10px;
			font-weight: bold;
		}
		.card-desc {
			font-size: 14px;
			color: #666;
		}
	</style>
</head>
<body>

	<div class="container">
		<h1>관리자 마이페이지</h1>
		<div class="card-grid">
			<a class="card" href="admin_member_list.jsp">
				<div class="card-title">회원 목록</div>
				<div class="card-desc">전체 회원 확인 및 삭제</div>
			</a>
			<a class="card" href="admin_product_list.jsp">
				<div class="card-title">제품 현황</div>
				<div class="card-desc">모든 제품 정보 보기</div>
			</a>
			<a class="card" href="admin_order_list.jsp">
				<div class="card-title">주문 현황</div>
				<div class="card-desc">전체 주문 내역 조회</div>
			</a>
		</div>
	</div>

</body>
</html>
