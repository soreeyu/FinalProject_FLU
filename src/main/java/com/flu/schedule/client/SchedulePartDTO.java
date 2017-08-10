package com.flu.schedule.client;

import java.lang.reflect.Array;
import java.util.List;


public class SchedulePartDTO {
	
	private int scheduleNum; //MainDTO의 것과 엮임
	private String partName; 
	private String partStartDate;
	private String partFinishDate;
	private String partDescFileO;
	private String partDescFileF;
	private Integer partNum; // 동일한 스케줄내에서 part에 접근하기 위한 변수 
	private List<ScheduleUnitDTO> unitList;
	
	
	
	public List<ScheduleUnitDTO> getUnitList() {
		return unitList;
	}
	public void setUnitList(List<ScheduleUnitDTO> unitList) {
		this.unitList = unitList;
	}
	public String getPartDescFileO() {
		return partDescFileO;
	}
	public void setPartDescFileO(String partDescFileO) {
		this.partDescFileO = partDescFileO;
	}
	public String getPartDescFileF() {
		return partDescFileF;
	}
	public void setPartDescFileF(String partDescFileF) {
		this.partDescFileF = partDescFileF;
	}
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
	public String getPartStartDate() {
		return partStartDate;
	}
	public void setPartStartDate(String partStartDate) {
		this.partStartDate = partStartDate;
	}
	public String getPartFinishDate() {
		return partFinishDate;
	}
	public void setPartFinishDate(String partFinishDate) {
		this.partFinishDate = partFinishDate;
	}
	
	
}
