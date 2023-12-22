package com.eatit.memberService;

import java.util.List;

import com.eatit.mainDomain.Criteria;
import com.eatit.memberDomain.MemberVO;

public interface HumanResourceService {
	public List<MemberVO> getHrList(Criteria cri);
	
	public MemberVO getHrContent(MemberVO vo);
	
	public int getTotalCount();
}
