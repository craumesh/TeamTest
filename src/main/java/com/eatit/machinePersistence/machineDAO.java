package com.eatit.machinePersistence;

import java.util.List;

import com.eatit.machineDomain.machineVO;
import com.eatit.machineDomain.machinehistoryVO;

public interface machineDAO {
	
	// 설비 추가 동작
	public void insertmachine(machineVO vo);
	
	// 설비 리스트조회 동작
	public List<machineVO> getmachinelist();
	
	// 설비 기록
	public void machinehistory(machinehistoryVO vo);
	
	// 설비 코드
	public int getmachinecode();
	
	// 설비 정보
	public machineVO machineinfo(int code);
}
