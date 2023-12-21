package com.eatit.orderService;

import java.util.List;

import com.eatit.orderDomain.PurchaseVO;

public interface PurchaseService {

	public void createPurchaseOrder(PurchaseVO pvo) throws Exception;

	public List<PurchaseVO> orderList() throws Exception;

}
