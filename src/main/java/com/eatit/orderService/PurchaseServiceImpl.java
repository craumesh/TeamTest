package com.eatit.orderService;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.eatit.mainDomain.Criteria;
import com.eatit.masterDataDomain.CompanyVO;
import com.eatit.memberDomain.MemberVO;
import com.eatit.orderDomain.ProductVO;
import com.eatit.orderDomain.PurchaseVO;
import com.eatit.orderPersistence.PurchaseDAO;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseServiceImpl.class);

	@Inject
	private PurchaseDAO pdao;
	
	@Override
	public void createPurchaseOrder(PurchaseVO pvo) throws Exception {
		logger.debug("Service: createPurchaseOrder(PurchaseVO pvo)");
		pdao.insertPurchaseOrder(pvo);
	}

	@Override
	public List<PurchaseVO> orderList(Criteria cri) throws Exception {
		logger.debug("Service: orderList()");
		return pdao.getOrderList(cri);
	}

	@Override
	public PurchaseVO getOrderDetail(Integer order_id) throws Exception {
		logger.debug("Service: getOrderDetail(int order_id)");
		return pdao.getOrderDetail(order_id);
	}

	@Override
	public int editForm(PurchaseVO pvo) throws Exception {
		logger.debug("Service: editForm(PurchaseVO pvo)");
		return pdao.updateForm(pvo);
	}

	@Override
	public int cancelForm(int order_id) throws Exception {
		logger.debug("Service: cancelForm(int order_id)");
		return pdao.deleteForm(order_id);	
	}

	@Override
	public List<ProductVO> productList() throws Exception {
		logger.debug("Service: productList()");
		return pdao.getProductList();
	}

	@Override
	public List<ProductVO> searchProduct(String query) throws Exception {
		logger.debug("Service: searchProduct(String query)");
		return pdao.searchProduct(query);
	}

	@Override
	public MemberVO getMemberInfo(String id) throws Exception {
		logger.debug("Service: getMemberInfo(String id)");
		return pdao.readMember(id);
	}

	@Override
	public List<CompanyVO> getCompanyList() throws Exception {
		logger.debug("Service: getCompanyList()");
		return pdao.getCompanyList();
	}

	@Override
	public List<CompanyVO> searchCompany(String query) throws Exception {
		logger.debug("Service: searchCompany(String query)");
		return pdao.searchCompany(query);
	}

	@Override
	public CompanyVO selectCompany(int company_no) throws Exception {
		logger.debug("Service: sselectCompany(company_no)");
		return pdao.getCompanyInfo(company_no);
	}

	@Override
	public ProductVO findProduct(Integer product_no) throws Exception {
		logger.debug("Service: findProduct(product_no)");
		return pdao.selectProduct(product_no);
	}

	@Override
	public int getTotalCount() throws Exception {
		logger.debug("Service: getTotalCount()");
		return pdao.getTotalCount();
	}
	
}
