package com.itwill.shop.category;

import java.util.List;

public class CategoryServiceTestMain {

    public static void main(String[] args) throws Exception {
        CategoryService categoryService = new CategoryService();

        // 1. 카테고리 추가(생성)
        Category newCategory = new Category();
        newCategory.setCategoryName("맨투맨");
        int insertResult = categoryService.insertCategory(newCategory);
        System.out.println("카테고리 추가: " + insertResult);

        // 2. 전체 카테고리 조회
        List<Category> categoryList = categoryService.categoryListByAsc();
        System.out.println("전체 카테고리:");
        for (Category category : categoryList) {
            System.out.println(category);
        }

        // 3. 특정 카테고리 번호로 조회
        Category foundCategory = categoryService.findByCategoryNo(7);
        System.out.println("조회된 카테고리: " + foundCategory);

        // 4. 카테고리 수정
        foundCategory.setCategoryName("조거팬츠");
        int updateResult = categoryService.updateCategory(foundCategory);
        System.out.println("수정 결과: " + updateResult);

        // 5. 카테고리 삭제
        int deleteResult = categoryService.deleteCategory(foundCategory.getCategoryNo());
        System.out.println("삭제 결과: " + deleteResult);


    }
}