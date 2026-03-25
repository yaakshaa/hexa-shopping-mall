package com.itwill.shop.product;

import java.util.List;

public class ProductServiceTestMain {
    public static void main(String[] args) throws Exception {
        
        // ✅ 서비스 객체 한 줄로 생성
        ProductServiceImpl productService = new ProductServiceImpl();

        // 1. 전체 상품 조회
        System.out.println("=== 전체 상품 조회 ===");
        List<Product> productList = productService.findAll();
        for (Product product : productList) {
            System.out.println(product);
        }

        // 2. 상품 상세 조회
        System.out.println("=== 상품 상세 조회 ===");
        Product product = productService.findByPrimaryKey(1);
        System.out.println(product);

        // 3. 상품 이름으로 검색
        System.out.println("=== 상품 이름 검색 ===");
        List<Product> searchList = productService.findByName("셔츠");
        for (Product p : searchList) {
            System.out.println(p);
        }

        // 4. 카테고리별 조회
        System.out.println("=== 카테고리별 상품 조회 ===");
        List<Product> categoryList = productService.findByCategory(1);
        for (Product p : categoryList) {
            System.out.println(p);
        }
    }
}
