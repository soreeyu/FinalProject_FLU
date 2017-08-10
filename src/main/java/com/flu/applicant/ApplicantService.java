package com.flu.applicant;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.project.ProjectDTO;

@Service
public class ApplicantService {
	
	@Inject
	private ApplicantDAO applicantDAO;
	
	//applicant List
	public List<ApplicantDTO> list(int projectNum){
		return applicantDAO.list(projectNum);
	}
	
	//chat List
	public List<ApplicantDTO> chatList(int projectNum){
		return applicantDAO.chatList(projectNum);
	}
	
	
	// state update
	public int appUpdate(String email){
		return applicantDAO.appUpdate(email);
	}
	
	
	//지원하기 누르면 지원자 추가
	public int insertApplicant(ApplicantDTO applicantDTO){
		System.out.println("applicant-service");
		return applicantDAO.insertApplicant(applicantDTO);
	}
	
	//지원했는지 체크해보기
	public int checkApplicant(ApplicantDTO applicantDTO){
		System.out.println("checkApplicant-service");
		return applicantDAO.checkApplicant(applicantDTO);
	}
	
	//지원자 수 카운트하기
	public int countApplicant(int projectNum){			
		System.out.println("countApplicant-service");
		return applicantDAO.countApplicant(projectNum);
	}
	
	public int deleteApplicant(ApplicantDTO applicantDTO){
		System.out.println("applicant-service-delete");
		return applicantDAO.deleteApplicant(applicantDTO);
	}
	
}
