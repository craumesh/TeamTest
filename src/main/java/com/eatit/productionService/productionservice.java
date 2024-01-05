package com.eatit.productionService;

import java.util.List;

import com.eatit.machineDomain.machineVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.productionDomain.productionVO;
import com.eatit.productionDomain.purchase_order_productVO;

public interface productionservice {

	// 발주서 목록 조회 동작
	public List<purchase_order_productVO> formorderlist(Criteria cri);
	
	// 페이징 처리 갯수
	public int machinetotalCount();
	
	// 발주서 페징 처리 갯수
	public int formtotalCount();
	
	// 설비 전체 조회
	public List<machineVO> machinelistall(Criteria cri);
	
}
