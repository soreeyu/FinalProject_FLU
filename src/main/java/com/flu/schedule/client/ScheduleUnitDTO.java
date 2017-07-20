package com.flu.schedule.client;

import org.springframework.web.multipart.MultipartFile;

public class ScheduleUnitDTO {
	
	private Integer scheduleNum;
	private Integer unitNum;//스케줄에 대한 할일 고유번호
	private String unitName; //할일 제목
	private String unitDescribe; //할일 설명
	private MultipartFile unitDescFile;
	private String unitDescFileO;
	private String unitDescFileF;
	private Integer partNum; // Part들 중에 무조건 속해잇어야함
	private String unitStartDate; //시작일
	private String unitFinishDate; //마감일
	private String email; // 해당 일을 맡은 사용자 등록 
	private String unitState; //해당 할일에 대한 상태 //할일, 진행중, 완료
	

	
	public MultipartFile getUnitDescFile() {
		return unitDescFile;
	}
	public void setUnitDescFile(MultipartFile unitDescFile) {
		this.unitDescFile = unitDescFile;
	}
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
	public Integer getPartNum() {
		return partNum;
	}
	public void setPartNum(Integer partNum) {
		this.partNum = partNum;
	}

	public String getUnitStartDate() {
		return unitStartDate;
	}
	public void setUnitStartDate(String unitStartDate) {
		this.unitStartDate = unitStartDate;
	}
	public String getUnitFinishDate() {
		return unitFinishDate;
	}
	public void setUnitFinishDate(String unitFinishDate) {
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
