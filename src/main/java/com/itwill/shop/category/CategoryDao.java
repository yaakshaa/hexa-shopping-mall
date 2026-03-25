package com.itwill.shop.category;

import java.util.List;

public interface CategoryDao {

    //카테고리 생성
    int insertCategory(Category category) throws Exception;

    //카테고리 수정
    int updateCategory(Category category) throws Exception;

    //카테고리 삭제
    int deleteCategory(int categoryNo) throws Exception;

    //카테고리 번호에 따른 조회
    Category findByCategoryNo(int categoryNo) throws Exception;

    //카테고리 번호 올림차순 조회
    List<Category> categoryListByAsc() throws Exception;
}
