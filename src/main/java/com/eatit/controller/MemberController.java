package com.eatit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/members/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	// http://localhost:8088/members/memberLogin
	@RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
	public void memberLoginGET() throws Exception{
		logger.debug("/members/memberLogin 호출 -> memberLoginGET() 실행");
	}
}
