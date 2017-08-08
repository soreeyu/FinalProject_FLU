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
	
	
	
	
}
