package com.eatit.orderController;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eatit.mainDomain.Criteria;
import com.eatit.mainDomain.PageVO;
import com.eatit.masterDataDomain.CompanyVO;
import com.eatit.memberDomain.MemberVO;
import com.eatit.orderDomain.ProductVO;
import com.eatit.orderDomain.PurchaseVO;
import com.eatit.orderService.PurchaseService;

@Controller
@RequestMapping(value = "/orders/*")
public class PurchaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	
	@Inject
	private PurchaseService pService;
	
	// 발주 신청 - GET
	@RequestMapping(value = "/orderForm", method = RequestMethod.GET)
	public void purchaseWriteFormGET(Model model, HttpSession session) throws Exception {
		
		logger.debug("Controller: /orders/writeForm/purchaseWriteFormGET()");
		logger.debug("/orders/writeForm.jsp 페이지 이동");
		
		// 로그인 정보 
		String id = (String)session.getAttribute("id");
		logger.debug("id: " + id);
		
		// 서비스 - , 회원정보 가져오기
		MemberVO memberVO = pService.getMemberInfo(id);
		logger.debug("memberVO: " + memberVO);
		
		// 데이터 전달
		model.addAttribute(memberVO);
	}
	
	// 발주 신청 - POST
	@RequestMapping(value = "/orderForm", method = RequestMethod.POST)
	public String purchaseWriteFormPOST(PurchaseVO pvo) throws Exception {
		
		logger.debug("Controller: /orders/writeForm/purchaseWriteFormPOST() 호출");
		
		// 전달 정보 저장, 확인
		logger.debug("pvo: " + pvo);
		
		// 서비스 - 신청서 작성 동작 호출(INSERT)
		pService.createPurchaseOrder(pvo);
		logger.debug("신청서 작성 완료");
		
		// 페이지 이동
		logger.debug("/orders/orderList 페이지 이동");
		return "redirect:/orders/list";
	}
	
	// 발주 내역 조회 - GET
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void orderListGET(Model model, Criteria cri) throws Exception {
		
		logger.debug("Controller: /orders/list/orderListGET() 호출");
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(pService.getTotalCount());
		
		// 서비스 - DB에서 저장된 신청 내역 가져오기(SELECT)
		List<PurchaseVO> purchaseVOList = pService.orderList(cri);
		logger.debug("orderList: " + purchaseVOList);
		
		// 데이터 전달
		model.addAttribute(purchaseVOList);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("listUrl", "list");
	}
	
	// 발주서 수정 - POST
	@RequestMapping(value = "/editForm", method = RequestMethod.POST)
	public String editFormPOST(PurchaseVO pvo, RedirectAttributes rttr) throws Exception {
		
		logger.debug("/orders/editFormPOST() 호출");
		
		// 수정할 정보 확인
		logger.debug("pvo: " + pvo);
		
		// 서비스 - 신청서 수정 동작 호출(UPDATE)
		pService.editForm(pvo);
		rttr.addFlashAttribute("result", "modifyOK");
		
		return "redirect:/orders/orderList";
	}
	
	// 발주서 삭제 - POST
	@RequestMapping(value = "/cancelForm", method = RequestMethod.POST)
	public String cancelFormPOST(@RequestParam("order_id")int order_id) throws Exception {
		
		logger.debug("/orders/cancelFormPOST() 호출");
		
		// 서비스 - 발주서 삭제 동작 호출(DELETE)
		pService.cancelForm(order_id);
		
		return "redirect:/orders/orderList";
	}
	
	// 상품 검색 - GET
	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public void searchProductGET(Model model, @RequestParam(name = "query", required = false) String query) throws Exception {
		
		// 리스트 - 기준 정보 상품 리스트 가져오기
		List<ProductVO> productVOList;
		
		if(query != null) {
			// 검색어가 입력되었을 때
			logger.debug("Controller: /orders/searchProductGET(query)");
			logger.debug("searchProduct?query.jsp");
			logger.debug("query: " + query);
			productVOList = pService.searchProduct(query);
		}else {
			// 검색어가 입력되지 않았을 때, 새로 창을 열었을 때
			logger.debug("Controller: /orders/searchProductGET()");
			logger.debug("searchProduct.jsp");
			productVOList = pService.productList();
		}
		
		logger.debug("productList: " + productVOList);
		
		// 데이터 전달
		model.addAttribute(productVOList);
	}
	
	// 상품 추가 - POST
	@RequestMapping(value = "/selectProduct", method = RequestMethod.POST)
	@ResponseBody
	public ProductVO selectProductPOST(@RequestParam(name = "product_no", required = false) Integer product_no) throws Exception {
		
		logger.debug("Controller: /orders/selectProductPOST(product_no)");
		
		// 서비스
		ProductVO productVO = pService.findProduct(product_no);
		logger.debug("productVO: " + productVO);
	
		return productVO;
	}
	
	// 거래처 검색 - GET
	@RequestMapping(value = "/searchCompany", method = RequestMethod.GET)
	public void searchCompanyGET(Model model, @RequestParam(name = "query", required = false) String query) throws Exception {
		
		// 리스트 - 기준 정보 거래처 리스트 가져오기
		List<CompanyVO> companyVOList;
		
		if(query != null) {
			// 검색어가 입력되었을 때
			logger.debug("Controller: /orders/searchProductGET(query)");
			logger.debug("searchProduct?query.jsp");
			logger.debug("query: " + query);
			companyVOList = pService.searchCompany(query);
		}else {
			// 검색어가 입력되지 않았을 때, 새로 창을 열었을 때
			logger.debug("Controller: /orders/searchProductGET()");
			logger.debug("searchProduct.jsp");
			companyVOList = pService.getCompanyList();
		}
		
		// 조회된 데이터 확인
		logger.debug("companyVOList: " + companyVOList);
		
		// 데이터 전달
		model.addAttribute(companyVOList);
	}
	
	// 거래처 선택 - POST
	@RequestMapping(value = "/selectCompany", method = RequestMethod.POST)
	@ResponseBody
	public CompanyVO selectCompanyPOST(@RequestParam(name = "company_no", required = false) Integer company_no) throws Exception {
		
		logger.debug("Controller: /orders/selectCompany(company_no)");
		logger.debug("company_no:" + company_no);
		
		// 데이터 저장
		CompanyVO companyVO = pService.selectCompany(company_no);
		
		return companyVO;
	}
	
	// 주문 내역 상세
	@RequestMapping(value = "/detail", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public PurchaseVO orderDetailGET(@RequestParam("order_id")Integer order_id) throws Exception {
		
		logger.debug("Controller: /orders/orderDetailGET(PurchaseVO)");
		
		return pService.getOrderDetail(order_id);
	}

}
