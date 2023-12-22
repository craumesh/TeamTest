package com.eatit.persistence;

import java.util.List;

import javax.inject.Inject;


import com.eatit.domain.ProductVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
@Repository
public class MasterDataDAOImpl implements MasterDataDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(MasterDataDAOImpl.class);

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="com.eatit.mapper.MasterDataMapper";
	@Override
	public List<ProductVO> getProductList() {
		
		return sqlSession.selectList(NAMESPACE+".getProductList");
	}
	@Override
	public void productInsert(ProductVO pvo) {
		logger.debug(" mapper(DB) 殿废 贸府 备巩 角青 - 矫累");
		sqlSession.insert(NAMESPACE+".insertProduct",pvo);
		logger.debug(" mapper(DB) 殿废 贸府 备巩 角青 - 场");
		
	}
	@Override
	public int productUpdate(ProductVO pvo)throws Exception {
		logger.debug("DAO:updateProduct(ProductVO vo)");
		return sqlSession.update(NAMESPACE+".updateProduct", pvo);
		
	}

}
