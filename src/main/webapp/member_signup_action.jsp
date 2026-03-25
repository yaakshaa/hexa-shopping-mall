<%@ page import="com.itwill.shop.member.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String memberId=request.getParameter("memberId");
	String memberPassword=request.getParameter("memberPassword");
	String memberName=request.getParameter("memberName");
	String memberEmail=request.getParameter("memberEmail");
	String memberPhone=request.getParameter("memberPhone");
	String memberAddress=request.getParameter("memberAddress");
	
	if(memberEmail==null)memberEmail="";
	if(memberAddress==null)memberAddress="";
	String isAdmin="N";
	
	Member newMember = new Member(memberId, memberPassword, memberName, memberEmail, memberPhone, memberAddress, isAdmin);
	MemberService memberService = new MemberServiceImpl(new MemberDaoImplMyBatis());
	if(!memberService.isDuplicated(memberId)){
		memberService.addMember(newMember);
		session.setAttribute("sMemberId", memberId);
		session.setAttribute("sMember", newMember);
		response.sendRedirect("shop_main.jsp");
	}else{
%>	
<script>
	alert("이미 사용 중인 아이디입니다.");
	location.href="member_signup_form.jsp";
</script>	
<%} %>	

	