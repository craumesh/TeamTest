package com.eatit.humanResourceService;

import java.util.List;

import com.eatit.humanResourceDomain.HumanResourceVO;

public interface HumanResourceService {
	public List<HumanResourceVO> getHrList();
	
	public HumanResourceVO getHrContent(HumanResourceVO vo);
}
