<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.itwill.shop.member.*" %>
<%@ page session="true" %>

<%
	String sMemberId = (String)session.getAttribute("sMemberId");
	Member sMember = (Member)session.getAttribute("sMember");

	if (sMember == null || !"Y".equalsIgnoreCase(sMember.getIsAdmin())) {
		response.sendRedirect("shop_main.jsp");
		return;
	}

	MemberService memberService = new MemberServiceImpl(new MemberDaoImplMyBatis());
	List<Member> memberList = memberService.getAllMembers();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 목록 - 관리자</title>
	<style>
		body {
			font-family: 'Noto Sans KR', sans-serif;
			background-color: #f5f5f5;
			padding: 30px;
		}
		h2 {
			text-align: center;
			margin-bottom: 20px;
		}
		table {
			width: 100%;
			border-collapse: collapse;
			background-color: #fff;
			box-shadow: 0 2px 4px rgba(0,0,0,0.1);
		}
		th, td {
			border: 1px solid #ddd;
			padding: 10px;
			text-align: center;
		}
		th {
			background-color: #333;
			color: white;
		}
		tr:nth-child(even) {
			background-color: #f9f9f9;
		}
		.delete-btn {
			padding: 6px 12px;
			background-color: #e74c3c;
			color: white;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
	</style>
</head>
<body>

	<h2>회원 목록</h2>

	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>관리자여부</th>
			<th>삭제</th>
		</tr>
		<%
			for (Member member : memberList) {
		%>
		<tr>
			<td><%= member.getMemberId() %></td>
			<td><%= member.getMemberName() %></td>
			<td><%= member.getMemberEmail() %></td>
			<td><%= member.getMemberPhone() %></td>
			<td><%= member.getMemberAddress() %></td>
			<td><%= member.getIsAdmin() %></td>
			<td>
				<form action="member_delete_action.jsp" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
					<input type="hidden" name="memberId" value="<%= member.getMemberId() %>" />
					<button type="submit" class="delete-btn">삭제</button>
				</form>
			</td>
		</tr>
		<% } %>
	</table>

</body>
</html>
