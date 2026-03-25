<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include_common_top.jsp" %>

<style>
    .signup-page {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: calc(100vh - 120px); /* header + footer 높이 빼기 */
        padding: 30px 0;
        background-color: #f5f5f5;
    }
    .signup-box {
        background-color: #f9f9f9;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        width: 400px;
    }
    .signup-box h2 {
        text-align: center;
        margin-bottom: 24px;
        font-size: 24px;
        font-weight: bold;
    }
    .signup-box input {
        width: 95%;
        padding: 12px;
        margin-bottom: 16px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }
    .signup-box .submit-btn {
        width: 100%;
        padding: 12px;
        background-color: #1e1e1e;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
    }
    .signup-box .submit-btn:hover {
        background-color: #444;
    }
    .login-link {
        margin-top: 20px;
        text-align: center;
        font-size: 14px;
    }
    .login-link a {
        color: #007bff;
        text-decoration: underline;
        font-weight: bold;
    }
</style>

<div class="signup-page">
    <div class="signup-box">
        <h2>회원가입</h2>
        <form action="member_signup_action.jsp" method="POST">
            <input type="text" name="memberId" placeholder="아이디" required/><br/>
            <input type="password" name="memberPassword" placeholder="비밀번호" required/><br/>
            <input type="text" name="memberName" placeholder="이름" /><br/>
            <input type="email" name="memberEmail" placeholder="이메일" /><br/>
            <input type="text" name="memberPhone" placeholder="전화번호" required/><br/>
            <input type="text" name="memberAddress" placeholder="주소" /><br/>
            <button type="submit" class="submit-btn">가입하기</button>
        </form>
        <div class="login-link">
            <p>이미 계정이 있으신가요? <a href="member_login_form.jsp">로그인</a></p>
        </div>
    </div>
</div>

<%@ include file="include_common_bottom.jsp" %>
