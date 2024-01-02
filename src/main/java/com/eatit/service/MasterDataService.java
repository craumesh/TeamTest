package com.eatit.service;

import java.util.List;

import com.eatit.domain.ProductCriteria;
import com.eatit.domain.ProductVO;

public interface MasterDataService {
	
	public List<ProductVO> ProductList() throws Exception;
	
	
	
	public void productInsert(ProductVO pvo);
	
	public int productUpdate(ProductVO pvo)throws Exception;
	
	public void productDelete(int product_no,String product_code) throws Exception;



	public List<ProductVO> productListPage(ProductCriteria cri)throws Exception;



	public int totalProductCount() throws Exception;



	public List<ProductVO> searchProducts(String keyword)throws Exception;



	

}
