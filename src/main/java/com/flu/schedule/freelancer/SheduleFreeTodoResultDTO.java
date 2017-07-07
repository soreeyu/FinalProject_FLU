package com.flu.schedule.freelancer;

public class SheduleFreeTodoResultDTO {
	
	//scheduleNum, doNum 으로 ClientSchedule(UnitDTO) 에 접근가능함
	private int scheduleNum;
	private int doNum;
	private int doResultFileNum;//고유번호로 생성되야함
	private String email;
	//여기에 그냥 파일 리스트를 넣어도 좋을 듯 하다 //ScheduleResultFileDTO 대신
	
	public int getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
	}
	public int getDoNum() {
		return doNum;
	}
	public void setDoNum(int doNum) {
		this.doNum = doNum;
	}
	public int getDoResultFileNum() {
		return doResultFileNum;
	}
	public void setDoResultFileNum(int doResultFileNum) {
		this.doResultFileNum = doResultFileNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	} 
	
	

}
