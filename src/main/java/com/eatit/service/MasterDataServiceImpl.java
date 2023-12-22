package com.eatit.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.eatit.domain.ProductVO;
import com.eatit.persistence.MasterDataDAO;

import java.util.List;

import javax.inject.Inject;

@Service
public class MasterDataServiceImpl implements MasterDataService {
 
	private static final Logger logger = LoggerFactory.getLogger(MasterDataServiceImpl.class);
	
	@Inject
	private MasterDataDAO mddao;
	
	
	@Override
	public List<ProductVO> ProductList() {
		logger.debug("ProductList()");
		return mddao.getProductList();
	}


	@Override
	public void productInsert(ProductVO pvo) {
		
		mddao.productInsert(pvo);
		
		
	}


	@Override
	public int productUpdate(ProductVO pvo)throws Exception {
		logger.debug("S:productUpdate(ProductVO pvo)");
		return mddao.productUpdate(pvo);
		
	}
   
}
