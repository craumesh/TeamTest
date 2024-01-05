package com.eatit.masterdataService;

import java.util.List;

import com.eatit.memberDomain.MemberVO;
import com.eatit.masterdataDomain.MasterdataVO;

public interface MasterdataService {
	
	// 창고 정보 리스트 가져오기(All)
	public List<MasterdataVO> masterdataListAll();
	
//	// 회원 정보 리스트 가져오기(All)
//	public List<MemberVO> memberListAll();
//	
//	// 직책 정보 리스트 가져오기- ajax
//	public List<String> memberGetPositionName();
//	
//	// 직책에 해당하는 회원이름 리스트 가져오기- ajax
//	public List<String> getMembersOfposition(String position_name);
//	
//	// 이름에 해당하는 회원정보 리스트 가져오기 - ajax
//	public List<MemberVO> getMemberInfoByName(String name);
//	
//	// 창고 정보 가져오기(main)
//	public List<MasterdataVO> masterDataListMain();
//	
//	// 특정 창고 정보 가져오기 - ajax
//	public MasterdataVO masterDataInfo(MasterdataVO vo);
//	
//	// 창고 등록 할 때 등록페이지에 로그인한 회원 정보 가져오기
//	public MemberVO masterdataInfo(int no);
//	
//	// 창고 등록 
//	public void masterDataRegist(MasterdataVO vo);
//	
//	// 창고 수정
//	public void masterDataUpdate(MasterdataVO vo);
//	
//	// 창고 삭제
//	public void deleteMasterData(int[] masterdata_no);
}
