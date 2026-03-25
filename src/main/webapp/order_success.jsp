<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="include_common_top.jsp" %>

<div class="order-success">
    <h2>주문이 완료되었습니다!</h2>
    <p>주문 내역은 아래 버튼을 통해 확인하실 수 있습니다.</p>

    <div class="order-buttons">
      <a href="orderList.jsp" class="cart-button">주문내역 보기</a>
      <a href="shop_main.jsp" class="cart-button">메인화면</a>
    </div>
</div>

<%@ include file="include_common_bottom.jsp" %>