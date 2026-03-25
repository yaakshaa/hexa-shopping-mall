package com.itwill.shop.product;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ProductDaoImplMyBatis implements ProductDao {

    private SqlSessionFactory sqlSessionFactory;

    public ProductDaoImplMyBatis() throws Exception {
        this.sqlSessionFactory = new SqlSessionFactoryBuilder()
            .build(Resources.getResourceAsStream("mybatis-config.xml"));
    }

    @Override
    public int insertProduct(Product product) throws Exception {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
            return mapper.insertProduct(product);
        }
    }

    @Override
    public int updateProduct(Product product) throws Exception {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
            return mapper.updateProduct(product);
        }
    }

    @Override
    public int deleteProduct(int productNo) throws Exception {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
            return mapper.deleteProduct(productNo);
        }
    }

    @Override
    public Product findByPrimaryKey(int productNo) throws Exception {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
            return mapper.findByPrimaryKey(productNo);
        }
    }

    @Override
    public List<Product> findAll() throws Exception {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
            return mapper.findAll();
        }
    }

    @Override
    public List<Product> findByName(String keyword) throws Exception {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
            return mapper.findByName(keyword);
        }
    }

    @Override
    public List<Product> findByCategory(int categoryNo) throws Exception {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
            return mapper.findByCategory(categoryNo);
        }
    }

    @Override
    public List<Product> findLimit(int count) throws Exception {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
            return mapper.findLimit(count);
        }
    }
    
    @Override
    public int modifyStock(int productNo, int newStock) throws Exception {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
            return mapper.modifyStock(productNo, newStock);
        }
    }
    
}
