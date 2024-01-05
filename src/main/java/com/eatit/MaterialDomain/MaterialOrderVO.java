package com.eatit.MaterialDomain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MaterialOrderVO {
	
	private Integer materialod_id;
	private Integer company_no;
	private Timestamp materialod_date;
	private Timestamp materialod_update;
	private String material_name;
	private Integer materialod_order;
	private Integer employee_no;
	private int delete_status; 
	
}
