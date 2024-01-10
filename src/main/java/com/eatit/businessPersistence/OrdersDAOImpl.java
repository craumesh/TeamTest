package com.eatit.businessPersistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.eatit.businessDomain.ProductVO;
import com.eatit.businessDomain.OrdersVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.masterDataDomain.CompanyVO;
import com.eatit.memberDomain.MemberVO;

@Repository
public class OrdersDAOImpl implements OrdersDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(OrdersDAOImpl.class);
	
	private static final String NAMESPACE = "com.eatit.mapper.OrdersMapper";

	@Inject
	private SqlSession SqlSession;
	
	@Override
	public List<OrdersVO> selectOrderList(Criteria cri) throws Exception {
		logger.debug("DAO: selectOrderList(cri)");
		return SqlSession.selectList(NAMESPACE + ".selectOrderlist", cri);
	}
	
	@Override
	public List<OrdersVO> findOrderList(Map<String, Object> params) throws Exception {
		logger.debug("DAO: findOrderList(params)");
		return SqlSession.selectList(NAMESPACE + ".findOrderList", params);
	}

	@Override
	public int getTotalCount() throws Exception {
		logger.debug("DAO: getTotalCount()");
		return SqlSession.selectOne(NAMESPACE + ".totalCount");
	}
	
	@Override
	public int getFindCount(Map<String, Object> params) throws Exception {
		logger.debug("DAO: getFindCount(params)");
		return SqlSession.selectOne(NAMESPACE + ".findCount", params);
	}

	@Override
	public MemberVO selectMember(String id) throws Exception {
		logger.debug("DAO: selectMember(id)");
		return SqlSession.selectOne(NAMESPACE + ".selectMember", id);
	}
	
	@Override
	public void insertOrder(OrdersVO ovo) throws Exception {
		logger.debug("DAO: insertOrder(ovo)");
		SqlSession.insert(NAMESPACE + ".insertOrder", ovo);
	} 

	@Override
	public List<CompanyVO> selectCompanyList(Criteria cri) throws Exception {
		logger.debug("DAO: selectCompanyList(cri)");
		return SqlSession.selectList(NAMESPACE + ".selectCompanyList", cri);
	}
	
	@Override
	public int selectCountTotalCompany() throws Exception {
		logger.debug("DAO: selectTotalCompanyCount()");
		return SqlSession.selectOne(NAMESPACE + ".selectCountTotalCompany");
	}

	@Override
	public int selectCountMatchingCompany(Map<String, Object> params) throws Exception {
		logger.debug("DAO: selectCountMatchingCompany(params)");
		return SqlSession.selectOne(NAMESPACE + ".selectCountMatchingCompany", params);
	}

	@Override
	public List<CompanyVO> findCompany(Map<String, Object> params) throws Exception {
		logger.debug("DAO: findCompany(query)");
		return SqlSession.selectList(NAMESPACE + ".findCompany", params);
	}
	
	@Override
	public CompanyVO selectCompany(Integer company_no) throws Exception {
		logger.debug("DAO: selectCompany(company_no)");
		return SqlSession.selectOne(NAMESPACE + ".selectCompany", company_no);
	}
	
	@Override
	public List<ProductVO> selectProductList() throws Exception {
		logger.debug("DAO: getProductList()");
		return SqlSession.selectList(NAMESPACE + ".selectProductList");
	}

	@Override
	public List<ProductVO> findProduct(String query) throws Exception {
		logger.debug("DAO: findProduct(query)");
		return SqlSession.selectList(NAMESPACE + ".findProduct", query);
	} 
	
	@Override
	public ProductVO selectProduct(Integer product_no) throws Exception {
		logger.debug("DAO: selectProduct(product_no)");
		return SqlSession.selectOne(NAMESPACE + ".selectProduct", product_no);
	} 
	
	@Override
	public OrdersVO selectOrderDetail(Integer order_id) throws Exception {
		logger.debug("DAO: selectOrderDetail(order_id)");
		return SqlSession.selectOne(NAMESPACE + ".selectOrderDetail", order_id);
	}

	@Override
	public int updateForm(OrdersVO ovo) throws Exception {
		logger.debug("DAO: updateForm(PurchaseVO ovo)");
		return SqlSession.update(NAMESPACE + ".updateForm", ovo);
	}
	@Override
	public int deleteForm(Integer order_id) throws Exception {
		logger.debug("DAO: deleteForm(int order_id)");
		return SqlSession.update(NAMESPACE + ".deleteForm", order_id);
	}

}
