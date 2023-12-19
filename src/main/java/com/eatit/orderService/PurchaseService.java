package com.eatit.orderService;

import com.eatit.orderDomain.PurchaseVO;

public interface PurchaseService {

	public void createPurchaseOrder(PurchaseVO pvo) throws Exception;

}
