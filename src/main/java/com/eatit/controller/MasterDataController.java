package com.eatit.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eatit.domain.PageVO;
import com.eatit.domain.ProductCriteria;
import com.eatit.domain.ProductVO;
import com.eatit.service.MasterDataService;

@Controller
@RequestMapping(value="/masterdata/*")
public class MasterDataController {
   private static final Logger logger = LoggerFactory.getLogger(MasterDataController.class);
   
   @Inject
   private MasterDataService mdService;
   
   
// http://localhost:8088/masterdata/BomMain
   //BOM관리메인창가는컨트롤러
   @RequestMapping(value = "/BomMain",method = RequestMethod.GET)
	public void mainGET() {
		
	}
   //품목정보등록컨트롤러
   @RequestMapping(value = "/PIMinsert",method = RequestMethod.POST)
 	public String PIMPOST(ProductVO pvo) {
	   logger.debug("pvo"+pvo);
	   
	   
       mdService.productInsert(pvo);
       
       return "redirect:/masterdata/PIM";
 }
   //품목정보수정컨트롤러
   @RequestMapping(value="/masterdata/PIMedit",method = RequestMethod.POST)
   public String PIMedit(ProductVO pvo)throws Exception {
	   logger.debug("pvo"+pvo);
	   int result = mdService.productUpdate(pvo);
	   logger.debug("/update form ->updatePOST()");
	   
	   
	   
	   return "redirect:/masterdata/PIM";
   }
   
 //품목정보삭제컨트롤러
   @RequestMapping(value="/masterdata/PIMdelete",method = RequestMethod.POST)
   public String PIMdelete(@RequestParam("product_no") int product_no, @RequestParam("product_code") String product_code)throws Exception {
	   
	   mdService.productDelete(product_no,product_code);
	 		   
	   
	   return "redirect:/masterdata/PIM";
   }
   
   //PIM페이징처리
   @RequestMapping(value="/MdListPage",method=RequestMethod.GET)
   public String MdListPageGet(Model model,
			@ModelAttribute("result") String result,
			HttpSession session,
			ProductCriteria cri) throws Exception {
	   session.setAttribute("viewcntCheck", true);
	   
	 List<ProductVO> productList= mdService.productListPage(cri);
	 PageVO pageVO = new PageVO();
	 pageVO.setCri(cri);
	 pageVO.setTotalCount(mdService.totalProductCount());
	 model.addAttribute("pageVO", pageVO);
	 model.addAttribute("productList", productList);
	 return "/masterdata/PIM";
   }
   
   
// http://localhost:8088/masterdata/PIM
   //PIM 메인페이지 리스트
   @RequestMapping(value="/PIM",method=RequestMethod.GET)
   public String productListGET(Model model) throws Exception {
	   logger.debug(" /masterdata/PIM -> ProductListGet()");
	   List<ProductVO> productList = mdService.ProductList();
	   model.addAttribute("productList",productList );
	   return "/masterdata/PIM";
   }
   //CIM메인페이지리스트
   @RequestMapping(value="/CIM",method=RequestMethod.GET)
   public void consumtionListGET(Model model) {
	  
   }
   //MIM 메인페이지리스트
   @RequestMapping(value="/MIM",method=RequestMethod.GET)
   public String materialListGET(Model model) throws Exception {
	  List<ProductVO> productList = mdService.ProductList();
	  model.addAttribute("productList", productList);
	  return "/masterdata/MIM";
   }
   //QIM 메인페이지리스트
   @RequestMapping(value="/QIM",method=RequestMethod.GET)
   public void QualityListGET(Model model) {
	  
   }
   
// 검색 기능 추가
   @RequestMapping(value = "/masterdata/search", method = RequestMethod.GET)
   public String searchProducts(@RequestParam("keyword") String keyword, Model model) throws Exception {
       List<ProductVO> searchedProducts = mdService.searchProducts(keyword); // 특정 키워드를 가진 데이터를 검색하는 서비스 메서드 호출
       
       if (searchedProducts.isEmpty()) {
           // 검색 결과가 없을 때 처리하는 부분
           model.addAttribute("searchError", true); // 검색 오류 플래그를 모델에 추가
       } else {
           model.addAttribute("productList", searchedProducts); // 검색된 데이터를 productList에 추가하여 해당 페이지에 전달
       }

       return "/masterdata/PIM"; // 검색 결과가 표시된 페이지를 반환
   }
   
   
   
 
}
