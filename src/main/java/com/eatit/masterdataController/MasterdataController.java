package com.eatit.masterdataController;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eatit.masterdataService.MasterdataService;
import com.eatit.memberDomain.MemberVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.mainDomain.PageVO;
import com.eatit.masterdataDomain.MasterdataVO;

@Controller
@RequestMapping(value = "/md/*")
public class MasterdataController {
	private static final Logger logger = LoggerFactory.getLogger(MasterdataController.class);
	
	@Inject
	MasterdataService mdService;
	
	// http://localhost:8088/md/product/list
	// 품목리스트
	@RequestMapping(value = "/product/list", method = RequestMethod.GET)
	public void productListGET(Model model, Criteria cri) {
		logger.debug("C - productListGET() 호출");
		// ID 세션값 저장 확인
//		logger.debug("no : "+no);
		
		// 서비스 - 창고 리스트 가져오기
		PageVO pageVO = new PageVO();
		cri.setPageSize(5);
		pageVO.setCri(cri);
		pageVO.setTotalCount(mdService.getTotalCount());

//		// 서비스 - 회원 리스트 가져오기
//		List<MemberVO> memberList = mdService.memberListAll();
////		logger.debug("@_@"+memberList);
//		
//		// 서비스 - 직책 정보 가져오기
//		List<String> positionName = mdService.memberGetPositionName();
////		logger.debug("@_@"+positionName);
		
		// 데이터를 연결된 뷰페이지로 전달
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("listUrl", "product/list");
		model.addAttribute("productList", mdService.productListAll(cri));
//		model.addAttribute("memberList", memberList);
//		model.addAttribute("positionName", positionName);
	}
	
//	// 창고 모달창에서 정보 수정
//   @RequestMapping(value = "/updateDetailInfo", method = RequestMethod.POST)
//   public String updateDetailInfo(MasterdataVO vo) {
//      logger.debug("/masterdata/updateDetailInfo 호출 -> updateDetailInfo() 실행");
////      logger.debug("vo : "+vo);
//      
//      // 정보 수정
//      mdService.masterDataUpdate(vo);
//      
//      return "redirect:/masterdata/masterdataMain";
//   }
//	
	// 품목등록
	@RequestMapping(value = "/product/regist", method = RequestMethod.GET)
	public void productRegistGET(Model model) {
		logger.debug("C - productRegistGET()1234");
		List<MasterdataVO> list = mdService.companyListAll();
		logger.debug("list : "+list);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value = "/product/regist", method = RequestMethod.POST)
	public String productRegistPOST(MasterdataVO vo, RedirectAttributes rttr ) {
		logger.debug("C - productRegistPOST()");
		logger.debug("vo : "+vo);
		logger.debug("mdService.getCategoryMaxProductCode(vo).getCode() : "+mdService.getCategoryMaxProductCode(vo).getCode());
		logger.debug("mdService.getCategoryDetailMaxProductCode(vo).getCode() : "+mdService.getCategoryDetailMaxProductCode(vo).getCode());
		
		int categoryNum = categoryNumExtract(mdService.getCategoryMaxProductCode(vo).getCode().substring(1))+1;
		int categoryDetailNum = categoryDetailNumExtract(mdService.getCategoryDetailMaxProductCode(vo).getCode())+1;
		
		if(vo.getPhoto_paths().isEmpty()) {
			vo.setPhoto_paths(null);
		}
		
		logger.debug("categoryNum : "+categoryNum);
		logger.debug("categoryDetailNum : "+categoryDetailNum);
		
		String convertedCode[] = categoryConvertCode(vo).split(",");
		vo.setCode(convertedCode[0]+categoryNum+convertedCode[1]+categoryDetailNum);
		
		logger.debug("vo.getCode() : "+vo.getCode());		
		
		mdService.productRegist(vo);
		
		// 메시지 전달
//		rttr.addFlashAttribute("result", "registOK");
		
		return "redirect:/md/product/registClose";
	}

	@RequestMapping(value = "/category/list", method = RequestMethod.GET)
	public void categoryListGET() {
		logger.debug("C - categoryListGET()");
	}
	
//	// 창고삭제
//	@RequestMapping(value = "/deletemasterdata", method = RequestMethod.POST)
//	public String deletemasterdataPOST(@RequestParam("chk") int[] masterdata_no) {
//		logger.debug("C - deletemasterdataPOST()");
//		logger.debug("vo : "+masterdata_no);
//		
//		// 서비스 - 창고 삭제
//		mdService.deleteMasterData(masterdata_no);
//		
//		return "redirect:/masterdata/masterdataMain";
//	}
//	
	// 등록 후 창닫기 전용 페이지
	@RequestMapping(value = "/product/registClose", method = RequestMethod.GET)
	public void registClose() {
		logger.debug("C - registClose()");
	}
//	
//	
//	//http://localhost:8088/masterdata/masterdataStockMain
//	// 창고 재고 페이지
//	@RequestMapping(value = "/masterdataStockMain", method = RequestMethod.GET)
//	public void masterdataStockMainGET() {
//		logger.debug("C - masterdataStockMainGET()");
//	}
	
	private int categoryNumExtract(String inputStr) {
        StringBuilder number = new StringBuilder();

        for (char c : inputStr.toCharArray()) {
            if (Character.isDigit(c)) {
                number.append(c);
            } else if (number.length() > 0) {
                break;
            }
        }

        return Integer.parseInt(number.toString());
    }
	
	private int categoryDetailNumExtract(String inputStr) {
		StringBuilder number = new StringBuilder();
		
		for (int i = inputStr.length() - 1; i >= 0; i--) {
            char c = inputStr.charAt(i);
            if (Character.isDigit(c)) {
                number.append(c);
            } else {
                break;
            }
        }
		
		return Integer.parseInt(number.toString());
	}
	
	private String categoryConvertCode(MasterdataVO vo) {
		String covertedCode="";
		
		switch(vo.getCategory()) {
		case "자재":covertedCode="M,";
			switch(vo.getCategory_detail()) {
			case "원자재":covertedCode+="O"; break;
			case "부자재":covertedCode+="S"; 
			}
			break;
		case "완제품":covertedCode="F,";
			switch(vo.getCategory_detail()) {
			case "쿠키":covertedCode+="K"; break;
			case "케이크":covertedCode+="C"; break;
			case "마카롱":covertedCode+="L"; 
			}
		}
		return covertedCode;
	}
}
