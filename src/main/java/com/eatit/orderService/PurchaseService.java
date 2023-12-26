package com.eatit.orderService;

import java.util.List;

import com.eatit.orderDomain.PurchaseVO;

public interface PurchaseService {

	public void createPurchaseOrder(PurchaseVO pvo) throws Exception;

	public List<PurchaseVO> orderList() throws Exception;

	public PurchaseVO getOrderDetail(int order_id) throws Exception;

	public int editForm(PurchaseVO pvo) throws Exception;

}
