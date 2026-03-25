<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
<script>
	function confirmLogout() {
		return confitm("정말 로그아웃 하시겠습니까?");
	}
</script>
</head>
<body>
	<h2>로그아웃</h2>
	<form id="logoutForm" action="member_logout_action.jsp" method="POST" onsubmit="return confirmLogout();">
		<button type="submit" >로그아웃</button>
	</form>
</body>
</html>