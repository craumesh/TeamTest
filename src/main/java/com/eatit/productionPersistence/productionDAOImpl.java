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
import com.eatit.productionDomain.purchase_order_productVO;

@Repository
public class productionDAOImpl implements productionDAO{

	
	private static final Logger logger = LoggerFactory.getLogger(productionDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE="com.eatit.mapper.productionMapper";
	private static final String NAMESPACE_machine="com.eatit.mapper.machineMapper";

	@Override
	public List<purchase_order_productVO> formorderlist(Criteria cri) {
		logger.debug("formorderlist()");
		return sqlSession.selectList(NAMESPACE+ ".formorderlist", cri);
	}

	@Override
	public int machinetotalCount() {
		logger.debug("machinetotalCount()");
		return sqlSession.selectOne(NAMESPACE+".machinetotalCount");
	}

	@Override
	public int formtotalCount() {
		logger.debug("formtotalCount()");
		return sqlSession.selectOne(NAMESPACE+".formtotalCount");
	}

	@Override
	public List<machineVO> machinelistall() {
		logger.debug("machinlist()");
		return sqlSession.selectList(NAMESPACE_machine + ".machinelistall");
	}
	
	
	
	
}
