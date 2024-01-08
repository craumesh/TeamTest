package com.eatit.masterdataController;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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

import com.eatit.machineDomain.machineVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.mainDomain.PageVO;
import com.eatit.masterdataDomain.MasterdataVO;
import com.eatit.masterdataService.MasterDataService;

@Controller
@RequestMapping(value="/masterdata/*")
public class MasterDataController {
   private static final Logger logger = LoggerFactory.getLogger(MasterDataController.class);
   
   @Inject
   private MasterDataService mdService;
   
   
// http://localhost:8088/masterdata/BomMain
   //BOM��������â������Ʈ�ѷ�
   @RequestMapping(value = "/BomMain",method = RequestMethod.GET)
	public void mainGET() {
		
	}
   //ǰ�����������Ʈ�ѷ�
   @RequestMapping(value = "/PIMinsert",method = RequestMethod.POST)
 	public String PIMPOST(MasterdataVO pvo) {
	   logger.debug("pvo"+pvo);
	   
	   
       mdService.productInsert(pvo);
       
       
       return "redirect:/masterdata/PIM";
 }
   
   @RequestMapping(value = "/QIMinsert",method = RequestMethod.POST)
	public String QIMPOST(MasterdataVO pvo) {
	   logger.debug("pvo"+pvo);
	   
	   
      mdService.QIMInsert(pvo);
      
      
      return "redirect:/masterdata/QIM";
}
   
   
   //���������������Ʈ�ѷ�
   @RequestMapping(value = "/MIMinsert",method = RequestMethod.POST)
 	public String MIMPOST(MasterdataVO pvo) throws Exception {
	   logger.debug("pvo"+pvo);
	   
	   
       mdService.MIMInsert(pvo);
       
       return "redirect:/masterdata/MIM";
 }
   
   @RequestMapping(value = "/FIMinsert",method = RequestMethod.POST)
	public String FIMPOST(machineVO mvo) throws Exception {
	   logger.debug("mvo"+mvo);
	   
	   
      mdService.FIMInsert(mvo);
      
      return "redirect:/masterdata/FIM";
}
   
   
   //ǰ������������Ʈ�ѷ�
   @RequestMapping(value="/masterdata/PIMedit",method = RequestMethod.POST)
   public String PIMedit(MasterdataVO pvo)throws Exception {
	   logger.debug("pvo"+pvo);
	   int result = mdService.productUpdate(pvo);
	   logger.debug("/update form ->updatePOST()");
	   
	   
	   
	   return "redirect:/masterdata/PIM";
   }
 //����������������Ʈ�ѷ�
   @RequestMapping(value="/masterdata/MIMedit",method = RequestMethod.POST)
   public String MIMedit(MasterdataVO pvo)throws Exception {
	   logger.debug("pvo"+pvo);
	   int result = mdService.MIMUpdate(pvo);
	   logger.debug("/update form ->updatePOST()");
	   
	   
	   
	   return "redirect:/masterdata/MIM";
   }
   
   @RequestMapping(value="/masterdata/FIMedit",method = RequestMethod.POST)
   public String FIMedit(machineVO mvo)throws Exception {
	   logger.debug("mvo"+mvo);
	   int result = mdService.FIMUpdate(mvo);
	   logger.debug("/update form ->updatePOST()");
	   
	   
	   
	   return "redirect:/masterdata/FIM";
   }
   
   
   
 //ǰ������������Ʈ�ѷ�
   @RequestMapping(value="/masterdata/PIMdelete",method = RequestMethod.POST)
   public String PIMdelete(@RequestParam("product_no") int product_no, @RequestParam("product_code") String product_code)throws Exception {
	   
	   mdService.productDelete(product_no,product_code);
	 		   
	   
	   return "redirect:/masterdata/PIM";
   }
   
   @RequestMapping(value="/masterdata/QIMdelete",method = RequestMethod.POST)
   public String QIMdelete(@RequestParam("product_code") String product_code, @RequestParam("quality_no") int quality_no)throws Exception {
	   
	   mdService.QIMDelete(quality_no,product_code);
	 		   
	   
	   return "redirect:/masterdata/QIM";
   }
   
   
   
   @RequestMapping(value="/masterdata/PIMAlldelete",method = RequestMethod.POST)
   public String PIMAlldelete(@RequestParam("product_no") int product_no, @RequestParam("product_code") String product_code)throws Exception {
	   
	   mdService.productAllDelete(product_no,product_code);
	 		   
	   
	   return "redirect:/masterdata/PIM";
   }
   
   
 //����������������Ʈ�ѷ�
   @RequestMapping(value="/masterdata/MIMdelete",method = RequestMethod.POST)
   public String MIMdelete(@RequestParam("product_no") int product_no)throws Exception {
	   
	   mdService.MIMDelete(product_no);
	 		   
	   
	   return "redirect:/masterdata/MIM";
   }
   
   @RequestMapping(value="/masterdata/FIMdelete",method = RequestMethod.POST)
   public String FIMdelete(@RequestParam("machine_code") int machine_code)throws Exception {
	   
	   mdService.FIMDelete(machine_code);
	 		   
	   
	   return "redirect:/masterdata/FIM";
   }
   
   
   
   //PIM����¡ó��
   @RequestMapping(value="/PIM", method=RequestMethod.GET)
   public String MdListPageGet(Model model, HttpSession session, Criteria cri) throws Exception {
       session.setAttribute("viewcntCheck", true);
       
       // 페이지별 제품 목록 가져오기
       List<MasterdataVO> productList = mdService.productListPage(cri);
       
       // 총 제품 수 설정
       int totalProductCount = mdService.totalProductCount();
       
       // PageVO 객체 생성 및 설정
       PageVO pageVO = new PageVO();
       pageVO.setCri(cri);
       pageVO.setTotalCount(totalProductCount);
       
       // 페이지 블록당 10개의 페이지 설정
       pageVO.setDisplayPageNum(10);
       
       model.addAttribute("pageVO", pageVO);
       model.addAttribute("productList", productList);
       
       return "/masterdata/PIM";
   }
   
   @RequestMapping(value="/QIM", method=RequestMethod.GET)
   public String QIMListPageGet(Model model, HttpSession session, Criteria cri) throws Exception {
       session.setAttribute("viewcntCheck", true);
       
       // 페이지별 제품 목록 가져오기
       List<MasterdataVO> QIMList = mdService.QIMListPage(cri);
       List<MasterdataVO> categoryList = mdService.categoryList();
       
       // 총 제품 수 설정
       int totalQIMCount = mdService.totalQIMCount();
       
       // PageVO 객체 생성 및 설정
       PageVO pageVO = new PageVO();
       pageVO.setCri(cri);
       pageVO.setTotalCount(totalQIMCount);
       
       // 페이지 블록당 10개의 페이지 설정
       
       model.addAttribute("categoryList", categoryList);
       pageVO.setDisplayPageNum(10);
       model.addAttribute("QIMList", QIMList);
       
       model.addAttribute("pageVO", pageVO);
       
       
       return "/masterdata/QIM";
   }
   
   
 //MIM ��������������Ʈ
   @RequestMapping(value="/MIM",method=RequestMethod.GET)
   public String materialListGET(Model model,HttpSession session,Criteria cri) throws Exception {
session.setAttribute("viewcntCheck", true);
       
       // 페이지별 제품 목록 가져오기
       List<MasterdataVO> MIMList = mdService.MIMListPage(cri);
       
       // 총 제품 수 설정
       int totalMIMCount = mdService.getMIMCount();
       
       // PageVO 객체 생성 및 설정
       PageVO pageVO = new PageVO();
       pageVO.setCri(cri);
       pageVO.setTotalCount(totalMIMCount);
       
       // 페이지 블록당 10개의 페이지 설정
       pageVO.setDisplayPageNum(10);
       
       model.addAttribute("pageVO", pageVO);
       model.addAttribute("MIMList",MIMList);
       
	  return "/masterdata/MIM";
   }
   
   @RequestMapping(value="/FIM", method=RequestMethod.GET)
   public String FIMListPageGet(Model model, HttpSession session, Criteria cri) throws Exception {
       session.setAttribute("viewcntCheck", true);
       
       // 페이지별 제품 목록 가져오기
       List<MasterdataVO> FIMList = mdService.FIMListPage(cri);
       
       // 총 제품 수 설정
       int totalFIMCount = mdService.totalFIMCount();
       
       // PageVO 객체 생성 및 설정
       PageVO pageVO = new PageVO();
       pageVO.setCri(cri);
       pageVO.setTotalCount(totalFIMCount);
       
       // 페이지 블록당 10개의 페이지 설정
       pageVO.setDisplayPageNum(10);
       
       model.addAttribute("pageVO", pageVO);
       model.addAttribute("FIMList", FIMList);
       
       return "/masterdata/FIM";
   }
   
   
   
//// http://localhost:8088/masterdata/PIM
//   //PIM ���������� ����Ʈ
//   @RequestMapping(value="/PIM",method=RequestMethod.GET)
//   public String productListGET(Model model) throws Exception {
//	   logger.debug(" /masterdata/PIM -> ProductListGet()");
//	   List<MasterdataVO> productList = mdService.ProductList();
//	   model.addAttribute("productList",productList );
//	   return "/masterdata/PIM";
//   }
   @RequestMapping(value="/CIM", method=RequestMethod.GET)
   public String CIMListPageGet(Model model, HttpSession session, Criteria cri) throws Exception {
       session.setAttribute("viewcntCheck", true);
       
       // 페이지별 제품 목록 가져오기
       List<MasterdataVO> CIMList = mdService.CIMListPage(cri);
       
       // 총 제품 수 설정
       int totalProductCount = mdService.totalProductCount();
       
       // PageVO 객체 생성 및 설정
       PageVO pageVO = new PageVO();
       pageVO.setCri(cri);
       pageVO.setTotalCount(totalProductCount);
       
       // 페이지 블록당 10개의 페이지 설정
       pageVO.setDisplayPageNum(10);
       
       model.addAttribute("pageVO", pageVO);
       model.addAttribute("CIMList", CIMList);
       
       return "/masterdata/CIM";
   }
   
   
   
   
   
   @RequestMapping(value = "/masterdata/search", method = RequestMethod.GET)
   public String searchProducts(@RequestParam("keyword") String keyword, Model model, Criteria cri, HttpServletRequest request) throws Exception {
       List<MasterdataVO> searchedProducts = mdService.searchProducts(keyword);
       
       if (searchedProducts.isEmpty()) {
           model.addAttribute("searchError", true);
       } else {
           model.addAttribute("productList", searchedProducts);
           // 검색 후에 referer를 저장
           String referer = request.getHeader("Referer");
           model.addAttribute("referer", referer);
       }

       com.eatit.mainDomain.PageVO pageVO = new com.eatit.mainDomain.PageVO();
       pageVO.setCri(cri);
       pageVO.setTotalCount(mdService.searchProductCount());
       model.addAttribute("pageVO", pageVO);

       return "/masterdata/PIM";
   }
   
   @RequestMapping(value = "/masterdata/MIMsearch", method = RequestMethod.GET)
   public String searchMIM(@RequestParam("keyword") String keyword, Model model,Criteria cri,HttpServletRequest request) throws Exception {
       List<MasterdataVO> searchMIM = mdService.searchMIM(keyword); 
       
       if (searchMIM.isEmpty()) {
           
           model.addAttribute("searchError", true); 
       } else {
           model.addAttribute("MIMList", searchMIM); 
           String referer = request.getHeader("Referer");
           model.addAttribute("referer", referer);
       }

      
  	 com.eatit.mainDomain.PageVO pageVO = new com.eatit.mainDomain.PageVO();
  	 pageVO.setCri(cri);
  	 pageVO.setTotalCount(mdService.searchMIMCount());
  	 model.addAttribute("pageVO", pageVO);
  	
       
       
       return "/masterdata/MIM"; 
   }
   
   @RequestMapping(value = "/masterdata/FIMsearch", method = RequestMethod.GET)
   public String searchFIM(@RequestParam("keyword") String keyword, Model model,Criteria cri,HttpServletRequest request) throws Exception {
       List<MasterdataVO> searchFIM = mdService.searchFIM(keyword); 
       
       if (searchFIM.isEmpty()) {
           
           model.addAttribute("searchError", true); 
       } else {
           model.addAttribute("FIMList", searchFIM); 
           String referer = request.getHeader("Referer");
           model.addAttribute("referer", referer);
       }

      
  	 com.eatit.mainDomain.PageVO pageVO = new com.eatit.mainDomain.PageVO();
  	 pageVO.setCri(cri);
  	 pageVO.setTotalCount(mdService.searchFIMCount());
  	 model.addAttribute("pageVO", pageVO);
  	
       
       
       return "/masterdata/FIM"; 
   }
   
   @RequestMapping(value = "/masterdata/QIMsearch", method = RequestMethod.GET)
   public String searchQIM(@RequestParam("keyword") String keyword, Model model,Criteria cri,HttpServletRequest request) throws Exception {
       List<MasterdataVO> searchQIM = mdService.searchQIM(keyword); 
       
       if (searchQIM.isEmpty()) {
           
           model.addAttribute("searchError", true); 
       } else {
           model.addAttribute("QIMList", searchQIM); 
           String referer = request.getHeader("Referer");
           model.addAttribute("referer", referer);
       }

      
  	 com.eatit.mainDomain.PageVO pageVO = new com.eatit.mainDomain.PageVO();
  	 pageVO.setCri(cri);
  	 pageVO.setTotalCount(mdService.searchQIMCount());
  	 model.addAttribute("pageVO", pageVO);
  	
       
       
       return "/masterdata/QIM"; 
   }
   
   
   
 
}
