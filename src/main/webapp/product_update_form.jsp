<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.itwill.shop.product.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.itwill.shop.category.*" %>
<%@ page import="com.itwill.shop.member.Member" %>
<%@ include file="include_common_top.jsp" %>

<%
    // 상품 번호 파라미터 체크
    String productNoParam = request.getParameter("productNo");
    if (productNoParam == null || productNoParam.trim().equals("")) {
%>
    <script>
        alert("상품 정보가 누락되었습니다.");
        location.href = "product_list.jsp";
    </script>
<%
        return;
    }

    int productNo = Integer.parseInt(productNoParam);
    ProductServiceImpl productService = new ProductServiceImpl();
    Product product = productService.findByPrimaryKey(productNo);

    if (product == null) {
%>
    <script>
        alert("해당 상품을 찾을 수 없습니다.");
        location.href = "product_list.jsp";
    </script>
<%
        return;
    }

    CategoryDaoImplMyBatis categoryDao = new CategoryDaoImplMyBatis();
    List<Category> categoryList = categoryDao.categoryListByAsc();
%>

<main style="padding: 30px; max-width: 800px; margin: auto;">
    <h2 style="text-align: center;">상품 수정</h2>
    <form method="post" action="product_update_action.jsp" style="margin-top: 30px;">
        <input type="hidden" name="productNo" value="<%= product.getProductNo() %>">

        <label>상품명:</label><br>
        <input type="text" name="productName" value="<%= product.getProductName() %>" required style="width:100%;"><br><br>

        <label>가격:</label><br>
        <input type="number" name="productPrice" value="<%= product.getProductPrice() %>" required style="width:100%;"><br><br>

        <label>재고:</label><br>
        <input type="number" name="productStock" value="<%= product.getProductStock() %>" required style="width:100%;"><br><br>

        <label>설명:</label><br>
        <textarea name="productDesc" rows="5" style="width:100%;"><%= product.getProductDesc() %></textarea><br><br>

        <label>이미지:</label><br>
        <img src="/image/<%= product.getProductImg() %>" width="100"><br><br>

        <label>카테고리:</label><br>
        <select name="categoryNo" required style="width:100%;">
            <% for (Category c : categoryList) { %>
                <option value="<%= c.getCategoryNo() %>" <%= (c.getCategoryNo() == product.getCategoryNo()) ? "selected" : "" %>>
                    <%= c.getCategoryName() %>
                </option>
            <% } %>
        </select><br><br>

        <button type="submit">수정 완료</button>
    </form>
    <form method="post" action="product_delete_action.jsp" onsubmit="return confirm('정말 삭제하시겠습니까?');" style="margin-top: 10px;">
    <input type="hidden" name="productNo" value="<%= product.getProductNo() %>">
    <button type="submit" style="background-color: red; color: white;">상품 삭제</button>
</form>
</main>

<%@ include file="include_common_bottom.jsp" %>