package com.eatit.productionDomain;

import lombok.Data;

@Data
public class purchase_order_productVO {
	private int order_product_id;
	private int order_id;
	private int quantity;
	private int product_no;
	private String state;
	
	private String product_name;
}
