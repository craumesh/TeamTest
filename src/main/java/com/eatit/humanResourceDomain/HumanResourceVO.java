package com.eatit.humanResourceDomain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class HumanResourceVO {
	private int employee_no;
	private String photo_paths;
	private String id;
	private String pw;
	private String name;
	private String depart_name;
	private String position_name;
	private String email;
	private String extension_no;
	private String contact;
	private String address;
	private String status;
	private String active;
	private Timestamp regdate;
	private Timestamp update;	
}
