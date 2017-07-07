package com.flu.schedule.client;

import java.sql.Date;

public class ScheduleUnitDTO {
	
	private int scheduleNum;
	private String unitName;
	private String unitDescribe;
	private String unitDescFileO;
	private String unitDescFileF;
	private String partName; // Part들 중에 무조건 속해잇어야함
	private Date unitFinishDate; //마감일
	private String user; // 해당 일을 맡은 사용자 등록 

}
