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
	private String product_code;
	private String product_name;
	private String product_category;
	private String product_category_detail;
	private String company_no;
	private String product_unit;
	private String product_price;
	private String recipe;
	private Timestamp expiry_date;

	private Integer quantity;
	
	// 리스트
	private List<ProductVO> productList;
	
}
