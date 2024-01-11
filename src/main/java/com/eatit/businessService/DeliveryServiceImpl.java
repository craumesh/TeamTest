package com.eatit.businessService;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.eatit.businessPersistence.DeliveryDAO;

@Service
public class DeliveryServiceImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(DeliveryServiceImpl.class);
	
	@Inject
	private DeliveryDAO ddao;
	
}
