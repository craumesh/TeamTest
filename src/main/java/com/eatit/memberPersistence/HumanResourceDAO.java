package com.eatit.memberPersistence;

import java.util.List;

import com.eatit.mainDomain.Criteria;
import com.eatit.memberDomain.MemberVO;

public interface HumanResourceDAO {
	
	public MemberVO selectHrContent(MemberVO vo);

	public List<MemberVO> selectHrList(Criteria cri);
	
	public int getTotalCount();
}
