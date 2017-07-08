package com.flu.project.sell;

public class PjSellDTO {
	
	private int projectNum;
	private String name;			//판매할 프로젝트 이름
	private int price;
	private String contents;		//판매할 프로젝트 설명
	private String email;			//판매자(클라이언트) 이메일
	
	
	
	public int getProjectNum() {
		return projectNum;
	}
	public void setProjectNum(int projectNum) {
		this.projectNum = projectNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
}
