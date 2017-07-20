package com.flu.schedule.client;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class SchedulePartArrayDTO {
	
	private int scheduleNum; //MainDTO의 것과 엮임
	private String[] partName; // DB, JAVA, 기획 , 뭐시기뭐시기
	private String[] partStartDate;
	private String[] partFinishDate;
	private MultipartFile [] partDescFile;
	private String[] partDescFileO;
	private String[] partDescFileF;
	public int getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
	}
	public String[] getPartName() {
		return partName;
	}
	public void setPartName(String[] partName) {
		this.partName = partName;
	}
	public String[] getPartStartDate() {
		return partStartDate;
	}
	public void setPartStartDate(String[] partStartDate) {
		this.partStartDate = partStartDate;
	}
	public String[] getPartFinishDate() {
		return partFinishDate;
	}
	public void setPartFinishDate(String[] partFinishDate) {
		this.partFinishDate = partFinishDate;
	}
	public MultipartFile[] getPartDescFile() {
		return partDescFile;
	}
	public void setPartDescFile(MultipartFile[] partDescFile) {
		this.partDescFile = partDescFile;
	}
	public String[] getPartDescFileO() {
		return partDescFileO;
	}
	public void setPartDescFileO(String[] partDescFileO) {
		this.partDescFileO = partDescFileO;
	}
	public String[] getPartDescFileF() {
		return partDescFileF;
	}
	public void setPartDescFileF(String[] partDescFileF) {
		this.partDescFileF = partDescFileF;
	}

	
}