package com.flu.applicant;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ApplicantService {
	
	@Inject
	private ApplicantDAO applicantDAO;
	
	public List<ApplicantDTO> list(int projectNum){
		System.out.println("프로젝트넘:"+projectNum);
	
		return applicantDAO.list(projectNum);
	}
	
	
}
