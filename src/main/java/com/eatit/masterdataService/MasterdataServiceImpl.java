package com.eatit.masterdataService;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.eatit.masterdataDomain.MasterdataVO;
import com.eatit.masterdataPersistence.MasterdataDAO;
import com.eatit.memberDomain.MemberVO;

@Service
public class MasterdataServiceImpl implements MasterdataService {
	private static final Logger logger = LoggerFactory.getLogger(MasterdataServiceImpl.class);
	
	@Inject
	MasterdataDAO mdDAO;

	@Override
	// 창고 정보 리스트 가져오기(All)
	public List<MasterdataVO> masterdataListAll() {
		logger.debug("S - masterdataListAll() 호출");
		return mdDAO.getMasterDataListAll();
	}

//	@Override
//	// 회원 정보 리스트 가져오기(All)
//	public List<MemberVO> memberListAll() {
//		return mdDAO.getMemberListAll();
//	}
//
//	@Override
//	// 회원 직책 리스트 가져오기 - ajax
//	public List<String> memberGetPositionName() {
//		return mdDAO.getPositionName();
//	}
//
//	@Override
//	// 직책에 해당하는 회원이름 리스트 가져오기 - ajax
//	public List<String> getMembersOfposition(String position_name) {
//		return mdDAO.getMembersOfPosition(position_name);
//	}
//	
//	@Override
//	// 이름에 해당하는 회원정보 리스트 가져오기 - ajax
//	public List<MemberVO> getMemberInfoByName(String name) {
//		return mdDAO.getMemberInfoByName(name);
//	}
//
//	@Override
//	// 창고 정보 가져오기(main)
//	public List<MasterdataVO> masterDataListMain() {
//		logger.debug("S - masterdataListMain() 호출");
//		return mdDAO.getMasterDataListMain();
//	}
//
//	@Override
//	// 특정 창고 정보 가져오기 - ajax
//	public MasterdataVO masterDataInfo(MasterdataVO vo) {
//		logger.debug("S - masterdataInfo(masterdataVO vo) 호출");
//		return mdDAO.getMasterDataInfo(vo);
//	}
//
//	@Override
//	// 창고 등록 할 때 등록페이지에 로그인한 회원 정보 가져오기
//	public MemberVO masterdataInfo(int no) {
//		logger.debug("S - masterdataInfo(int no)");
//		return mdDAO.getMasterDataInfo(no);
//	}
//
//	@Override
//	// 창고 등록
//	public void masterDataRegist(MasterdataVO vo) {
//		logger.debug("S - masterdataRegist(masterdataVO vo)");
//		mdDAO.insertMasterData(vo);
//	}
//
//	@Override
//	// 창고 수정
//	public void masterDataUpdate(MasterdataVO vo) {
//		mdDAO.updateDetailInfo(vo);
//	}
//
//	@Override
//	// 창고 삭제
//	public void deleteMasterData(int[] masterdata_no) {
//		logger.debug("S - deletemasterdata(int[] masterdata_no)");
//		mdDAO.deleteMasterData(masterdata_no);
//	}
	
	
}
