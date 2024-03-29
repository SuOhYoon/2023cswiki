package com.spring.cswiki.dto;

import java.util.Date;

public class MemberDTO {
	private String u_id;
	private String g_id;
	private int p_id;
	private String email;
	private String name;
	private String pwd;
	private Date reg_date;
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getP_id() {
		return p_id;
	}	
	public void setG_id(String g_id) {
		this.g_id = g_id;
	}
	public String getG_id() {
		return g_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}	
}
