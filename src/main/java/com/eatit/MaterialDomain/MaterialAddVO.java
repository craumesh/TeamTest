package com.eatit.MaterialDomain;

import java.sql.Timestamp;
import lombok.Data;

@Data  
public class MaterialAddVO {
    // 원자재 추가에 필요한 필드들
	private String materialadd_id;			// 입고 코드
	private Timestamp materialadd_date; // 입고 일자
    private String material_name;        // 원자재 이름
    private Integer quantity;       // 수량

}
