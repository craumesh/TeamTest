package com.eatit.warehouseDomain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class StockVO {
	private String identify_code; 		// 식별코드
	private String category;			// 구분			
	private String product_name;		// 품목이름
	private String product_unit;		// 단위
	private String expiry_date;			// 유통기한
	private String io_classification;	// 입출고구분
	private String io_quantities;		// 입출고수량
	private Timestamp update_date;		// 입출고일
}
