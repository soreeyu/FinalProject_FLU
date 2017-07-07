package com.flu.schedule.client;

import java.sql.Date;

public class SchedulePartDTO {
	
	private int scheduleNum; //MainDTO의 것과 엮임
	private String partName; // DB, JAVA, 기획 , 뭐시기뭐시기
	private Date partStartDate;
	private Date partFinishDate;

}
