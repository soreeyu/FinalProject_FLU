package com.flu.reservation;

import java.sql.Date;

public class ReservationDTO {
	
	private String name;
	private String time;
	private Date reserve_date;
	private String reserve_name;
	private Integer price;
	private Integer human;
	private String email;
	private Integer snum;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Date getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getReserve_name() {
		return reserve_name;
	}
	public void setReserve_name(String reserve_name) {
		this.reserve_name = reserve_name;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getHuman() {
		return human;
	}
	public void setHuman(Integer human) {
		this.human = human;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getSnum() {
		return snum;
	}
	public void setSnum(Integer snum) {
		this.snum = snum;
	}
	
	
	
	
}
