package com.flu.schedule.client;

import java.sql.Date;


public class SchedulePartDTO {
	
	private int scheduleNum; //MainDTO의 것과 엮임
	private String partName; 
	private Date partStartDate;
	private Date partFinishDate;
	private Integer partNum; // 동일한 스케줄내에서 part에 접근하기 위한 변수 
	
	public Integer getPartNum() {
		return partNum;
	}
	public void setPartNum(Integer partNum) {
		this.partNum = partNum;
	}
	public int getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
	}
	public String getPartName() {
		return partName;
	}
	public void setPartName(String partName) {
		this.partName = partName;
	}
	public Date getPartStartDate() {
		return partStartDate;
	}
	public void setPartStartDate(Date partStartDate) {
		this.partStartDate = partStartDate;
	}
	public Date getPartFinishDate() {
		return partFinishDate;
	}
	public void setPartFinishDate(Date partFinishDate) {
		this.partFinishDate = partFinishDate;
	}
	
	
}
