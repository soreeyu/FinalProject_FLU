package com.flu.eachRoom;

import com.flu.room.RoomDTO;

public class EachRoomDTO extends RoomDTO{

	private String type;
	private String human;
	private String convenience;
	private Integer price;
	private Integer snum;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getHuman() {
		return human;
	}
	public void setHuman(String human) {
		this.human = human;
	}
	public String getConvenience() {
		return convenience;
	}
	public void setConvenience(String convenience) {
		this.convenience = convenience;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getSnum() {
		return snum;
	}
	public void setSnum(Integer snum) {
		this.snum = snum;
	}

	
	
	
}
