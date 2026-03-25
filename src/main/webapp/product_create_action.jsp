<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.itwill.shop.product.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    // 1. 폼 파라미터 받기
    String productName = request.getParameter("productName");
    int productPrice = Integer.parseInt(request.getParameter("productPrice"));
    int productStock = Integer.parseInt(request.getParameter("productStock"));
    String productDesc = request.getParameter("productDesc");
    String productImg = request.getParameter("productImg"); // 예: "shirt1.jpg"
    int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));

    // 2. Product 객체 생성
    Product product = new Product(0, productName, productPrice, productStock, productDesc, productImg, categoryNo);

    // 3. 등록 서비스 호출
    ProductServiceImpl productService = new ProductServiceImpl();
    productService.insertProduct(product);
%>
<script>
    alert("상품이 성공적으로 등록되었습니다.");
    location.href = "product_list.jsp";
</script>
