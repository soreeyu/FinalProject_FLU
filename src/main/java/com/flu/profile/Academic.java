package com.flu.profile;

import java.sql.Date;

public class Academic{

	private String email;
	private String school;
	private String state;
	private String sName;
	private String major;
	private Date entrance;
	private Date graduate;
	
	
	public Date getEntrance() {
		return entrance;
	}
	public void setEntrance(Date entrance) {
		this.entrance = entrance;
	}
	public Date getGraduate() {
		return graduate;
	}
	public void setGraduate(Date graduate) {
		this.graduate = graduate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}

}
