package com.flu.test;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;

import com.flu.applicant.ApplicantDAO;
import com.flu.applicant.ApplicantDTO;
import com.flu.freelancer.FreelancerDAO;
import com.flu.freelancer.FreelancerDTO;
import com.flu.member.MemberDTO;
import com.flu.profile.Evaluation;
import com.flu.project.ProjectDTO;
import com.flu.util.ListInfo;

public class FreelancerTest extends MyAbstract{

	
	@Inject
	private FreelancerDAO freelancerDAO;
	
	@Inject
	private ApplicantDAO applicantDAO;
	/*
	@Test
	public void test22(){
		System.out.println("dddd");
	}*/
	/*
	public void Test(){
		FreelancerDTO freelancerDTO = new FreelancerDTO();
		freelancerDTO.setEmail("jk930@naver.com");
		freelancerDTO.setIntro("안녕하세요2");
		freelancerDAO.introInsert(freelancerDTO);
	}
	
	public void Test2(){
		FreelancerDTO freelancerDTO = new FreelancerDTO();
		freelancerDTO.setEmail("test@naver.com");
		freelancerDTO.setJobKind("개발");
		freelancerDTO.setInteresting("웹");
		freelancerDTO.setPossibility("활동가능");
		freelancerDAO.infoInsert(freelancerDTO);
	}
	*/
	//프리랜서 리스트
/*	
	public void Test3(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		//freelancerDAO.freelancerList("웹");
		
		List<MemberDTO> member = (List<MemberDTO>)map.get("member");
		List<FreelancerDTO> free = (List<FreelancerDTO>)map.get("freelancer");
		List<Evaluation> eval = (List<Evaluation>)map.get("evaluation");
		
		System.out.println(member.get(0).getEmail());
		System.out.println(free.get(0).getEmail());
		System.out.println(eval.get(0).getToEmail());
		
	}*/
	/*@Test
	public void Test4(){
		MemberDTO memberDTO = new MemberDTO();
		ListInfo listInfo = new ListInfo();
		ApplicantDTO applicantDTO = new ApplicantDTO();

		memberDTO.setEmail("bobobo");
		int result= freelancerDAO.countAll(memberDTO, listInfo, applicantDTO);
		
		assertEquals(4, result);
	}*/
	@Test
	public void Test5(){
		ApplicantDTO applicantDTO = new ApplicantDTO();
		applicantDTO.setProjectNum(201);
		applicantDTO.setState("app");
		applicantDTO.setEmail("bobobo");
		applicantDTO.setPay(3000);
		int result = applicantDAO.insertApplicant(applicantDTO);
		
		assertEquals(1, result);
	}
}
