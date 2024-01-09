package com.eatit.businessDomain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;
import lombok.ToString;

/**
 * @author Junsik
 * 임시 VO 
 */
@Data
@ToString(exclude = "productList")
public class ProductVO {

	private int product_no;
	private String code;
	private String product_name;
	private String photo_paths;
	private String category;
	private String category_detail;
	private String company_no;
	private String unit;
	private String unit_quantity;
	private String price;

	private Integer quantity;
	
	// 리스트
	private List<ProductVO> productList;
	
}
