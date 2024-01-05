package com.eatit.productionPersistence;

import java.util.List;

import com.eatit.machineDomain.machineVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.productionDomain.productionVO;
import com.eatit.productionDomain.purchase_order_productVO;

public interface productionDAO {
	
	// 생산을 위한 발주서 목록 조회
	public List<purchase_order_productVO> formorderlist(Criteria cri);

	// 설비 페이징 처리 갯수
	public int machinetotalCount();
	
	// 발주서 페징 처리 갯수
	public int formtotalCount();
	
	// 설비 상세 조회
	public List<machineVO> machinelistall(Criteria cri);
}