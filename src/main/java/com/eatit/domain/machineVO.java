package com.eatit.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class machineVO {
	
	private String machine_code;
	private int member_no;
	private String machine_status;
	private String purpose_of_use;
	private String purpos_of_check;
	
	private Timestamp last_check_time;
	private Timestamp last_operating_time;
	private Timestamp installation_date;
	
}
