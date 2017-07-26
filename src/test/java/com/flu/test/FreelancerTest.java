package com.flu.test;

import javax.inject.Inject;

import org.junit.Test;

import com.flu.freelancer.FreelancerDAO;
import com.flu.freelancer.FreelancerDTO;

public class FreelancerTest extends MyAbstract{

	
	@Inject
	private FreelancerDAO freelancerDAO;
	
	
	public void Test(){
		FreelancerDTO freelancerDTO = new FreelancerDTO();
		freelancerDTO.setEmail("jk930@naver.com");
		freelancerDTO.setIntro("안녕하세요2");
		freelancerDAO.introInsert(freelancerDTO);
	}
	@Test
	public void Test2(){
		FreelancerDTO freelancerDTO = new FreelancerDTO();
		freelancerDTO.setEmail("test@naver.com");
		freelancerDTO.setJobKind("개발");
		freelancerDTO.setInteresting("웹");
		freelancerDTO.setPossibility("활동가능");
		freelancerDAO.infoInsert(freelancerDTO);
	}
	
}
