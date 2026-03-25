<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file="include_common_top.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.itwill.shop.category.*" %>
<%@ page import="com.itwill.shop.product.*" %>

<%
    CategoryDaoImplMyBatis categoryDao = new CategoryDaoImplMyBatis();
    List<Category> categoryList = categoryDao.categoryListByAsc();

    ProductServiceImpl productService = new ProductServiceImpl();
    String categoryNoParam = request.getParameter("categoryNo");
    List<Product> productList = null;

    if (categoryNoParam != null) {
        int categoryNo = Integer.parseInt(categoryNoParam);
        productList = productService.findByCategory(categoryNo);
    }
%>

<main>
    <section class="hero">
        <h1>당신만을 위한 의류 쇼핑몰</h1>
        <p>지금 HexaShop에서 최신 트렌드를 만나보세요.</p>
    </section>

    <section class="products">
        <h2>카테고리</h2>
        <ul class="category-list">
            <% for (Category c : categoryList) { %>
                <li>
                    <a href="p_c.jsp?categoryNo=<%= c.getCategoryNo() %>">
                        <%= c.getCategoryName() %>
                    </a>
                </li>
            <% } %>
        </ul>

        <% if (productList != null) { %>
            <h2>해당 카테고리 상품</h2>
            <ul class="product-list">
                <% for (Product p : productList) { %>
                    <li>
                        <img src="/image/<%= p.getProductImg() %>" width="150"><br>
                        <strong><%= p.getProductName() %></strong><br>
                        <%= p.getProductPrice() %>원
                    </li>
                <% } %>
            </ul>
        <% } %>
    </section>
</main>

<%@ include file="include_common_bottom.jsp" %>
