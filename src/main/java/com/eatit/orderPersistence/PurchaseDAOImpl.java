package com.eatit.orderPersistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.eatit.orderDomain.PurchaseVO;

@Repository
public class PurchaseDAOImpl implements PurchaseDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseDAOImpl.class);
	
	private static final String NAMESPACE = "com.eatit.mapper.PurchaseMapper";

	@Inject
	private SqlSession SqlSession;
	
	@Override
	public void insertPurchaseOrder(PurchaseVO pvo) throws Exception {
		logger.debug("DAO: insertPurchaseOrder(PurchaseVO pvo)");
		SqlSession.insert(NAMESPACE + ".insertForm", pvo);
	}

	@Override
	public List<PurchaseVO> getOrderList() throws Exception {
		logger.debug("DAO: getOrderList()");
		return SqlSession.selectList(NAMESPACE + ".list");
	}

	@Override
	public PurchaseVO getOrderDetail(int order_id) throws Exception {
		logger.debug("DAO: getOrderDetail(int order_id)");
		return SqlSession.selectOne(NAMESPACE + ".readOrder", order_id);
	}
	
}
