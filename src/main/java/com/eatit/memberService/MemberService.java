package com.eatit.memberService;

import com.eatit.memberDomain.MemberVO;

public interface MemberService {
	//로그인 처리 동작
	public MemberVO memberLogin(MemberVO vo);
}
