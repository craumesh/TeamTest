package com.eatit.masterdataPersistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.eatit.memberDomain.MemberVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.masterdataDomain.MasterdataVO;

@Repository
public class MasterdataDAOImpl implements MasterdataDAO {
	private static final Logger logger = LoggerFactory.getLogger(MasterdataDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.eatit.mapper.MdMapper";
	
	@Override
	// 창고 정보 모두 가져오기
	public List<MasterdataVO> getProductListAll(Criteria cri) {
		logger.debug("DAO - getMasterDataListAll() 호출");
		return sqlSession.selectList(NAMESPACE+".selectProductListAll",cri);
	}
	
	@Override
	public int getTotalCount() {
		logger.debug("DAO(getTotalCount) -> Mapper 호출");
		return sqlSession.selectOne(NAMESPACE+".totalCount");
	}

//	@Override
//	// 회원 정보 모두 가져오기
//	public List<MemberVO> getMemberListAll() {
//		return sqlSession.selectList(NAMESPACE+"getMemberListAll");
//	}
//
//	@Override
//	// 직책 정보 가져오기- ajax
//	public List<String> getPositionName() {
//		return sqlSession.selectList(NAMESPACE+"getPositionName");
//	}
//
//	@Override
//	// 직책에 맞는 회원이름 가져오기- ajax
//	public List<String> getMembersOfPosition(String position_name) {
//		return sqlSession.selectList(NAMESPACE+"getMembersOfPosition", position_name);
//	}
//	
//	@Override
//	// 이름에 맞는 회원정보 가져오기- ajax
//	public List<MemberVO> getMemberInfoByName(String name) {
//		return sqlSession.selectList(NAMESPACE+"getMemberInfoByName", name);
//	}
//
//	@Override
//	// 창고 정보 가져오기(main)
//	public List<MasterdataVO> getMasterDataListMain() {
//		logger.debug("DAO - getMasterDataListAll() 호출");
//		return sqlSession.selectList(NAMESPACE+"getMasterDataMainList");
//	}
//
//	@Override
//	// 특정 창고 정보 가져오기 - ajax
//	public MasterdataVO getMasterDataInfo(MasterdataVO vo) {
//		logger.debug("DAO - getMasterDataInfo(MasterDataVO vo)");
//		logger.debug("DAO vo : "+vo);
//		logger.debug("DAO 전달해주는 vo : "+sqlSession.selectOne(NAMESPACE+"getMasterDataInfo", vo));
//		return sqlSession.selectOne(NAMESPACE+"getMasterDataInfo", vo);
//	}
//
//	@Override
//	// 특정 창고 정보 가져오기(세션 아이디에 해당하는 회원정보)
//	public MemberVO getMasterDataInfo(int no) {
//		logger.debug("DAO - getMasterDataInfo(int no)");
//		return sqlSession.selectOne(NAMESPACE+"getMasterDataAdminInfo", no);
//	}

	@Override
	public MasterdataVO selectMaxCategoryCode(MasterdataVO vo) {
		logger.debug("DAO - selectMaxCategoryCode(MasterDataVO vo)");
		return sqlSession.selectOne(NAMESPACE+".selectMaxCategoryCode", vo);		
	}
	
	@Override
	public MasterdataVO selectMaxCategoryDetailCode(MasterdataVO vo) {
		logger.debug("DAO - selectMaxCategoryDetailCode(MasterDataVO vo)");
		return sqlSession.selectOne(NAMESPACE+".selectMaxCategoryDetailCode", vo);		
	}

	@Override
	// 창고 등록
	public void insertProduct(MasterdataVO vo) {
		logger.debug("DAO - insertProduct(MasterDataVO vo)");
		sqlSession.insert(NAMESPACE+".insertProduct", vo);
	}
	
//	@Override
//	// 창고 수정
//	public void updateDetailInfo(MasterdataVO vo) {
//		sqlSession.update(NAMESPACE+"updateDetailInfo", vo);
//	}
//
//	@Override
//	// 창고 삭제
//	public void deleteMasterData(int[] masterdata_no) {
//		logger.debug("DAO - deleteMasterData(MasterDataVO vo)");
//		Map<String, Object> paramMap = new HashMap<>();
//		paramMap.put("MasterData_no", masterdata_no);
//		sqlSession.delete(NAMESPACE+"deleteMasterData",paramMap);
//	}
}
