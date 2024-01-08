package com.eatit.businessPersistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.eatit.businessDomain.ProductVO;
import com.eatit.businessDomain.PurchaseVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.masterDataDomain.CompanyVO;
import com.eatit.memberDomain.MemberVO;

@Repository
public class PurchaseDAOImpl implements PurchaseDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseDAOImpl.class);
	
	private static final String NAMESPACE = "com.eatit.mapper.PurchaseMapper";

	@Inject
	private SqlSession SqlSession;
	
	@Override
	public void insertPurchaseOrder(PurchaseVO pvo) throws Exception {
		logger.debug("DAO: insertPurchaseOrder(PurchaseVO pvo)");
		SqlSession.insert(NAMESPACE + ".insertForm", pvo);
	}

	@Override
	public List<PurchaseVO> getOrderList(Criteria cri) throws Exception {
		logger.debug("DAO: getOrderList()");
		return SqlSession.selectList(NAMESPACE + ".list", cri);
	}

	@Override
	public PurchaseVO getOrderDetail(Integer order_id) throws Exception {
		logger.debug("DAO: getOrderDetail(order_id)");
		return SqlSession.selectOne(NAMESPACE + ".selectOrder", order_id);
	}

	@Override
	public int updateForm(PurchaseVO pvo) throws Exception {
		logger.debug("DAO: updateForm(PurchaseVO pvo)");
		return SqlSession.update(NAMESPACE + ".updateForm", pvo);
	}
	@Override
	public int deleteForm(int order_id) throws Exception {
		logger.debug("DAO: deleteForm(int order_id)");
		return SqlSession.update(NAMESPACE + ".deleteForm", order_id);
	}

	@Override
	public List<ProductVO> getProductList() throws Exception {
		logger.debug("DAO: getProductList()");
		return SqlSession.selectList(NAMESPACE + ".productList");
	}

	@Override
	public List<ProductVO> searchProduct(String query) throws Exception {
		logger.debug("DAO: searchProduct(String query)");
		return SqlSession.selectList(NAMESPACE + ".searchProduct", query);
	}

	@Override
	public MemberVO readMember(String id) throws Exception {
		logger.debug("DAO: readMember(String id)");
		return SqlSession.selectOne(NAMESPACE + ".readMember", id);
	}

	@Override
	public List<CompanyVO> getCompanyList() throws Exception {
		logger.debug("DAO: getCompanyList()");
		return SqlSession.selectList(NAMESPACE + ".getCompanyList");
	}

	@Override
	public List<CompanyVO> searchCompany(String query) throws Exception {
		logger.debug("DAO: searchCompany(String query)");
		return SqlSession.selectList(NAMESPACE + ".searchCompany", query);
	}

	@Override
	public CompanyVO getCompanyInfo(int company_no) throws Exception {
		logger.debug("DAO: getCompanyInfo(company_no)");
		return SqlSession.selectOne(NAMESPACE + ".getCompanyInfo", company_no);
	}

	@Override
	public ProductVO selectProduct(Integer product_no) throws Exception {
		logger.debug("DAO: selectProduct(product_no)");
		return SqlSession.selectOne(NAMESPACE + ".selectProduct", product_no);
	}

	@Override
	public int getTotalCount() throws Exception {
		logger.debug("DAO: getTotalCount()");
		return SqlSession.selectOne(NAMESPACE + ".totalCount");
	}
	
}
