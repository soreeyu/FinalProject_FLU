package com.flu.schedule;

import java.util.ArrayList;

public class ScheduleSummaryDTO {
	
	private int [] stateCount; // 0 할일 1진행중 2완료 3total
	private ArrayList<String> partNames;
	private ArrayList<String> userNames;
	private ArrayList<int []> stateCountPerPart; 
	private ArrayList<int []> stateCountPerUser;

	
	
	
	public ArrayList<String> getPartNames() {
		return partNames;
	}

	public void setPartNames(ArrayList<String> partNames) {
		this.partNames = partNames;
	}

	public ArrayList<String> getUserNames() {
		return userNames;
	}

	public void setUserNames(ArrayList<String> userNames) {
		this.userNames = userNames;
	}

	public int[] getStateCount() {
		return stateCount;
	}

	public void setStateCount(int[] stateCount) {
		this.stateCount = stateCount;
	}

	public ArrayList<int[]> getStateCountPerPart() {
		return stateCountPerPart;
	}

	public void setStateCountPerPart(ArrayList<int[]> stateCountPerPart) {
		this.stateCountPerPart = stateCountPerPart;
	}

	public ArrayList<int[]> getStateCountPerUser() {
		return stateCountPerUser;
	}

	public void setStateCountPerUser(ArrayList<int[]> stateCountPerUser) {
		this.stateCountPerUser = stateCountPerUser;
	}
	
	
	
}
