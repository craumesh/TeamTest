package com.eatit.memberService;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.eatit.memberDomain.MemberVO;
import com.eatit.memberPersistence.HumanResourceDAO;

@Service
public class HumanResourceServiceImpl implements HumanResourceService {	
	private static final Logger logger = LoggerFactory.getLogger(HumanResourceServiceImpl.class);
	
	@Inject
	HumanResourceDAO hrDAO;

	@Override
	public List<MemberVO> getHrList() {
		logger.debug("Service(getHrList) -> DAO 호출");
		return hrDAO.selectHrList();
	}

	@Override
	public MemberVO getHrContent(MemberVO vo) {
		logger.debug("Service(getHrContent) -> DAO 호출");
		return hrDAO.selectHrContent(vo);
	}

}
