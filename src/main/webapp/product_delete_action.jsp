<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.itwill.shop.product.*" %>
<%@ include file="include_common_top.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

    if (request.getMethod().equalsIgnoreCase("GET")) {
        response.sendRedirect("product_list.jsp");
        return;
    }

    String productNoStr = request.getParameter("productNo");
    if (productNoStr == null || productNoStr.trim().equals("")) {
%>
    <script>
        alert("상품 번호가 유효하지 않습니다.");
        history.back();
    </script>
<%
        return;
    }

    int productNo = Integer.parseInt(productNoStr);

    ProductServiceImpl productService = new ProductServiceImpl();
    productService.deleteProduct(productNo);
%>

<script>
    alert("상품이 삭제되었습니다.");
    location.href = "product_list.jsp";
</script>

<%@ include file="include_common_bottom.jsp" %>
