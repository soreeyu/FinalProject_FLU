package com.flu.schedule.freelancer;

public class ScheduleResultFileDTO {
	
	private int unitResultFileNum;
	private String resultFName;
	private String resultOName;
	private int resultFileSeq; // 해당 doResultFileNum(고유번호임)에서의 순서 
	
	
	public int getUnitResultFileNum() {
		return unitResultFileNum;
	}
	public void setUnitResultFileNum(int unitResultFileNum) {
		this.unitResultFileNum = unitResultFileNum;
	}
	public String getResultFName() {
		return resultFName;
	}
	public void setResultFName(String resultFName) {
		this.resultFName = resultFName;
	}
	public String getResultOName() {
		return resultOName;
	}
	public void setResultOName(String resultOName) {
		this.resultOName = resultOName;
	}
	public int getResultFileSeq() {
		return resultFileSeq;
	}
	public void setResultFileSeq(int resultFileSeq) {
		this.resultFileSeq = resultFileSeq;
	}
	
	
}
