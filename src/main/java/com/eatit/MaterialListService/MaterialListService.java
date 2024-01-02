package com.eatit.MaterialListService;

import com.eatit.MaterialListDomain.MaterialListVO;
import java.util.List;

public interface MaterialListService {

    // 원자재 목록 조회 메서드
    public List<MaterialListVO> findAllMaterials();

    // 원자재 상세 조회 메서드
    public MaterialListVO findMaterialById(Long id);
}
