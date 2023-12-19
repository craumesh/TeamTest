package com.eatit.humanResourceController;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eatit.humanResourceDomain.HumanResourceVO;
import com.eatit.humanResourceService.HumanResourceService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/hr/*")
public class HumanResourceController {	
	private static final Logger logger = LoggerFactory.getLogger(HumanResourceController.class);
	
	@Inject
	HumanResourceService hrService;

	// http://localhost:8088/hr/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void hrListGET(Model model) {
		logger.debug("/hr/list 호출 -> hrListGET() 실행");
		model.addAttribute("list",hrService.getHrList());
	}
	
	@RequestMapping(value = "/content", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String hrContentGET(HumanResourceVO vo, Model model) {
		logger.debug("/hr/content 호출 -> hrContentGET() 실행");
		logger.debug("vo : "+vo);
		logger.debug("hrService.getHrContent(vo) : "+hrService.getHrContent(vo));
		Gson gson = new Gson();
		String jsonString = gson.toJson(hrService.getHrContent(vo));
		return jsonString;		
	}
}
