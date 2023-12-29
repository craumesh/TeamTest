package com.eatit.orderService;

import java.util.List;

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

}
