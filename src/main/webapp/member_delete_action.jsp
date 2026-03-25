<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.itwill.shop.member.*" %>
<%@ page session="true" %>

<%
	request.setCharacterEncoding("UTF-8");
	String loginId = (String)session.getAttribute("sMemberId");
	Member loginMember = (Member)session.getAttribute("sMember");

	if (loginMember == null || !"Y".equalsIgnoreCase(loginMember.getIsAdmin())) {
		response.sendRedirect("shop_main.jsp");
		return;
	}

	String memberIdToDelete = request.getParameter("memberId");
	String message = "";

	try {
		MemberService memberService = new MemberServiceImpl(new MemberDaoImplMyBatis());
		
		if (memberIdToDelete != null && !memberIdToDelete.equals(loginId)) {
			memberService.deleteMember(memberIdToDelete);
			message = "회원 삭제 완료";
		} else if (memberIdToDelete.equals(loginId)) {
			message = "관리자 본인은 삭제할 수 없습니다.";
		} else {
			message = "삭제할 회원 ID가 올바르지 않습니다.";
		}
	} catch(Exception e) {
		e.printStackTrace();
		message = "회원 삭제 중 오류 발생";
	}
%>

<script>
	alert('<%=message%>');
	location.href = 'admin_member_list.jsp';
</script>
