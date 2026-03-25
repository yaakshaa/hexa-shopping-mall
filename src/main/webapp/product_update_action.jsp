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
        response.sendRedirect("product_list.jsp");
        return;
    }

    int productNo = Integer.parseInt(productNoStr);
    String productName = request.getParameter("productName");
    String productDesc = request.getParameter("productDesc");

    int productPrice = 0;
    int productStock = 0;
    int categoryNo = 0;

    try {
        productPrice = Integer.parseInt(request.getParameter("productPrice"));
        productStock = Integer.parseInt(request.getParameter("productStock"));
        categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
    } catch (NumberFormatException e) {
%>
    <script>
        alert("숫자 입력이 잘못되었습니다.");
        history.back();
    </script>
<%
        return;
    }

    ProductServiceImpl productService = new ProductServiceImpl();
    Product product = productService.findByPrimaryKey(productNo);

    if (product == null) {
%>
    <script>
        alert("존재하지 않는 상품입니다.");
        location.href = "product_list.jsp";
    </script>
<%
        return;
    }

    product.setProductName(productName);
    product.setProductPrice(productPrice);
    product.setProductStock(productStock);
    product.setProductDesc(productDesc);
    product.setCategoryNo(categoryNo);

    productService.updateProduct(product);
%>

<script>
    alert("상품 정보가 수정되었습니다.");
    location.href = "product_detail.jsp?productNo=<%= productNo %>";
</script>

<%@ include file="include_common_bottom.jsp" %>
