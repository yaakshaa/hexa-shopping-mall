package com.itwill.shop.cart;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.util.List;


public class CartDaoImplMyBatis implements CartDao {
    private SqlSessionFactory sqlSessionFactory;


    public CartDaoImplMyBatis() throws Exception{
        this.sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis-config.xml"));
    }

    @Override
    public int countByProductNo(String memberId, int productNo) throws Exception{
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
        int count = cartMapper.countByProductNo(memberId, productNo);
        sqlSession.close();
        return count;
    }

    @Override
    public int insertCart(String memberId, int productNo, int cartQty) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
        int insertRowCount = cartMapper.insertCart(memberId, cartQty, productNo);
        sqlSession.close();
        return insertRowCount;
    }

    @Override
    public int updateCartAddQty(String memberId, int productNo, int cartQty) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
        int updateRowCount = cartMapper.updateCartAddQty(memberId, productNo, cartQty);
        sqlSession.close();
        return updateRowCount;
    }

    @Override
    public int updateCartByCartNo(int cartNo, int cartQty) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
        int updateRowCount = cartMapper.updateCartByCartNo(cartNo, cartQty);
        sqlSession.close();
        return updateRowCount;
    }

    @Override
    public int deleteCartByCartNo(int cartNo) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
        int deleteRowCount = cartMapper.deleteCartByCartNo(cartNo);
        sqlSession.close();
        return deleteRowCount;
    }

    @Override
    public int deleteCartByMemberId(String memberId) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
        int deleteRowCount = cartMapper.deleteCartByMemberId(memberId);
        sqlSession.close();
        return deleteRowCount;
    }

    @Override
    public List<Cart> findCartByMemberId(String memberId) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
        List<Cart> cartList = cartMapper.findCartByMemberId(memberId);
        sqlSession.close();
        return cartList;
    }

    @Override
    public List<Cart> findCartByMemberIdForLogic(String memberId) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
        List<Cart> cartList = cartMapper.findCartByMemberIdForLogic(memberId);
        sqlSession.close();
        return cartList;
    }

    @Override
    public int findProductNoByCartNo(int cartNo) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
        int productNo = cartMapper.findProductNoByCartNo(cartNo);
        sqlSession.close();
        return productNo;
    }

}
