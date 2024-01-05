package com.eatit.productionService;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.eatit.machineDomain.machineVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.productionDomain.productionVO;
import com.eatit.productionDomain.purchase_order_productVO;
import com.eatit.productionPersistence.productionDAO;

@Service
public class productionserviceImpl implements productionservice {

	
	private static final Logger logger = LoggerFactory.getLogger(productionserviceImpl.class);
	
	@Inject
	private productionDAO pddao;

	@Override
	public List<purchase_order_productVO> formorderlist(Criteria cri) {
		logger.debug("service : formorderlist()");
		return pddao.formorderlist(cri);
	}

	@Override
	public int machinetotalCount() {
	logger.debug("service : totalCount()");
		return pddao.machinetotalCount();
	}

	@Override
	public int formtotalCount() {
		logger.debug("service : formtotalCount()");
		return pddao.formtotalCount();
	}

	@Override
	public List<machineVO> machinelistall(Criteria cri) {
		logger.debug("service : machinelistall()");
		return pddao.machinelistall(cri);
	}
	
	
	
	
	
	
	
}
