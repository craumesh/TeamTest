package com.eatit.machineController;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatit.machineDomain.machineVO;
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
	public void machineGET() {
		logger.debug("  machineGET()  호출 ");
		// 연결된 뷰페이지로 이동
		logger.debug("/views/machine/machine.jsp 페이지로 이동");
	}
	
	@RequestMapping(value = "/machine", method = RequestMethod.POST)
	public String machinePOST(machineVO vo) {
		logger.debug("machinePOST() 호출");
		logger.debug("vo :" + vo);
		mcService.insertmachine(vo);
		logger.debug("/views/machine/machine.jsp 페이지로 이동");
		return "/machine/machine";
	}
	
	
	
	
	
}
