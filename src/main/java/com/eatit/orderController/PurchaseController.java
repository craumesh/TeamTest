package com.eatit.orderController;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		
		// 서비스 - 신청서 작성 동작 호출(INSERT)
		pService.createPurchaseOrder(pvo);
		logger.debug("신청서 작성 완료");
		
		// 페이지 이동
		logger.debug("/purchase/orderList 페이지 이동");
		return "redirect:/purchase/orderList";
	}
	
	// 발주 내역 조회 - GET
	@RequestMapping(value = "orderList", method = RequestMethod.GET)
	public String orderListGET(Model model, @ModelAttribute("result") String result, HttpSession session) throws Exception {
		
		logger.debug("orderListGET() 호출");
		
		session.setAttribute("viewcntCheck", true);
		
		// 서비스 - DB에서 저장된 신청 내역 가져오기(SELECT)
		List<PurchaseVO> purchaseVOList = pService.orderList();
		logger.debug("orderList: " + purchaseVOList);
		
		// 데이터 전달
		model.addAttribute(purchaseVOList);
		
		return "/purchase/orderList";
	}
	
}
