<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.itwill.shop.member.Member" %>
<%@ page session="true" %>
<%
	Member sMember=(Member)session.getAttribute("sMember");
	if(sMember==null){
		response.sendRedirect("member_login_form.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #f5f5f5;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
		}
	.edit-box{
		background-color: #ffffff;
		padding: 40px;
		border-radius: 10px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		width: 400px;
		}
	.edit-box h2{
		text-align: center;
		margin-bottom: 20px;
		}
	.edit-box input{
		width: 100%;
		padding: 12px;
		margin: 8px 0;
		box-sizing: border-box;
		border: 1px solid #ccc;
		border-radius: 4px;
		}
	.edit-box button{
		width: 48%;
		padding: 12px;
		background-color: #333;
		color: white;
		border: none;
		border-radius: 4px;
		font-size: 16px;
		cursor: pointer;
		margin-top: 12px;
		}
	.edit-box button.cancel{
		background-color: #888;
		margin-left: 4%;
		}
</style>
</head>
<body>
	<div class="edit-box">
		<h2>회원정보 수정</h2>
		<form action="member_edit_action.jsp" method="POST">
			<input type="text" name="memberId" value="<%=sMember.getMemberId()%>" readonly/><br>
			<input type="password" name="memberPassword" value="<%=sMember.getMemberPassword()%>" required/><br>
			<input type="text" name="memberName" value="<%=sMember.getMemberName()%>" required/><br>
			<input type="email" name="memberEmail" value="<%=sMember.getMemberEmail()%>" /><br>
			<input type="text" name="memberPhone" value="<%=sMember.getMemberPhone()%>" required/><br>
			<input type="text" name="memberAddress" value="<%=sMember.getMemberAddress()%>" />
			<div style="display: flex; justify-content: sapce-between;">
				<button type="submit">수정완료</button>
				<button type="button" class="cancel" onclick="location.href='shop_main.jsp'">수정취소</button>
			</div>
		</form>
	</div>
</body>
</html>