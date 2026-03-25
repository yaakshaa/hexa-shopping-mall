package com.itwill.shop.product;

import java.util.List;

public interface ProductService {

    /*
     * 상품 등록
     */
    int insertProduct(Product product) throws Exception;

    /*
     * 상품 수정
     */
    int updateProduct(Product product) throws Exception;

    /*
     * 상품 삭제
     */
    int deleteProduct(int productNo) throws Exception;

    /*
     * 상품 번호로 검색 (상세 조회)
     */
    Product findByPrimaryKey(int productNo) throws Exception;

    /*
     * 전체 상품 리스트 조회
     */
    List<Product> findAll() throws Exception;

    /*
     * 상품 이름으로 검색
     */
    List<Product> findByName(String keyword) throws Exception;

    /*
     * 카테고리별 상품 조회
     */
    List<Product> findByCategory(int categoryNo) throws Exception;
    
    /*
     * 5개 조회
     */
    List<Product> findLimit(int count) throws Exception;

    /*
     * 상품 재고
     */
    int modifyStock(int productNo, int newStock) throws Exception;


}
