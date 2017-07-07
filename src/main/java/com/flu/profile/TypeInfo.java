package com.flu.profile;

import java.sql.Date;

public class TypeInfo {
	private String name;
	private String nameorGender;
	private Date birth;
	private String email;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNameorGender() {
		return nameorGender;
	}
	public void setNameorGender(String nameorGender) {
		this.nameorGender = nameorGender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	
}
