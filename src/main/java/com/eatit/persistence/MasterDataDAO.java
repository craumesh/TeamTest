package com.eatit.persistence;

import java.util.List;

import com.eatit.domain.ProductCriteria;
import com.eatit.domain.ProductVO;

public interface MasterDataDAO {
  public List<ProductVO> getProductList() throws Exception;
  
  public void productInsert(ProductVO pvo);
  
  public int productUpdate(ProductVO pvo)throws Exception;
  
  public void deleteProduct(int product_no,String product_code) throws Exception;

  public List<ProductVO> getProductListPage(int page) throws Exception;
  public List<ProductVO> getProductListPage(ProductCriteria cri) throws Exception;
  
  public int getProductCount() throws Exception;

public List<ProductVO> searchProducts(String keyword) throws Exception;

public List<ProductVO> getMIMList()throws Exception;

public void MIMInsert(ProductVO pvo)throws Exception;

public int MIMUpdate(ProductVO pvo)throws Exception;

public void deleteMIM(int product_no)throws Exception;
}

