package com.flu.util;

public class ListInfo {

	private Integer curPage;
	private Integer perPage;


	//row

	private String kind; //contents인지
	private String search;//입력한값
	private String arrange;
	private int startRow;
	private int lastRow;


	//paging처리
	private int totalBlock;
	private int curBlock;
	private int startNum;
	private int lastNum;
	private int perBlock=5;

	//project
	private String[] project; //지우지말아주시오...ㅜㅜㅜㅜ
	private String memberName;
	private String type;
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String[] getProject() {
		return project;
	}
	public void setProject(String[] project) {
		this.project = project;
	}




	public void makePage(int totalCount){
		//1. totalCount
		//2. totalPage
		int totalPage = 0;
		int perBlock=5;

		if(totalCount%this.getPerPage()==0){
			totalPage=totalCount/this.getPerPage();
		}else {
			totalPage=totalCount/this.getPerPage()+1;
		}
		//3. totalBlock
		if(totalPage%perBlock==0){
			this.totalBlock=totalPage/perBlock;
		}else {
			this.totalBlock=totalPage/perBlock+1;
		}
		//4. curBlock
		if(this.getCurPage()%perBlock==0){
			this.curBlock=this.getCurPage()/perBlock;
		}else {
			this.curBlock=this.getCurPage()/perBlock+1;
		}
		//5. startNum, lastNum
		this.startNum=(this.curBlock-1)*perBlock+1;
		this.lastNum=this.curBlock*perBlock;
		if(this.curBlock==this.totalBlock){
			this.lastNum=totalPage;
		}
		if(this.totalBlock==0){
			this.lastNum = 1;
		}
	}

	





	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	public void setLastNum(int lastNum) {
		this.lastNum = lastNum;
	}
	public int getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}


	public void makeRow(){
		startRow=(this.getCurPage()-1)*this.getPerPage()+1;
		lastRow=this.getCurPage()*this.getPerPage();
		System.out.println("스타트로우: "+startRow);
		System.out.println("라스트로우: "+lastRow);
	}
	public Integer getPerPage() {
		if(perPage==null){
			perPage=10;
		}
		return perPage;
	}
	public void setPerPage(Integer perPage) {
		this.perPage = perPage;
	}
	public Integer getCurPage() {
		if(curPage==null){
			curPage=1;
		}
		return curPage;
	}

	public void setCurPage(Integer curPage) {
		if(curPage==null){
			curPage=1;
		}
		this.curPage = curPage;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}


	public String getKind() {
		return kind;
	}


	public void setKind(String kind) {
		this.kind = kind;
	}


	public String getArrange() {
		return arrange;
	}


	public void setArrange(String arrange) {
		this.arrange = arrange;
	}




}
