package com.eatit.MaterialListPersistence;

import com.eatit.MaterialDomain.MaterialVO;
import com.eatit.MaterialListDomain.MaterialListVO;

import java.util.List;

public interface MaterialListDAO {
    // 원자재 목록 조회 메서드
    public List<MaterialListVO> findAllMaterials();

	public MaterialListVO findMaterialById(Long id);
}