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
import com.eatit.masterdataDomain.MasterdataVO;

@Controller
@RequestMapping(value = "/masterdata/*")
public class MasterdataController {
	private static final Logger logger = LoggerFactory.getLogger(MasterdataController.class);
	
	@Inject
	MasterdataService mdService;
	
	//http://localhost:8088/masterdata/list
	// 창고메인
	@GetMapping(value = "/list")
	public void masterDataMainGET(Model model) {
		logger.debug("C - masterdataMainGET() 호출");
		// ID 세션값 저장 확인
//		logger.debug("no : "+no);
		
		// 서비스 - 창고 리스트 가져오기
		List<MasterdataVO> masterDataListMain = mdService.masterdataListAll();
		logger.debug("@_@"+masterDataListMain);
//		
//		// 서비스 - 회원 리스트 가져오기
//		List<MemberVO> memberList = mdService.memberListAll();
////		logger.debug("@_@"+memberList);
//		
//		// 서비스 - 직책 정보 가져오기
//		List<String> positionName = mdService.memberGetPositionName();
////		logger.debug("@_@"+positionName);
		
		// 데이터를 연결된 뷰페이지로 전달
		model.addAttribute("masterdataListMain", masterDataListMain);
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
//	// 창고등록
//	@RequestMapping(value = "/masterdataRegist", method = RequestMethod.GET)
//	public void masterDataModifyGET(@SessionAttribute("no") int no,Model model) {
//		logger.debug("C - masterdataModifyGET()");
//		logger.debug("no : "+ no);
//		
//		// 서비스 - 창고 등록 할 때 등록페이지에 로그인한 회원 정보 가져오기
//		MemberVO masterDataInfo = mdService.masterdataInfo(no);
//		logger.debug("@_@"+masterDataInfo);
//		// 데이터를 연결된 뷰페이지로 전달
//		model.addAttribute("masterdataAdminInfo", masterDataInfo);
//	}
//	
//	@RequestMapping(value = "/masterdataRegist", method = RequestMethod.POST)
//	public String masterdataModifyPOST(MasterdataVO vo, RedirectAttributes rttr ) {
//		logger.debug("C - masterdataModifyPOST()");
//		logger.debug("vo : "+vo);
//		
//		// 서비스 - 창고 등록
//		mdService.masterDataRegist(vo);
//		
//		// 메시지 전달
////		rttr.addFlashAttribute("result", "registOK");
//		
//		return "redirect:/masterdata/registClose";
//	}
//	
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
//	// 등록 후 창닫기 전용 페이지
//	@GetMapping(value = "/registClose")
//	public void registClose() {
//		logger.debug("C - registClose()");
//	}
//	
//	
//	//http://localhost:8088/masterdata/masterdataStockMain
//	// 창고 재고 페이지
//	@RequestMapping(value = "/masterdataStockMain", method = RequestMethod.GET)
//	public void masterdataStockMainGET() {
//		logger.debug("C - masterdataStockMainGET()");
//	}
}
