package com.eatit.controller.machine;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatit.service.machine.machine_service;



@Controller
@RequestMapping(value = "/machine/*")
public class machine_controller {

	
	private static final Logger logger = LoggerFactory.getLogger(machine_controller.class);
	
	@Inject
//	private machine_service mcService;
	
	
	
	
	// http://localhost:8088/machine/machine
	// 기계 정보
	@RequestMapping(value = "/machine", method = RequestMethod.GET)
	public void machineGET() {
		logger.debug("  machineGET()  호출 ");
		// 연결된 뷰페이지로 이동
		logger.debug("/views/machine/machine.jsp 페이지로 이동");
	}
	
	
	
	
	
	
}
