package com.flu.schedule.client;

import java.sql.Date;

public class ScheduleUnitDTO {
	
	private Integer scheduleNum;
	private Integer unitNum;//스케줄에 대한 할일 고유번호
	private String unitName; //할일 제목
	private String unitDescribe; //할일 설명
	private String unitDescFileO;
	private String unitDescFileF;
	private String partName; // Part들 중에 무조건 속해잇어야함
	private Date unitStartDate; //시작일
	private Date unitFinishDate; //마감일
	private String email; // 해당 일을 맡은 사용자 등록 
	private String unitState; //해당 할일에 대한 상태 //할일, 진행중, 완료
	
	public Integer getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(Integer scheduleNum) {
		this.scheduleNum = scheduleNum;
	}
	public Integer getUnitNum() {
		return unitNum;
	}
	public void setUnitNum(Integer unitNum) {
		this.unitNum = unitNum;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public String getUnitDescribe() {
		return unitDescribe;
	}
	public void setUnitDescribe(String unitDescribe) {
		this.unitDescribe = unitDescribe;
	}
	public String getUnitDescFileO() {
		return unitDescFileO;
	}
	public void setUnitDescFileO(String unitDescFileO) {
		this.unitDescFileO = unitDescFileO;
	}
	public String getUnitDescFileF() {
		return unitDescFileF;
	}
	public void setUnitDescFileF(String unitDescFileF) {
		this.unitDescFileF = unitDescFileF;
	}
	public String getPartName() {
		return partName;
	}
	public void setPartName(String partName) {
		this.partName = partName;
	}
	public Date getUnitFinishDate() {
		return unitFinishDate;
	}
	
	public Date getUnitStartDate() {
		return unitStartDate;
	}
	public void setUnitStartDate(Date unitStartDate) {
		this.unitStartDate = unitStartDate;
	}
	public void setUnitFinishDate(Date unitFinishDate) {
		this.unitFinishDate = unitFinishDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUnitState() {
		return unitState;
	}
	public void setUnitState(String unitState) {
		this.unitState = unitState;
	}
	
	
	

}
