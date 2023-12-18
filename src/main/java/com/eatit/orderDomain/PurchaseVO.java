package com.eatit.orderDomain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PurchaseVO {
	
	private Integer purchase_order_code;
	private Integer company_no;
	private Timestamp purchase_order_date;
	private Timestamp purchase_order_update_date;
	private Integer product_no;
	private String purchase_order_status;
	private Timestamp purchase_order_due_date;
	private String purchase_order_comment;
	
}
