<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.itwill.shop.member.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String memberId=request.getParameter("memberId");
	String memberPassword=request.getParameter("memberPassword");
	String memberName=request.getParameter("memberName");
	String memberEmail=request.getParameter("memberEmail");
	String memberPhone=request.getParameter("memberPhone");
	String memberAddress=request.getParameter("memberAddress");
	
	//null 방지처리
	if(memberEmail==null)memberEmail="";
	if(memberAddress==null)memberAddress="";
	
	Member sMember = (Member)session.getAttribute("sMember");
	String isAdmin=(sMember!=null && sMember.getIsAdmin()!=null)? sMember.getIsAdmin():"N";
	
	Member member=new Member(memberId, memberPassword, memberName, memberEmail, memberPhone, memberAddress, isAdmin);//일반회원 기준으로 고정(필요시 수정)
	
	MemberService memberService=new MemberServiceImpl(new MemberDaoImplMyBatis());
	memberService.updateMember(member);
	
	//세션 정보 갱신
	Member updatedMember=memberService.getMember(memberId);
	session.setAttribute("sMember", updatedMember);
	session.setAttribute("sMemberId", updatedMember.getMemberId());
	
	//메인 페이지로 리다이렉션
	response.sendRedirect("shop_main.jsp");
%>