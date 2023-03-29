package com.spring.cswiki.dto;

public class DocDTO {
	private int d_num;
	private int s_ca_num;
	private int up_perm;
	private String d_title;
	private String d_content;
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
	public int getUp_perm() {
		return up_perm;
	}
	public void setUp_perm(int up_perm) {
		this.up_perm = up_perm;
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
}
