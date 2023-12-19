package com.eatit.orderService;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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
	
}
