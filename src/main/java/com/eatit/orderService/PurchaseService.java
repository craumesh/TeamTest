package com.eatit.orderService;

import java.util.List;

import com.eatit.masterDataDomain.CompanyVO;
import com.eatit.memberDomain.MemberVO;
import com.eatit.orderDomain.ProductVO;
import com.eatit.orderDomain.PurchaseVO;

public interface PurchaseService {

	public void createPurchaseOrder(PurchaseVO pvo) throws Exception;

	public List<PurchaseVO> orderList() throws Exception;

	public PurchaseVO getOrderDetail(int order_id) throws Exception;

	public int editForm(PurchaseVO pvo) throws Exception;

	public int cancelForm(int order_id) throws Exception;

	public List<ProductVO> productList() throws Exception;

	public List<ProductVO> searchProduct(String query) throws Exception;

	public MemberVO getMemberInfo(String id) throws Exception;

	public List<CompanyVO> getCompanyList() throws Exception;

	public List<CompanyVO> searchCompany(String query) throws Exception;

	public CompanyVO selectCompany(int company_no) throws Exception;

	public ProductVO findProduct(Integer product_no) throws Exception;

}
