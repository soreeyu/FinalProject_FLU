package com.flu.schedule.freelancer;

public class SheduleFreeTodoResultDTO {
	
	//scheduleNum, doNum 으로 ClientSchedule(UnitDTO) 에 접근가능함
	private int scheduleNum;
	private int unitNum;
	private int unitResultFileNum;//고유번호로 생성되야함
	private String email;
	//여기에 그냥 파일 리스트를 넣어도 좋을 듯 하다 //ScheduleResultFileDTO 대신
	
	public int getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
	}
	
	public int getUnitNum() {
		return unitNum;
	}
	public void setUnitNum(int unitNum) {
		this.unitNum = unitNum;
	}
	public int getUnitResultFileNum() {
		return unitResultFileNum;
	}
	public void setUnitResultFileNum(int unitResultFileNum) {
		this.unitResultFileNum = unitResultFileNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	} 
	
	

}
