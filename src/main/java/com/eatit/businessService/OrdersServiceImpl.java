package com.eatit.businessService;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.eatit.businessDomain.ProductVO;
import com.eatit.businessDomain.OrdersVO;
import com.eatit.businessPersistence.OrdersDAO;
import com.eatit.mainDomain.Criteria;
import com.eatit.masterDataDomain.CompanyVO;
import com.eatit.memberDomain.MemberVO;

@Service
public class OrdersServiceImpl implements OrdersService {
	
	private static final Logger logger = LoggerFactory.getLogger(OrdersServiceImpl.class);

	@Inject
	private OrdersDAO odao;
	
	@Override
	public List<OrdersVO> getOrderList(Criteria cri) throws Exception {
		logger.debug("Service: getOrderList(cri)");
		return odao.selectOrderList(cri);
	}
	
	@Override
	public List<OrdersVO> findOrderList(Map<String, Object> params) throws Exception {
		logger.debug("Service: findOrderList(params)");
		return odao.findOrderList(params);
	}

	@Override
	public int getTotalCount() throws Exception {
		logger.debug("Service: getTotalCount()");
		return odao.getTotalCount();
	}
	
	@Override
	public int getFindCount(Map<String, Object> params) throws Exception {
		logger.debug("Service: getFindCount(params)");
		return odao.getFindCount(params);
	}

	@Override
	public MemberVO getMemberInfo(String id) throws Exception {
		logger.debug("Service: getMemberInfo(id)");
		return odao.selectMember(id);
	}
	
	@Override
	public void addOrder(OrdersVO ovo) throws Exception {
		logger.debug("Service: addOrder(ovo)");
		odao.insertOrder(ovo);
	} 

	@Override
	public OrdersVO getOrderDetail(Integer order_id) throws Exception {
		logger.debug("Service: getOrderDetail(int order_id)");
		return odao.selectOrderDetail(order_id);
	} 
	
	@Override
	public List<CompanyVO> getCompanyList() throws Exception {
		logger.debug("Service: getCompanyList()");
		return odao.selectCompanyList();
	}
	
	@Override
	public List<CompanyVO> findCompany(String query) throws Exception {
		logger.debug("Service: findCompany(query)");
		return odao.findCompany(query);
	}
	
	@Override
	public CompanyVO selectCompany(int company_no) throws Exception {
		logger.debug("Service: sselectCompany(company_no)");
		return odao.selectCompany(company_no);
	}
	
	@Override
	public List<ProductVO> getProductList() throws Exception {
		logger.debug("Service: getProductList()");
		return odao.selectProductList();
	}

	@Override
	public List<ProductVO> findProduct(String query) throws Exception {
		logger.debug("Service: findProduct(query)");
		return odao.findProduct(query);
	} 
	
	@Override
	public ProductVO selectProduct(Integer product_no) throws Exception {
		logger.debug("Service: selectProduct(product_no)");
		return odao.selectProduct(product_no);
	} 
	
	@Override
	public int editForm(OrdersVO pvo) throws Exception {
		logger.debug("Service: editForm(PurchaseVO pvo)");
		return odao.updateForm(pvo);
	}

	@Override
	public int cancelForm(int order_id) throws Exception {
		logger.debug("Service: cancelForm(int order_id)");
		return odao.deleteForm(order_id);	
	}

	@Override
	public List<OrdersVO> selectproduct(Criteria cri) {
		logger.debug("Service: selectproduct");
		return odao.selectproduct(cri);
	}

	@Override
	public int selectproductcount() {
		logger.debug("Service: selectproductcount");
		return odao.selectproductcount();
	}

	
	
}
