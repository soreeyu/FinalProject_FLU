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
	
}
