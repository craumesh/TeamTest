package com.eatit.businessService;

import java.util.List;
import java.util.Map;

import com.eatit.businessDomain.ProductVO;
import com.eatit.businessDomain.OrdersVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.masterDataDomain.CompanyVO;
import com.eatit.memberDomain.MemberVO;

public interface OrdersService {

	public List<OrdersVO> getOrderList(Criteria cri) throws Exception; 

	public List<OrdersVO> findOrderList(Map<String, Object> params) throws Exception;
	
	public int getTotalCount() throws Exception;
	
	public int getFindCount(Map<String, Object> params) throws Exception;
	
	public MemberVO getMemberInfo(String id) throws Exception;
	
	public void addOrder(OrdersVO ovo) throws Exception; 

	public OrdersVO getOrderDetail(Integer order_id) throws Exception; 

	public List<CompanyVO> getCompanyList(Criteria cri) throws Exception;
	
	public int getTotalCompanyCount() throws Exception;
	
	public int getMatchingCompanyCount(Map<String, Object> params) throws Exception;
	
	public List<CompanyVO> findCompany(Map<String, Object> params) throws Exception;
	
	public CompanyVO selectCompany(int company_no) throws Exception;
	
	public int getTotalProductCount();
	
	public int getMatchingProductCount(Map<String, Object> params);
	
	public List<ProductVO> getProductList(Criteria cri); 
	
	public List<ProductVO> findProduct(Map<String, Object> params) throws Exception;
	
	public ProductVO selectProduct(Integer product_no) throws Exception;
	
	public int editForm(OrdersVO ovo) throws Exception;

	public int cancelForm(int order_id) throws Exception;

}
