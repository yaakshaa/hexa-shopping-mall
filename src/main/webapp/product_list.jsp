<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file="include_common_top.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.itwill.shop.category.*" %>
<%@ page import="com.itwill.shop.product.*" %>

<%
    java.text.DecimalFormat formatter = new java.text.DecimalFormat("###,###");

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

<style>
    .category-list {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 12px;
        padding: 16px 0;
        list-style: none;
        margin: 0;
    }

    .category-list form {
        margin: 0;
    }

    .category-button {
        padding: 8px 20px;
        background-color: #2d3436;
        color: #ffffff;
        border: none;
        border-radius: 20px;
        font-size: 0.9rem;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.25s, transform 0.1s;
    }

    .category-button:hover {
        background-color: #636e72;
        transform: translateY(-2px);
    }

    .category-button:active {
        transform: scale(0.97);
    }

    .product-list {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        padding: 0;
        list-style: none;
    }

    .product-card {
        width: 200px;
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
        background-color: #f9f9f9;
    }

    .product-card img {
        width: 100%;
        height: auto;
    }
</style>

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
                    <form action="product_list.jsp" method="get">
                        <input type="hidden" name="categoryNo" value="<%= c.getCategoryNo() %>">
                        <button type="submit" class="category-button">
                            <%= c.getCategoryName() %>
                        </button>
                    </form>
                </li>
            <% } %>
        </ul>

        <% if (productList != null) { %>
            <h2>해당 카테고리 상품</h2>
            <ul class="product-list">
                <% for (Product p : productList) { %>
                    <li class="product-card">
                        <a href="product_detail.jsp?productNo=<%= p.getProductNo() %>">
                            <img src="/image/<%= p.getProductImg() %>" alt="product image">
                        </a>
                        <strong><%= p.getProductName() %></strong><br>
                        <%= formatter.format(p.getProductPrice()) %>원
                    </li>
                <% } %>
            </ul>
        <% } %>
    </section>
</main>

<%@ include file="include_common_bottom.jsp" %>
