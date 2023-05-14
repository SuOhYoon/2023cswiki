package com.spring.cswiki.dto;

import java.util.Date;

public class BoardVO {
	private String b_content;
	private Date b_date;
	private int b_num;
	private String b_title;
	private int bl_num;
	private String hashtag1;
	private String hashtag2;
	private String hashtag3;
	private String hashtag4;
	private String hashtag5;
	private String u_id;

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_title() {
		return b_title;
	}
	

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public int getBl_num() {
		return bl_num;
	}

	public void setBl_num(int bl_num) {
		this.bl_num = bl_num;
	}

	public String getHashtag1() {
		return hashtag1;
	}

	public void setHashtag1(String hashtag1) {
		this.hashtag1 = hashtag1;
	}

	public String getHashtag2() {
		return hashtag2;
	}

	public void setHashtag2(String hashtag2) {
		this.hashtag2 = hashtag2;
	}

	public String getHashtag3() {
		return hashtag3;
	}

	public void setHashtag3(String hashtag3) {
		this.hashtag3 = hashtag3;
	}

	public String getHashtag4() {
		return hashtag4;
	}

	public void setHashtag4(String hashtag4) {
		this.hashtag4 = hashtag4;
	}

	public String getHashtag5() {
		return hashtag5;
	}

	public void setHashtag5(String hashtag5) {
		this.hashtag5 = hashtag5;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
}
