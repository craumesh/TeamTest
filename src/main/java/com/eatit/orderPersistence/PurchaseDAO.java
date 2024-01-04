package com.eatit.orderPersistence;

import java.util.List;

import com.eatit.masterDataDomain.CompanyVO;
import com.eatit.memberDomain.MemberVO;
import com.eatit.orderDomain.CartVO;
import com.eatit.orderDomain.ProductVO;
import com.eatit.orderDomain.PurchaseVO;

public interface PurchaseDAO {

	public void insertPurchaseOrder(PurchaseVO pvo) throws Exception;

	public List<PurchaseVO> getOrderList() throws Exception;

	public PurchaseVO getOrderDetail(int order_id) throws Exception;

	public int updateForm(PurchaseVO pvo) throws Exception;

	public int deleteForm(int order_id) throws Exception;

	public List<ProductVO> getProductList() throws Exception;

	public List<ProductVO> searchProduct(String query) throws Exception;

	public void addCart(CartVO cpvo) throws Exception;

	public List<CartVO> getCartList(String id) throws Exception;

	public MemberVO readMember(String id) throws Exception;

	public List<CompanyVO> getCompanyList() throws Exception;

	public List<CompanyVO> searchCompany(String query) throws Exception;

}
