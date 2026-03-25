<%@page import="com.itwill.shop.order.OrderDao"%>
<%@page import="com.itwill.shop.order.OrderItem"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ include file="include_common_top.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.itwill.shop.product.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" session="true"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@page import="com.itwill.shop.order.Order"%>

<%
String memberId=(String)session.getAttribute("sMemberId");
Order order = new Order();

int ordersNo=Integer.parseInt(request.getParameter("orderNo"));
OrderService orderService = new OrderService();

String status=request.getParameter("status");

List<OrderItem> orderItemList = orderService.getOrderItemList(ordersNo);
DecimalFormat numberFormat = new DecimalFormat("###,###");
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
System.out.println(status);
%>
<style>
.OrderList {
   list-style-type: none;
}

.order-item {
   text-align: left;
   margin-bottom: 30px;
}

.order-item-wrapper {
   margin-top: 10px;
}

.order-item-wrapper>div {
   display: inline-block;
}

.order-item-info {
   margin-left: 30px;
   position: absolute;
}

img {
   width: 300px;
   height: 200px;
}

.left-align {
   text-align: left;
}
</style>
<%
   if(status!=null && status.equals("delete")){
%>
   <script>
      alert('주문취소 되었습니다.');
   </script>
<%
   }
%>
   <div class="orderList">
      <h4 class="left-align">&emsp;&emsp; 주문 상세 (주문번호 : <%=orderItemList.get(0).getformatordersNo()%> ) 주문상태 : <%=orderItemList.get(0).getOStatus()%></h4>
      <h4 class="left-align">&emsp;&emsp; <%=dateFormat.format(orderItemList.get(0).getODate())%> </h4>
      
      <!-- 주문 전체 취소 버튼 추가 -->
       <form action="/OrderDelete" method="get" onsubmit="return confirm('정말 주문을 취소하시겠습니까?');">
        <input type="hidden" name="ordersNo" value="<%=orderItemList.get(0).getOrdersNo()%>">
        
        <%
        if( (status==null&& !orderItemList.get(0).getOStatus().equals("취소완료")) || (status!=null && !status.equals("delete"))){%>
              &emsp;&emsp;<button type="submit" class="cart-button">주문 전체 취소</button>
        <% }%>
        </form>
   </div>
   <div class="productsItem">
      <ul class="OrderItemList">
      <%
      for (OrderItem orderItem : orderItemList) {
      %>
      <li class="order-item">
         <div>
            <span style="color: gray;">주문 상세 번호 : <%=orderItem.getOiNo()%></span>
         </div>
         <div class="order-item-wrapper">
            <div>
               <img src="/image/<%=orderItem.getPImg()%>" />
            </div>
            <div class="order-item-info">
               <span style="font-weight: 550;"><%=orderItem.getPName()%></span><br/>
               <% if(orderItem.getOiQty()==0){
            	%>
            	  <p style="color: red;">부분 취소</p> 
              <%} else{%>
             		 <span>수량 : <%=orderItem.getOiQty()%>개</span><br/>
              		 <span>개당 제품 가격 : <%=numberFormat.format(orderItem.getOiPrice())%>원</span>
              <%}%>
              
              <% if(!(orderItemList.get(0).getOStatus().equals("취소완료")
           		 ||(orderItemList.get(0).getOStatus().equals("부분취소")&&orderItem.getOiQty()==0)
           		 ||(status!=null && status.equals("delete")))){ 
           	  %>
                 <form action="OrderItemDelete" method="get" style="display:inline;">
                 <input type="hidden" name="oiNo" value="<%=orderItem.getOiNo()%>">
                 <input type="hidden" name="ordersNo" value="<%=ordersNo%>">
                 <button type="submit" class="cart-button">부분 취소</button>  
            	</form>
              <% }%>
            </div>
            <br/>
            
            <% if(!(orderItemList.get(0).getOStatus().equals("취소완료")
           		 ||(orderItemList.get(0).getOStatus().equals("부분취소")&&orderItem.getOiQty()==0)
           		 ||(status!=null && status.equals("delete")))){ 
           	%>
			<div class="order-buttons">
			    <a href="reviewForm.jsp?oiNo=<%=orderItem.getOiNo()%>" class="btn-link">후기 작성</a>
			    <a href="deliveryTracking.jsp?oiNo=<%=orderItem.getOiNo()%>" class="btn-link">배송 조회</a>
			    <a href="cart_add_action.jsp?productNo=<%=orderItem.getProductNo()%>&qty=1" class="btn-link">재구매</a>
			</div>

            <%	
            }
            %>            
         </div>
      </li>
      <%
      }
      %>
      </ul>
   </div>

<%@ include file="include_common_bottom.jsp"%>
