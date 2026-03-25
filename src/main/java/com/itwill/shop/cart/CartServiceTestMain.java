package com.itwill.shop.cart;

import org.apache.ibatis.io.Resources;

import java.io.InputStream;
import java.util.List;

public class CartServiceTestMain {

    public static void main(String[] args) throws Exception {
        CartService cartService = new CartService();
        InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
        System.out.println("XML 읽힘 여부: " + (in != null));
        /*
        String testMemberId = "bird1";
        int productNo = 1;
        int cartQty = 2;

        // 1. 최초 장바구니 추가 (insertCart)
        int result1 = cartService.insertCart(testMemberId, productNo, cartQty);
        System.out.println("insertCart 결과: " + result1);

        // 2. 동일한 상품을 다시 추가 (updateCartAddQty)
        int result2 = cartService.insertCart(testMemberId, productNo, 3);
        System.out.println("updateCartAddQty 결과: " + result2);

        // 3. 결과 확인 (목록 출력)
        System.out.println("장바구니 전체 조회");
        List<Cart> cartList = cartService.getCartListLogic(testMemberId);
        for (Cart cart : cartList) {
            System.out.println(cart);
        }

        // 4. 장바구니 수정 (updateCartByCartNo)
        int updateCount = cartService.updateCartByCartNo(1, 5);
        System.out.println("수량 수정 완료: " + updateCount);

        // 5. 장바구니 번호에 따른 삭제
        int deleteCount = cartService.deleteCartItem(1);
        System.out.println("장바구니 삭제 완료: " + deleteCount);

        // 6. 회원 전체 장바구니 삭제
        int clearCount = cartService.clearCart("bird1");
        System.out.println("장바구니 비우기 완료: " + clearCount);
*/

        }
    }

