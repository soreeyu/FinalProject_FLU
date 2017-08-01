package com.flu.applicant;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.util.ListInfo;

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

	

}
