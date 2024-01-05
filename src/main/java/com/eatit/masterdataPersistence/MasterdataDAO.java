package com.eatit.masterdataPersistence;

import java.util.List;

import com.eatit.memberDomain.MemberVO;
import com.eatit.masterdataDomain.MasterdataVO;

public interface MasterdataDAO {
	// 창고 정보 모두 가져오기
	public List<MasterdataVO> getMasterDataListAll();
	
//	// 회원 정보 모두 가져오기
//	public List<MemberVO> getMemberListAll();
//	
//	// 직책 정보 가져오기 - ajax
//	public List<String> getPositionName();
//	
//	// 직책에 해당하는 회원이름 리스트 가져오기 - ajax
//	public List<String> getMembersOfPosition(String position_name);
//	
//	// 이름에 해당하는 회원정보 리스트 가져오기 - ajax
//	public List<MemberVO> getMemberInfoByName(String name);
//	
//	// 창고 정보 가져오기(main)
//	public List<MasterdataVO> getMasterDataListMain();
//	
//	// 특정 창고 정보 가져오기
//	public MasterdataVO getMasterDataInfo(MasterdataVO vo);
//	
//	// 특정 창고 정보 가져오기(세션 아이디에 해당하는 회원정보) - ajax
//	public MemberVO getMasterDataInfo(int no);
//	
//	// 창고 등록
//	public void insertMasterData(MasterdataVO vo);
//	
//	// 창고 상세 정보 수정
//	public void updateDetailInfo(MasterdataVO vo);
//	
//	// 창고 삭제
//	public void deleteMasterData(int[] masterdata_no);
}
