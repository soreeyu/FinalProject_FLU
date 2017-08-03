package com.flu.client;

import com.flu.member.MemberDTO;
import com.flu.profile.Evaluation;

public class ClientDTO extends MemberDTO{

	private String intro;
	private String homepage;
	private String registeredP;
	private String contractP;
	private String ongoingP;
	private String completeP;
	private String totalMoney;
	
	
	
	
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getRegisteredP() {
		return registeredP;
	}
	public void setRegisteredP(String registeredP) {
		this.registeredP = registeredP;
	}
	public String getContractP() {
		return contractP;
	}
	public void setContractP(String contractP) {
		this.contractP = contractP;
	}
	public String getOngoingP() {
		return ongoingP;
	}
	public void setOngoingP(String ongoingP) {
		this.ongoingP = ongoingP;
	}
	public String getCompleteP() {
		return completeP;
	}
	public void setCompleteP(String completeP) {
		this.completeP = completeP;
	}
	public String getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(String totalMoney) {
		this.totalMoney = totalMoney;
	}

	
	
}
