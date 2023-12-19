package com.eatit.humanResourcePersistence;

import java.util.List;

import com.eatit.humanResourceDomain.HumanResourceVO;

public interface HumanResourceDAO {
	public List<HumanResourceVO> selectHrList();
	
	public HumanResourceVO selectHrContent(HumanResourceVO vo);
}
