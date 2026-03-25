<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.itwill.shop.member.Member" %>
<%@ page import="com.itwill.shop.order.Order" %>
<%@ page import="com.itwill.shop.order.OrderService" %>

<%
    request.setCharacterEncoding("UTF-8");

    Member sMember = (Member) session.getAttribute("sMember");
    if (sMember == null || !"Y".equalsIgnoreCase(sMember.getIsAdmin())) {
        response.sendRedirect("member_login_form.jsp");
        return;
    }

    OrderService orderService = new OrderService();
    List<Order> orderList = orderService.getAllOrders();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문 현황 (관리자)</title>
    <link rel="stylesheet" href="css/shop.css">
    <style>
        .admin-container {
            max-width: 1000px;
            margin: 60px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 16px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #2c3e50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f5f5f5;
        }

        .no-orders {
            text-align: center;
            color: #666;
            padding: 30px 0;
        }
    </style>
</head>
<body>
    <jsp:include page="include_common_top.jsp" />

    <div class="admin-container">
        <h2>전체 주문 현황</h2>

        <%
            if (orderList == null || orderList.size() == 0) {
        %>
        <p class="no-orders">주문 내역이 없습니다.</p>
        <%
            } else {
        %>
        <table>
            <thead>
                <tr>
                    <th>주문번호</th>
                    <th>회원ID</th>
                    <th>주문일</th>
                    <th>총액</th>
                    <th>상세보기</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Order order : orderList) {
                %>
                <tr>
                    <td><%= order.getOrderNo() %></td>
                    <td><%= order.getUserId() %></td>
                    <td><%= order.getOrderDate() %></td>
                    <td><%= order.getTotalPrice() %>원</td>
                    <td><a href="admin_order_detail.jsp?orderNo=<%= order.getOrderNo() %>">상세보기</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            }
        %>
    </div>

    <jsp:include page="include_common_bottom.jsp" />
</body>
</html>
