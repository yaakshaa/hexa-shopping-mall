package com.itwill.shop.cart;

import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CartMapper {

    //장바구니 제품 존재여부
    @Select("SELECT count(*) AS product_count FROM cart WHERE member_id = #{memberId} AND product_no = #{productNo}")
    int countByProductNo(@Param("memberId") String memberId, @Param("productNo") int productNo);

    //장바구니 항목 추가
    @Insert("INSERT INTO cart (cart_no, cart_qty, member_id, product_no) VALUES (cart_cart_no_SEQ.nextval, #{cartQty}, #{memberId}, #{productNo})")
    int insertCart(@Param("memberId") String memberId, @Param("cartQty") int cartQty, @Param("productNo") int productNo) throws Exception;

    //수량 증가(기존 항목 존재)
    @Update("UPDATE cart SET cart_qty = cart_qty + #{cartQty} WHERE member_id = #{memberId} AND product_no = #{productNo}")
    int updateCartAddQty(@Param("memberId") String memberId,
                     @Param("productNo")int productNo,
                     @Param("cartQty") int cartQty) throws Exception;

    //수량 수정(장바구니 번호 기준)
    @Update("UPDATE cart SET cart_qty = #{cartQty} WHERE cart_no = #{cartNo}")
    int updateCartByCartNo(@Param("cartNo") int cartNo, @Param("cartQty") int cartQty) throws Exception;

    //장바구니 번호 기준 삭제
    @Delete("DELETE FROM cart WHERE cart_no = #{cartNo}")
    int deleteCartByCartNo(@Param("cartNo") int cartNo) throws Exception;

    //회원 아이디 기준 전체 삭제
    @Delete("DELETE FROM cart WHERE member_id = #{memberId}")
    int deleteCartByMemberId(@Param("memberId") String memberId) throws Exception;

    //회원 아이디로 장바구니 조회 for ui
    List<Cart> findCartByMemberId(@Param("memberId") String memberId) throws Exception;

    //회원 아이디로 장바구니 조회 for logic
    List<Cart> findCartByMemberIdForLogic(@Param("memberId") String memberId) throws Exception;

    //장바구니 번호로 상품번호 조회(추후 상품 상세보기 이용)
    @Select("SELECT product_no FROM cart WHERE cart_no = #{cartNo}")
    int findProductNoByCartNo(@Param("cartNo") int cartNo) throws Exception;



}
