package com.eatit.businessPersistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(DeliveryDAOImpl.class);
	
	private static final String NAMESPACE = "com.eatit.mapper.DeliveryMapper";
	
	@Inject
	private SqlSession SqlSession;
	
}
