<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="com.itwill.shop.member.MemberService" %>
<%@page import="com.itwill.shop.member.MemberServiceImpl" %>
<%@page import="com.itwill.shop.member.MemberDaoImplMyBatis" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String memberId=request.getParameter("memberId");
	String memberPassword=request.getParameter("memberPassword");
	
	String scriptMessage="";
	String redirectPage="";
	
	try{
		MemberService memberService = new MemberServiceImpl(new MemberDaoImplMyBatis());
		boolean loginSuccess=memberService.login(memberId, memberPassword);
		if(loginSuccess){
			session.setAttribute("sMemberId", memberId);
			session.setAttribute("sMember", memberService.getMember(memberId));
			
			response.sendRedirect("shop_main.jsp");
		}else{
			scriptMessage="아이디 또는 비밀번호를 확인해주세요.";
			redirectPage="member_login_form.jsp";
		}
			
	} catch(Exception e){
		scriptMessage="로그인 처리 중 오류가 발생했습니다.";
		redirectPage="member_login_form.jsp";
	}
%>
<script>
<%if(!scriptMessage.equals("")){%>
	alert('<%=scriptMessage%>');<%
	}%>
	location.href='<%=redirectPage %>';
</script>