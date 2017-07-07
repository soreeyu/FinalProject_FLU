package com.flu.meetRoom;

import com.flu.room.RoomDTO;

public class MeetRoomDTO extends RoomDTO{
		
	private String holiday;
	private String addr_num;
	private String addr_main;
	private String addr_detail;
	private String homePage;
	
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public String getAddr_num() {
		return addr_num;
	}
	public void setAddr_num(String addr_num) {
		this.addr_num = addr_num;
	}
	public String getAddr_main() {
		return addr_main;
	}
	public void setAddr_main(String addr_main) {
		this.addr_main = addr_main;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getHomePage() {
		return homePage;
	}
	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}

	
}
