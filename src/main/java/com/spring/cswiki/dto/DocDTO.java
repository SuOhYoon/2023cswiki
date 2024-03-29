package com.spring.cswiki.dto;

public class DocDTO {
	private int d_num;
	private int s_ca_num;
	private int p_read;
	private int p_insert;
	private int p_update;
	private int p_delete;
	private String d_title;
	private String d_content;
	private String d_summary;
	private String u_id;
	private int d_available;
	private int next;
	private int prev;
	
	public int getD_num() {
		return d_num;
	}
	public void setD_num(int d_num) {
		this.d_num = d_num;
	}
	public int getS_ca_num() {
		return s_ca_num;
	}
	public void setS_ca_num(int s_ca_num) {
		this.s_ca_num = s_ca_num;
	}
	
	public int getP_read() {
		return p_read;
	}
	public void setP_read(int p_read) {
		this.p_read = p_read;
	}
	public int getP_insert() {
		return p_insert;
	}
	public void setP_insert(int p_insert) {
		this.p_insert = p_insert;
	}
	public int getP_update() {
		return p_update;
	}
	public void setP_update(int p_update) {
		this.p_update = p_update;
	}
	public int getP_delete() {
		return p_delete;
	}
	public void setP_delete(int p_delete) {
		this.p_delete = p_delete;
	}
	public String getD_title() {
		return d_title;
	}
	public void setD_title(String d_title) {
		this.d_title = d_title;
	}
	public String getD_content() {
		return d_content;
	}
	public void setD_content(String d_content) {
		this.d_content = d_content;
	}
	public String getD_summary() {
		return d_summary;
	}
	public void setD_summary(String d_summary) {
		this.d_summary = d_summary;
	}

	public int getD_available() {
		return d_available;
	}
	public void setD_available(int d_available) {
		this.d_available = d_available;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getPrev() {
		return prev;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
}
