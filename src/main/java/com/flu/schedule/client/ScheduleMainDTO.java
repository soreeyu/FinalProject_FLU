package com.flu.schedule.client;

import java.sql.Date;

public class ScheduleMainDTO {
	
	private int projectNum; // Project와 엮여야함 
	private int scheduleNum;
	private Date startDate;
	private Date finishDate;
	
	public int getProjectNum() {
		return projectNum;
	}
	public void setProjectNum(int projectNum) {
		this.projectNum = projectNum;
	}
	public int getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
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
	
	


}
