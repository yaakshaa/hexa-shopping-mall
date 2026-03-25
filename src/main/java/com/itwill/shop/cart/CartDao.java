package com.itwill.shop.cart;

import java.util.List;

public interface CartDao {

    //cart 제품 존재여부
    int countByProductNo(String memberId, int productNo) throws Exception;

    //장바구니 항목 추가
    int insertCart(String memberId, int productNo, int cartQty) throws Exception;

    //회원 아이디 + 상품번호로 수량 증가
    int updateCartAddQty(String memberId, int productNo, int cartQty) throws Exception;

    //장바구니 항목 수량 변경
    int updateCartByCartNo(int cartNo, int cartQty) throws Exception;

    //장바구니 번호 기준 삭제
    int deleteCartByCartNo(int cartNo) throws Exception;

    //회원 아이디 기준 전체 삭제
    int deleteCartByMemberId(String memberId) throws Exception;

    //회원 장바구니 목록 조회 for UI
    List<Cart> findCartByMemberId(String memberId) throws Exception;

    //회원 장바구니 조회 for Logic
    List<Cart> findCartByMemberIdForLogic(String memberId) throws Exception;

    //장바구니 번호 기준 상품 번호 조회(추후 상품 상세보기에 사용)
    int findProductNoByCartNo(int cartNo) throws Exception;
}
