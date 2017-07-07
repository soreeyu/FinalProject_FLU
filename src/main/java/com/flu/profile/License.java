package com.flu.profile;

import java.sql.Date;

public class License {

	private String email;
	private String lName;
	private String agency;
	private Date publishDate;
	private int seiralNum;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getAgency() {
		return agency;
	}
	public void setAgency(String agency) {
		this.agency = agency;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public int getSeiralNum() {
		return seiralNum;
	}
	public void setSeiralNum(int seiralNum) {
		this.seiralNum = seiralNum;
	}
	
	
}
