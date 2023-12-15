package com.eatit.machinePersistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.eatit.machineDomain.machineVO;

@Repository
public class machineDAOImpl implements machineDAO {
	
	
	private static final Logger logger = LoggerFactory.getLogger(machineDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
private static final String NAMESPACE="com.eatit.mapper.machineMapper";

	@Override
	public void insertmachine(machineVO vo) {
	// 설비를 추가하는 동작
		logger.debug("mapper(DB) 설비를 추가하는 동작 구문 실행 - 시작");
		sqlSession.insert(NAMESPACE+ ".insertmachine",vo);
		logger.debug("mapper(DB) 설비를 추가하는 동작 구문 실행 - 끝");
	}
	
	
	
}
