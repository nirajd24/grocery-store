package org.ecommerce.grocerystore.dao;

import org.ecommerce.grocerystore.entity.Product;
import org.ecommerce.grocerystore.model.PaginationResult;
import org.ecommerce.grocerystore.model.ProductInfo;

public interface ProductDAO {

   
   
    public Product findProduct(String code);
   
    public ProductInfo findProductInfo(String code) ;
 
   
    public PaginationResult<ProductInfo> queryProducts(int page,
                       int maxResult, int maxNavigationPage  );
   
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult,
                       int maxNavigationPage, String likeName);

    public void save(ProductInfo productInfo);
   
}
