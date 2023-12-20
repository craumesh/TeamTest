package com.eatit.memberDomain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private int employee_no;
	private String photo_paths;
	private String id;
	private String pw;
	private String name;
	private int hr_manage_no;
	private String email;
	private String member_contact;
	private String member_addr;
	private String member_status;
	private String member_active;
	private Timestamp member_regdate;
	private Timestamp member_update;
}
