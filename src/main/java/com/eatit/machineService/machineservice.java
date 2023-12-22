package com.eatit.machineService;

import java.util.List;

import com.eatit.machineDomain.machineVO;
import com.eatit.machineDomain.machinehistoryVO;

public interface machineservice {
	
	// 설비 추가 동작
	public void insertmachine(machineVO vo);
	
	// 설비 리스트 조회 동작
	public List<machineVO> machinelist();
	
	// 설비 기록
	public void machinehistory(machinehistoryVO vo);

}
