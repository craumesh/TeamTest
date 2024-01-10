package com.eatit.productionPersistence;

import java.util.List;

import com.eatit.machineDomain.machineVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.productionDomain.ordersVO;
import com.eatit.productionDomain.productionVO;
import com.eatit.productionDomain.productionhistoryVO;

public interface productionDAO {
	
	

	// 설비 페이징 처리 갯수
	public int machinetotalCount();
	

	// 설비 상세 조회
	public List<machineVO> machinelistall(Criteria cri);
	
	// 생산 완료
	public void productionhistory(productionhistoryVO vo);
}