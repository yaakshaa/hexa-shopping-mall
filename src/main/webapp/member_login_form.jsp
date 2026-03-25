<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include_common_top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

.main-content {
	display: flex;
	justify-content: center;
	padding-top: 80px; /* 위쪽 여백 추가 */
	padding-bottom: 40px; /* 아래쪽 여백 */
}

.login-box {
	background-color: #ffffff;
	border: 1px solid #dddddd;
	padding: 40px;
	width: 350px;
	border-radius: 8px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.login-box h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #333333;
}

.login-box input[type="text"], .login-box input[type="password"] {
	width: 100%;
	padding: 12px;
	margin-bottom: 16px;
	border: 1px solid #cccccc;
	border-radius: 4px;
	font-size: 14px;
}

.login-box button {
	width: 100%;
	padding: 12px;
	background-color: #222222;
	color: #ffffff;
	font-weight: bold;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 15px;
}

.login-box button:hover {
	background-color: #444444;
}

.signup-link {
	text-align: center;
	margin-top: 20px;
}

.signup-link a {
	color: #0066cc;
	text-decoration: none;
}

.signup-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<div class="main-content">
		<div class="login-box">
			<h2>로그인</h2>
			<form action="member_login_action.jsp" method="POST">
				<input type="text" name="memberId" placeholder="아이디" required /> <input
					type="password" name="memberPassword" placeholder="비밀번호" required />
				<button type="submit">로그인</button>
			</form>
			<div class="signup-link">
				<p>
					아직 회원이 아니신가요? <a href="member_signup_form.jsp">회원가입</a>
				</p>
			</div>
		</div>
	</div>

	<%@ include file="include_common_bottom.jsp"%>

</body>
</html>
