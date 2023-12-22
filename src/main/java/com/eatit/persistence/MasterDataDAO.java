package com.eatit.persistence;

import java.util.List;

import com.eatit.domain.ProductVO;

public interface MasterDataDAO {
  public List<ProductVO> getProductList();
  
  public void productInsert(ProductVO pvo);
  
  public int productUpdate(ProductVO pvo)throws Exception;
}

