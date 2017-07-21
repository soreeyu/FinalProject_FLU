package com.flu.project;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;


public class ProjectDTO {

	private int projectNum;
	private String category;		
	private String detailCategory;	
	private String name;
	private String period;
	private Date startDate;
	private Date finishDate;
	private int budget;
	private String planState;
	private String contents;
	private String skill;
	private String[] skills;
	private String meetKind;
	private String exp;
	private String state;			
	private String email;
	private int quick;	
	private MultipartFile fileName;
	private String fName;			
	private String oName;			
	private String addr_num;		
	private String addr_main;		
	private String addr_detail;
	private Date reg_date;		
	
	
	
	
	public MultipartFile getFileName() {
		return fileName;
	}
	public void setFileName(MultipartFile fileName) {
		this.fileName = fileName;
	}
	public int getProjectNum() {
		return projectNum;
	}
	public void setProjectNum(int projectNum) {
		this.projectNum = projectNum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDetailCategory() {
		return detailCategory;
	}
	public void setDetailCategory(String detailCategory) {
		this.detailCategory = detailCategory;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
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
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	public String getPlanState() {
		return planState;
	}
	public void setPlanState(String planState) {
		this.planState = planState;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getMeetKind() {
		return meetKind;
	}
	public void setMeetKind(String meetKind) {
		this.meetKind = meetKind;
	}
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getQuick() {
		return quick;
	}
	public void setQuick(int quick) {
		this.quick = quick;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public String getAddr_num() {
		return addr_num;
	}
	public void setAddr_num(String addr_num) {
		this.addr_num = addr_num;
	}
	public String getAddr_main() {
		return addr_main;
	}
	public void setAddr_main(String addr_main) {
		this.addr_main = addr_main;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String[] getSkills() {
		return skills;
	}
	public void setSkills(String[] skills) {
		this.skills = skills;
	}
	
	
	
	
}
