package com.eatit.businessPersistence;

import java.util.List;
import java.util.Map;

import com.eatit.businessDomain.ProductVO;
import com.eatit.businessDomain.OrdersVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.masterDataDomain.CompanyVO;
import com.eatit.memberDomain.MemberVO;

public interface OrdersDAO {

	public List<OrdersVO> selectOrderList(Criteria cri) throws Exception;

	public List<OrdersVO> findOrderList(Map<String, Object> params) throws Exception;
	
	public int getTotalCount() throws Exception;
	
	public int getFindCount(Map<String, Object> params) throws Exception;
	
	public MemberVO selectMember(String id) throws Exception;
	
	public void insertOrder(OrdersVO ovo) throws Exception; 

	public OrdersVO selectOrderDetail(Integer order_id) throws Exception; 

	public List<CompanyVO> selectCompanyList() throws Exception;
	
	public List<CompanyVO> findCompany(String query) throws Exception;
	
	public CompanyVO selectCompany(Integer company_no) throws Exception;
	
	public List<ProductVO> selectProductList() throws Exception;
	
	public List<ProductVO> findProduct(String query) throws Exception;
	
	public ProductVO selectProduct(Integer product_no) throws Exception; 
	
	public int updateForm(OrdersVO ovo) throws Exception;

	public int deleteForm(Integer order_id) throws Exception;

}
