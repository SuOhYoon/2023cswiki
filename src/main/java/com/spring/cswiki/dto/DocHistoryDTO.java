package com.spring.cswiki.dto;

import java.sql.Time;
import java.util.Date;

public class DocHistoryDTO {
	int d_num;
	int d_version;
	String u_id;
	Date date;
	Time time;
	String d_summary;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	public String getD_summary() {
		return d_summary;
	}
	public void setD_summary(String d_summary) {
		this.d_summary = d_summary;
	}
}
