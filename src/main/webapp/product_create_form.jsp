<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.itwill.shop.category.*" %>
<%@ page import="com.itwill.shop.member.Member" %>
<%@ include file="include_common_top.jsp" %>

<%
    Member loginUser = (Member) session.getAttribute("sMember");
    if (loginUser == null || !"Y".equalsIgnoreCase(loginUser.getIsAdmin())) {
%>
    <script>
        alert("관리자만 접근 가능합니다.");
        location.href = "shop_main.jsp";
    </script>
<%
        return;
    }

    CategoryDaoImplMyBatis categoryDao = new CategoryDaoImplMyBatis();
    List<Category> categoryList = categoryDao.categoryListByAsc();
%>

<style>
    .form-container {
        padding: 40px;
        max-width: 600px;
        margin: 40px auto;
        background-color: #ffffff;
        border: 1px solid #ddd;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.06);
        font-family: 'Segoe UI', sans-serif;
    }

    .form-container h2 {
        text-align: center;
        margin-bottom: 30px;
        font-size: 1.8rem;
        color: #2c3e50;
    }

    .form-container label {
        font-weight: 600;
        margin-top: 16px;
        display: block;
        margin-bottom: 6px;
    }

    .form-container input[type="text"],
    .form-container input[type="number"],
    .form-container textarea,
    .form-container select {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 1rem;
        box-sizing: border-box;
    }

    .form-container textarea {
        resize: vertical;
    }

    .form-container button {
        margin-top: 25px;
        width: 100%;
        padding: 12px;
        background-color: #2c3e50;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 1.1rem;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .form-container button:hover {
        background-color: #34495e;
    }
</style>

<main class="form-container">
    <h2>신규 상품 등록</h2>
    <form method="post" action="product_create_action.jsp">
        <label>상품명</label>
        <input type="text" name="productName" required>

        <label>가격</label>
        <input type="number" name="productPrice" required>

        <label>재고</label>
        <input type="number" name="productStock" required>

        <label>설명</label>
        <textarea name="productDesc" rows="4"></textarea>

        <label>이미지 파일명 (예: t-shirt1.jpg)</label>
        <input type="text" name="productImg" placeholder="예: image01.jpg" required>

        <label>카테고리</label>
        <select name="categoryNo" required>
            <% for (Category c : categoryList) { %>
                <option value="<%= c.getCategoryNo() %>"><%= c.getCategoryName() %></option>
            <% } %>
        </select>

        <button type="submit">상품 등록</button>
    </form>
</main>

<%@ include file="include_common_bottom.jsp" %>
