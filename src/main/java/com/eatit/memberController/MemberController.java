package com.eatit.memberController;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatit.memberDomain.MemberVO;
import com.eatit.memberService.MemberService;

@Controller
@RequestMapping(value = "/members/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 서비스 객체 주입
	@Inject
	private MemberService mService;
	
	// 로그인 - 정보 입력(GET)
	// http://localhost:8088/members/memberLogin
	@RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
	public void memberLoginGET() throws Exception{
		logger.debug("/members/memberLogin 호출 -> memberLoginGET() 실행");
	}
	
	// 로그인 - 정보 처리(POST)
	@RequestMapping(value="memberLogin", method = RequestMethod.POST)
	public String memberLoginPOST(MemberVO vo, HttpSession session) {
		logger.debug("/members/login.jsp post방식 호출 ");
		
		// 전달정보 저장
		logger.debug("전달정보 : "+vo);
		
		// 디비 접근
		MemberVO resultVO = mService.memberLogin(vo);
		
		if(resultVO != null) {
			// O => 메인페이지 호출(리다이렉트), 세션 아이디 정보 저장
			session.setAttribute("id", resultVO.getId());
			return "redirect:/";
		}else {
			// X => /members/memberLogin 페이지 호출
			return "redirect:/members/memberLogin";
		}
	}
}
