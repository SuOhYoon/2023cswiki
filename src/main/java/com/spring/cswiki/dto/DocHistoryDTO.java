package com.spring.cswiki.dto;

import java.sql.Time;
import java.util.Date;

public class DocHistoryDTO {
	int d_num;
	int d_version;
	String u_id;
	Date d_date;
	Time d_time;
	String d_summary;
	String d_content;
	
	public int getD_num() {
		return d_num;
	}
	public void setD_num(int d_num) {
		this.d_num = d_num;
	}
	public int getD_version() {
		return d_version;
	}
	public void setD_version(int d_version) {
		this.d_version = d_version;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
	public Date getD_date() {
		return d_date;
	}
	public void setD_date(Date d_date) {
		this.d_date = d_date;
	}
	
	public Time getD_time() {
		return d_time;
	}
	public void setD_time(Time d_time) {
		this.d_time = d_time;
	}
	public String getD_summary() {
		return d_summary;
	}
	public void setD_summary(String d_summary) {
		this.d_summary = d_summary;
	}
	public String getD_content() {
		return d_content;
	}
	public void setD_content(String d_content) {
		this.d_content = d_content;
	}	
}
