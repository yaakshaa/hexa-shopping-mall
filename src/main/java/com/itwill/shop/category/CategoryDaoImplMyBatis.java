package com.itwill.shop.category;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.util.List;

public class CategoryDaoImplMyBatis implements CategoryDao {
    private SqlSessionFactory sqlSessionFactory;

    public CategoryDaoImplMyBatis() throws Exception{
        this.sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis-config.xml"));
    }

    @Override
    public int insertCategory(Category category) throws Exception{
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        int insertRowCount = categoryMapper.insertCategory(category);
        sqlSession.close();
        return insertRowCount;
    }

    @Override
    public int updateCategory(Category category) throws Exception{
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        int updateRowCount = categoryMapper.updateCategory(category);
        sqlSession.close();
        return updateRowCount;
    }

    @Override
    public int deleteCategory(int categoryNo) throws Exception{
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        int deleteRowCount = categoryMapper.deleteCategory(categoryNo);
        sqlSession.close();
        return deleteRowCount;
    }

    @Override
    public Category findByCategoryNo(int categoryNo) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        Category category = categoryMapper.findByCategoryNo(categoryNo);
        sqlSession.close();
        return category;
    }

    @Override
    public List<Category> categoryListByAsc() throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        CategoryMapper categoryMapper = sqlSession.getMapper(CategoryMapper.class);
        List<Category> categoryList = categoryMapper.categoryListByAsc();
        sqlSession.close();
        return categoryList;
    }
}
