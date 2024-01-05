package com.eatit.productionController;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatit.machineDomain.machineVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.mainDomain.PageVO;
import com.eatit.productionService.productionservice;

@Controller
@RequestMapping(value = "/production/*")
public class productioncontroller {

	
	private static final Logger logger = LoggerFactory.getLogger(productioncontroller.class);
	
	@Inject
	private productionservice pdService;
	
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
	
	@RequestMapping(value = "/orderform", method = RequestMethod.GET)
	public void orderform(Model model,Criteria cri) {
		logger.debug("orderform() 새창 열기");
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(pdService.formtotalCount());
		
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("orderlist", pdService.formorderlist(cri));
		model.addAttribute("listUrl", "orderform");
		
	}
	
	
	
	
}
