package com.eatit.productionDomain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class purchase_orderVO {
	private int order_id;
	private int company_no;
	private int employee_no;
	private int product_no;
	private int quantity;
	private Timestamp order_date;
	private Date due_date;
	private String comments;
	private String order_status;
	private Date update_date;
	private int delete_status;
	
	private String name;
}
