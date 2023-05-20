package com.spring.cswiki.dto;

import java.util.Date;

public class CommentVO {
	private int cm_num;
	private int bl_num;
	private String u_id;
	private String cm_content;
	private Date cm_date;
	
	public int getCm_num() {
		return cm_num;
	}
	public void setCm_num(int cm_num) {
		this.cm_num = cm_num;
	}
	public int getBl_num() {
		return bl_num;
	}
	public void setBl_num(int bl_num) {
		this.bl_num = bl_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public Date getCm_date() {
		return cm_date;
	}
	public void setCm_date(Date cm_date) {
		this.cm_date = cm_date;
	}
}
