package com.eatit.memberPersistence;

import java.util.List;

import com.eatit.memberDomain.MemberVO;

public interface HumanResourceDAO {
	public List<MemberVO> selectHrList();
	
	public MemberVO selectHrContent(MemberVO vo);
}
