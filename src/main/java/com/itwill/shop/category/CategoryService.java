package com.itwill.shop.category;

import java.util.List;

public class CategoryService {
    private CategoryDao categoryDao;

    public CategoryService() throws Exception{
        categoryDao = new CategoryDaoImplMyBatis(); //의존성 주입(MyBatis 구현체)
    }

    //카테고리 추가(생성)
    public int insertCategory(Category category) throws Exception{
        return categoryDao.insertCategory(category);
    }

    //카테고리 수정
    public int updateCategory(Category category) throws Exception{
        return categoryDao.updateCategory(category);
    }

    //카테고리 삭제
    public int deleteCategory(int categoryNo) throws Exception{
        return categoryDao.deleteCategory(categoryNo);
    }

    //카테고리 번호에 따른 조회
    public Category findByCategoryNo(int categoryNo) throws Exception{
        return categoryDao.findByCategoryNo(categoryNo);
    }

    //카테코고리 번호 올림차순 조회
    public List<Category> categoryListByAsc() throws Exception{
        return categoryDao.categoryListByAsc();
    }
}
