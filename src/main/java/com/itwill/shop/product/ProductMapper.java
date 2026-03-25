package com.itwill.shop.product;

import org.apache.ibatis.annotations.*;
import java.util.List;

public interface ProductMapper {

    // 상품 등록
    @Insert("""
        INSERT INTO product
        (product_no, product_name, product_price, product_stock, product_desc, product_img, category_no)
        VALUES
        (product_product_no_SEQ.nextval, #{productName}, #{productPrice}, #{productStock},
         #{productDesc}, #{productImg}, #{categoryNo})
    """)
    int insertProduct(Product product);

    // 상품 수정
    @Update("""
        UPDATE product
        SET
        product_name = #{productName},
        product_price = #{productPrice},
        product_stock = #{productStock},
        product_desc = #{productDesc},
        product_img = #{productImg},
        category_no = #{categoryNo}
        WHERE product_no = #{productNo}
    """)
    int updateProduct(Product product);

    // 상품 삭제
    @Delete("DELETE FROM product WHERE product_no = #{productNo}")
    int deleteProduct(@Param("productNo") int productNo);

    // 상품 번호로 검색 (상세 조회)
    @Select("""
        SELECT product_no, product_name, product_price, product_stock,
               product_desc, product_img, category_no
        FROM product
        WHERE product_no = #{productNo}
    """)
    Product findByPrimaryKey(@Param("productNo") int productNo);

    // 전체 상품 조회
    @Select("""
        SELECT product_no, product_name, product_price, product_stock,
               product_desc, product_img, category_no
        FROM product
        ORDER BY product_no DESC
    """)
    List<Product> findAll();

    // 상품 이름으로 검색
    @Select("""
        SELECT product_no, product_name, product_price, product_stock,
               product_desc, product_img, category_no
        FROM product
        WHERE product_name LIKE '%' || #{keyword} || '%'
        ORDER BY product_no DESC
    """)
    List<Product> findByName(@Param("keyword") String keyword);

    // 카테고리 번호로 상품 조회
    @Select("""
        SELECT product_no, product_name, product_price, product_stock,
               product_desc, product_img, category_no
        FROM product
        WHERE category_no = #{categoryNo}
        ORDER BY product_no DESC
    """)
    List<Product> findByCategory(@Param("categoryNo") int categoryNo);

    // 상품 5개만 조회
    @Select("""
        SELECT *
        FROM (
            SELECT * FROM product ORDER BY product_no DESC
        )
        WHERE ROWNUM <= #{count}
    """)
    List<Product> findLimit(@Param("count") int count);
    
    // 재고 업데이트 메소드
    @Update("UPDATE product SET product_stock = #{stock} WHERE product_no = #{no}")
    int modifyStock(@Param("no") int productNo, @Param("stock") int stock);
} 
