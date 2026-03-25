<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@ include file="include_common_top.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.itwill.shop.product.*" %>
<%
String memberId=(String)session.getAttribute("sMemberId");
OrderService orderService = new OrderService();

int range=3;
if(request.getParameter("range")!=null){
	range= Integer.parseInt(request.getParameter("range"));
}

List<Order> orderList= orderService.getOrderList(memberId,range);
//System.out.println("화면"+orderList.size() );
DecimalFormat numberFormat = new DecimalFormat("###,###");
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
%>
<style>
	.OrderList {
		list-style-type: none;
	}
	
	.order-item{
	    text-align: left;
		margin-bottom: 30px;
	}
	
	.order-item-wrapper{
		margin-top: 10px;
	}
	.order-item-wrapper>div{
		display: inline-block;
	}
	.order-item-info{
		margin-left: 30px;
		position: absolute;
	}
		
	img {
	  width: 300px;
	  height: 200px;
	  object-fit: fill;
	}
	
	.left-align {
    text-align: left;
	}
</style>
</style>
<main>
<div class="order" style="display: flex; justify-content: flex-start; align-items: center;">
    <h4 class="left-align">&emsp;&emsp; 전체 구매 상품</h4>
    
    <form method="get" action="orderList.jsp" style="margin-left: auto; margin-right: 100px;">
        <select name="range" onchange="this.form.submit()">
            <option value="3" <%= "3".equals(request.getParameter("range")) ? "selected" : "" %>>3개월</option>
            <option value="6" <%= "6".equals(request.getParameter("range")) ? "selected" : "" %>>6개월</option>
            <option value="12" <%= "12".equals(request.getParameter("range")) ? "selected" : "" %>>1년</option>
        </select>
    </form>
</div>

   <div class="products">
    <ul class="OrderList">
    <% if (orderList == null || orderList.isEmpty()) { %>
        <li>구매내역이 없습니다.</li>
    <% } else { 
        for (Order order : orderList) { %>
        <li class="order-item">
            <div>
                <span><%= dateFormat.format(order.getOrdersDate()) %>    &nbsp   주문상태: <%= order.getOrdersStatus()%> </span>
            </div>
            <div>
                <span style="color:gray;"> 주문번호 : <%= order.getformatordersNo() %> </span>
            </div>
            <div class="order-item-wrapper">
                <div><img src="/image/<%= order.getOiImg() %>"/></div>
                <div class="order-item-info">
                    <span>
                        <a class="btn-link" href="orderDetailList.jsp?orderNo=<%= order.getOrdersNo() %>">주문 상세보기</a>
                    </span><br/>
                    <span>
                        <%= order.getOiProductName() %>
                        <% if (order.getOiCnt() > 1) {
                            int A = order.getOiCnt() - 1; %>
                            외 <%= A %> 건
                        <% } %>
                    </span><br/>
                    <span>총 결제액 : <%= numberFormat.format(order.getOrdersTotPrice())%>원</span>
                </div>
            </div>
        </li>
    <%  } 
    } %>
    </ul> 
</div>
</main>

<%@ include file="include_common_bottom.jsp" %>
