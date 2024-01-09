package com.eatit.productionService;

import java.util.List;

import com.eatit.machineDomain.machineVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.productionDomain.productionVO;
import com.eatit.productionDomain.purchase_orderVO;

public interface productionservice {

	// 페이징 처리 갯수
	public int machinetotalCount();

	// 설비 전체 조회
	public List<machineVO> machinelistall(Criteria cri);
	
}
