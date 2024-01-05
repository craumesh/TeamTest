package com.eatit.warehouseDomain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductionHistoryVO {
	
	private int history_no;
	private int product_no;
	private int production_quantity;
	private int defective_product;
	private int products;
	private Timestamp date_of_manufacture;
	private Timestamp EXPiry_date;
	private int machine_code;
}
