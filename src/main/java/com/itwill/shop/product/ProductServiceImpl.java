package com.itwill.shop.product;

import java.util.List;

public class ProductServiceImpl implements ProductService {

    private ProductDao productDao;

    // ✅ 내부에서 직접 DAO 생성 (SqlSessionFactory 포함)
    public ProductServiceImpl() {
        try {
            this.productDao = new ProductDaoImplMyBatis();
        } catch (Exception e) {
            e.printStackTrace(); // 최소한의 예외 처리
        }
    }

    @Override
    public int insertProduct(Product product) throws Exception {
        return productDao.insertProduct(product);
    }

    @Override
    public int updateProduct(Product product) throws Exception {
        return productDao.updateProduct(product);
    }

    @Override
    public int deleteProduct(int productNo) throws Exception {
        return productDao.deleteProduct(productNo);
    }

    @Override
    public Product findByPrimaryKey(int productNo) throws Exception {
        return productDao.findByPrimaryKey(productNo);
    }

    @Override
    public List<Product> findAll() throws Exception {
        return productDao.findAll();
    }

    @Override
    public List<Product> findByName(String keyword) throws Exception {
        return productDao.findByName(keyword);
    }

    @Override
    public List<Product> findByCategory(int categoryNo) throws Exception {
        return productDao.findByCategory(categoryNo);
    }

    @Override
    public List<Product> findLimit(int count) throws Exception {
        return productDao.findLimit(count);
    }
    
    @Override
    public int modifyStock(int productNo, int newStock) throws Exception {
        return productDao.modifyStock(productNo, newStock);
    }

    
}
