package com.flu.profile;

import java.sql.Date;

public class PortFolio {

	private String email;
	private String title;
	private String describe;
	private Date startDate;
	private Date finishDate;
	private int percentage;
	private String pfOname;
	private String pfFname;
	private String pfNum;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	public int getPercentage() {
		return percentage;
	}
	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}
	public String getPfOname() {
		return pfOname;
	}
	public void setPfOname(String pfOname) {
		this.pfOname = pfOname;
	}
	public String getPfFname() {
		return pfFname;
	}
	public void setPfFname(String pfFname) {
		this.pfFname = pfFname;
	}
	public String getPfNum() {
		return pfNum;
	}
	public void setPfNum(String pfNum) {
		this.pfNum = pfNum;
	}
	
	
}
