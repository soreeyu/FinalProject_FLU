package com.flu.applicant;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ApplicantDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "ApplicantMapper.";
	
	
	//지원자 List 불러오기
	public List<ApplicantDTO> list(int projectNum){
		
		return sqlSession.selectList(NAMESPACE+"list", projectNum);
	}
	
	//지원자 update
	public int appUpdate(String email){
		return sqlSession.update(NAMESPACE+"update", email);
	}
	
	
	//지원하기누르면 추가되는 insert
	public int insertApplicant(ApplicantDTO applicantDTO){
		return sqlSession.insert(NAMESPACE+"insertApplicant", applicantDTO);
	}
	
	
	
}
