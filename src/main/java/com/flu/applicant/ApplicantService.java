package com.flu.applicant;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ApplicantService {
	
	@Inject
	private ApplicantDAO applicantDAO;
	
	//applicant List
	public List<ApplicantDTO> list(int projectNum){
		return applicantDAO.list(projectNum);
	}
	
	
	// state update
	public int appUpdate(String email){
		return applicantDAO.appUpdate(email);
	}
	
	
	//지원하기 누르면 지원자 추가
	public int insertApplicant(ApplicantDTO applicantDTO){
		return applicantDAO.insertApplicant(applicantDTO);
	}
}
