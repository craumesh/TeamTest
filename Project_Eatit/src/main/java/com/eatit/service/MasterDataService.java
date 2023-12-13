package com.eatit.service;

import java.util.List;

import com.eatit.domain.ProductVO;

public interface MasterDataService {
	
	public List<ProductVO> ProductList();
	
	public void productInsert(ProductVO pvo);

}
