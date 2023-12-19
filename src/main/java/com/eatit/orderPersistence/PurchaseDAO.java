package com.eatit.orderPersistence;

import com.eatit.orderDomain.PurchaseVO;

public interface PurchaseDAO {

	public void insertPurchaseOrder(PurchaseVO pvo) throws Exception;

}
