package com.eatit.masterdataDomain;

import lombok.Data;

@Data
public class MasterdataVO {
	private int product_no;
	private String code;
	private String name;
	private String photo_paths;
	private String category;
	private String category_detail;
	private String unit;
	private float price;	

	private int company_no;
	private String company_name;
	private String company_manager; 
}
