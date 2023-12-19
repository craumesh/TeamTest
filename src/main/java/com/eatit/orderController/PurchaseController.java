package com.eatit.orderController;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatit.orderDomain.PurchaseVO;
import com.eatit.orderService.PurchaseService;

@Controller
@RequestMapping(value = "/purchase/*")
public class PurchaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	
	@Inject
	private PurchaseService pService;
	
	// 발주 신청 - GET
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public void purchaseWriteFormGET() throws Exception {
		
		logger.debug("/purchase/writeForm/purchaseWriteFormGET() 호출");
		logger.debug("/purchase/writeForm.jsp 페이지 이동");
		
	}
	
	// 발주 신청 - POST
	@RequestMapping(value = "/writeForm", method = RequestMethod.POST)
	public String purchaseWriteFormPOST(PurchaseVO pvo) throws Exception {
		
		logger.debug("/purchase/writeForm/purchaseWriteFormPOST() 호출");
		
		// 전달 정보 저장, 확인
		logger.debug("pvo: " + pvo);
		
		// 서비스 - 신청서 작성(INSERT) 동작 호출
		pService.createPurchaseOrder(pvo);
		
		return "";
	}
}
