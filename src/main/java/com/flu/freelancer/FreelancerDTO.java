package com.flu.freelancer;

import com.flu.member.MemberDTO;
import com.flu.profile.Academic;
import com.flu.profile.Carrer;
import com.flu.profile.Evaluation;
import com.flu.profile.License;
import com.flu.profile.Skill;

public class FreelancerDTO extends MemberDTO{

	private String jobKind;
	private String Interesting;
	private String possibility;
	private String intro;
	
	public String getJobKind() {
		return jobKind;
	}
	public void setJobKind(String jobKind) {
		this.jobKind = jobKind;
	}
	public String getInteresting() {
		return Interesting;
	}
	public void setInteresting(String interesting) {
		Interesting = interesting;
	}
	public String getPossibility() {
		return possibility;
	}
	public void setPossibility(String possibility) {
		this.possibility = possibility;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
}
