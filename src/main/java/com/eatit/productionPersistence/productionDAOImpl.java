package com.eatit.productionPersistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.eatit.machineDomain.machineVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.productionDomain.productionVO;
import com.eatit.productionDomain.purchase_orderVO;

@Repository
public class productionDAOImpl implements productionDAO{

	
	private static final Logger logger = LoggerFactory.getLogger(productionDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="com.eatit.mapper.productionMapper";
	private static final String NAMESPACE_machine="com.eatit.mapper.machineMapper";



	@Override
	public int machinetotalCount() {
		logger.debug("machinetotalCount()");
		return sqlSession.selectOne(NAMESPACE+".machinetotalCount");
	}


	@Override
	public List<machineVO> machinelistall(Criteria cri) {
		logger.debug("machinlist()");
		return sqlSession.selectList(NAMESPACE_machine + ".machinelistall", cri);
	}
	
	
	
	
}
