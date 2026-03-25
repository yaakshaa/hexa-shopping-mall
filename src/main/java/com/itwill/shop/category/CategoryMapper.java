package com.itwill.shop.category;

import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CategoryMapper {

    //카테고리 생성
    @Insert("INSERT INTO category VALUES(category_category_no_SEQ.nextval, #{categoryName})")
    int insertCategory(Category category) throws Exception ;

    //카테고리 수정
    @Update("UPDATE category SET category_name = #{categoryName} WHERE category_no = #{categoryNo}")
    int updateCategory(Category category) throws Exception;

    //카테고리 삭제
    @Delete("DELETE FROM category WHERE category_no = #{categoryNo}")
    int deleteCategory(@Param("categoryNo") int categoryNo) throws Exception;

    //카테고리 번호에 따른 조회
    @Select("SELECT * FROM category WHERE category_no = #{categoryNo}")
    Category findByCategoryNo(@Param("categoryNo") int categoryNo) throws Exception;

    //카테코고리 번호 올림차순 조회
    @Select("SELECT * FROM category ORDER BY category_no ASC")
    List<Category> categoryListByAsc() throws Exception;
}
