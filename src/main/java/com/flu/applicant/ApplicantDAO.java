package com.flu.applicant;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.project.ProjectDTO;

@Repository
public class ApplicantDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "ApplicantMapper.";
	
	
	//지원자 List 불러오기
	public List<ApplicantDTO> list(int projectNum){
		
		return sqlSession.selectList(NAMESPACE+"list", projectNum);
	}
	
	//지원자 List 불러오기
	public int ingCount(int projectNum){
			
		return sqlSession.selectOne(NAMESPACE+"ingCount", projectNum);
	}
	
	//지원자 update
	public int appUpdate(String email){
		return sqlSession.update(NAMESPACE+"update", email);
	}
	
	public Integer checkApp(String email){
		return sqlSession.selectOne(NAMESPACE+"checkApp", email);
	}
	
	
	//지원하기누르면 추가되는 insert
	public int insertApplicant(ApplicantDTO applicantDTO){
		System.out.println("applicant-dao");
		return sqlSession.insert(NAMESPACE+"insertApplicant", applicantDTO);
	}
	
	//지원했는지 체크해보기
	public int checkApplicant(ApplicantDTO applicantDTO){
		System.out.println("checkApplicant-dao");
		System.out.println(applicantDTO.getEmail());
		return sqlSession.selectOne(NAMESPACE+"checkApplicant", applicantDTO);
	}
	
	//지원자 수 카운트하기
	public int countApplicant(int projectNum){
		System.out.println("countApplicant-dao");
		System.out.println(projectNum);
		return sqlSession.selectOne(NAMESPACE+"countApplicant", projectNum);
	}
	
	public int deleteApplicant(ApplicantDTO applicantDTO){
		System.out.println("delete-applicant-dao");
		System.out.println("email=="+applicantDTO.getEmail());
		System.out.println("projectNum=="+applicantDTO.getProjectNum());
	
		return sqlSession.delete(NAMESPACE+"deleteApplicant", applicantDTO);
	}
}
