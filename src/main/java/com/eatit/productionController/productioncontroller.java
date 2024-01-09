package com.eatit.productionController;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eatit.machineDomain.machineVO;
import com.eatit.machineService.machineservice;
import com.eatit.mainDomain.Criteria;
import com.eatit.mainDomain.PageVO;
import com.eatit.productionService.productionservice;

@Controller
@RequestMapping(value = "/production/*")
public class productioncontroller {

	
	private static final Logger logger = LoggerFactory.getLogger(productioncontroller.class);
	
	@Inject
	private productionservice pdService;
	
	@Inject
	private machineservice mcService;
	
	// http://localhost:8088/production/production
	@RequestMapping(value = "/production", method = RequestMethod.GET)
	public void productionGET(Model model, Criteria cri) {
		logger.debug("pdService.machinelistall() : " + pdService.machinelistall(cri));
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(pdService.machinetotalCount());
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("listUrl", "production");
		model.addAttribute("machinelist",pdService.machinelistall(cri));
		
		
	}
	
	@RequestMapping(value = "/request", method = RequestMethod.GET)
	public void proGET() {
		logger.debug("requestGET() 페이지 이동");
	}
	
	
	@RequestMapping(value = "/status", method = RequestMethod.GET)
	public void statusGET(@RequestParam("code") int code, Model model) {
		logger.debug("code : " +code);
		logger.debug("mcService.productstatus(code) : " + mcService.productstatus(code));
		logger.debug("mcService.machineinfo(code) : " + mcService.machineinfo(code));
		
		model.addAttribute("infolist",mcService.machineinfo(code));
		model.addAttribute("status",mcService.productstatus(code));
		
		logger.debug("statusGET() 페이지 이동");
	}
	
	@RequestMapping(value = "/productioninfo", method = RequestMethod.GET)
	public void productioninfo(@RequestParam("machine_code") int machineCode, Model model) {
	    machineVO status = mcService.productstatus(machineCode);
	    logger.debug("status : " +status);
	    model.addAttribute("status", status);

	}
	
	
	
}
