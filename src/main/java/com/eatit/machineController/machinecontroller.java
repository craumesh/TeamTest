package com.eatit.machineController;

import java.sql.Date;
import java.sql.Timestamp;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eatit.machineDomain.machineVO;
import com.eatit.machineDomain.machinehistoryVO;
import com.eatit.machineService.machineservice;



@Controller
@RequestMapping(value = "/machine/*")
public class machinecontroller {

	
	private static final Logger logger = LoggerFactory.getLogger(machinecontroller.class);
	
	@Inject
	private machineservice mcService;
	
	
	
	 
	// http://localhost:8088/machine/machine
	// 기계 정보
	@RequestMapping(value = "/machine", method = RequestMethod.GET)
	public void machineGET(Model model) {
		logger.debug("  machineGET()  호출 ");
		
		model.addAttribute("machinelist",mcService.machinelist());
		
		// 연결된 뷰페이지로 이동
		logger.debug("/views/machine/machine.jsp 페이지로 이동");
	}
	
	@RequestMapping(value = "/machine", method = RequestMethod.POST)
	public String machinePOST(machineVO vo, machinehistoryVO vo1,@RequestParam("installation_date") Date date) {
		logger.debug("machinePOST() 호출");
		logger.debug("vo :" + vo);
		logger.debug("vo1 : " + vo1);
		
		logger.debug("넘겨받은 날짜 클래스 : " +  date.getClass());
		logger.debug("넘겨받은 날짜 값: " +  date.toString());
		
		vo.setInstallation_date(date);
		
		/* vo.setInstallation_date(new Timestamp(System.currentTimeMillis())); */
		mcService.insertmachine(vo);
		
		다시 불러오고
		불러온 값을
		사용해서 설비에 연결
		
		vo1.set
		
		mcService.machinehistory(vo1);
		logger.debug("/views/machine/machine.jsp 페이지로 이동");
		return "redirect:/machine/machine";
	}
	
	/*
	 * @RequestMapping(value = "/machineinfo", method = RequestMethod.GET, produces
	 * = "application/json;charset=UTF-8" )
	 * 
	 * @ResponseBody public machineVO machineinfoGET(machineVO vo, Model model) {
	 * logger.debug("machineinfoGET 실행"); logger.debug("vo : " + vo);
	 * 
	 * return ""; }
	 */
	
	
	
	
	
}
