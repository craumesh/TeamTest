package com.eatit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.eatit.domain.ProductCriteria;
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
		logger.debug(" mapper(DB) 등록 처리 구문 실행 - 시작");
		sqlSession.insert(NAMESPACE+".insertProduct",pvo);
		
		 sqlSession.insert(NAMESPACE + ".insertRecipe", pvo);
		logger.debug(" mapper(DB) 등록 처리 구문 실행 - 끝");
		
	}
	@Override
	public int productUpdate(ProductVO pvo)throws Exception {
		logger.debug("DAO:updateProduct(ProductVO vo)");
		 int updatedProduct = sqlSession.update(NAMESPACE + ".updateProduct", pvo);

		    // recipe 테이블 업데이트
		    int updatedRecipe = sqlSession.update(NAMESPACE + ".updateRecipe", pvo);

		    // 두 쿼리의 결과를 합산하여 반환하거나 필요한 처리 수행
		    // 예를 들어, 두 쿼리 모두 성공해야만 성공으로 간주하는 경우에는 다음과 같이 처리 가능
		    if (updatedProduct > 0 && updatedRecipe > 0) {
		        return updatedProduct + updatedRecipe;
		    } else {
		        // 에러 처리 또는 실패 시 동작
		        return -1;
		    }
		
	}
	@Override
	public void deleteProduct(int product_no,String product_code) throws Exception {
		
		 // recipe 테이블에서 product_code를 참조하는 행을 먼저 삭제
	    sqlSession.delete(NAMESPACE + ".deleteRecipeByProductCode", product_code);

		sqlSession.delete(NAMESPACE+".deleteProduct",product_no);
		
	}
	@Override
	public List<ProductVO> getProductListPage(int page) throws Exception {
		page =(page-1) * 10;
		return sqlSession.selectList(NAMESPACE+".MdListPage",page);
	}
	@Override
	public List<ProductVO> getProductListPage(ProductCriteria cri) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".MdListPage",cri);
	}
	@Override
	public int getProductCount() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".countProduct");
	}
	@Override
	public List<ProductVO> searchProducts(String keyword) throws Exception {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("keyword", keyword);

	    return sqlSession.selectList(NAMESPACE + ".searchProducts", paramMap);
	}
	@Override
	public List<ProductVO> getMIMList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".getMIMList");
	}
	@Override
	public void MIMInsert(ProductVO pvo) throws Exception {
		
		sqlSession.insert(NAMESPACE+".insertMIM",pvo);
	}
	@Override
	public int MIMUpdate(ProductVO pvo) throws Exception {
	    
		  return sqlSession.update(NAMESPACE+".updateMIM",pvo);    		   
	}
	@Override
	public void deleteMIM(int product_no) throws Exception {
		
		sqlSession.delete(NAMESPACE+".deleteMIM",product_no);
	}
	
	

}
