package com.eatit.memberService;

import java.util.List;

import com.eatit.memberDomain.MemberVO;

public interface HumanResourceService {
	public List<MemberVO> getHrList();
	
	public MemberVO getHrContent(MemberVO vo);
}
