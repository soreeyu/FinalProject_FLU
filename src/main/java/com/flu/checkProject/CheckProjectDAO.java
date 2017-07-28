package com.flu.checkProject;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.project.ProjectDTO;
import com.flu.util.ListInfo;

@Repository
public class CheckProjectDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "CheckProjectMapper.";
	
	//**********프로젝트 검수 관리**************
	
	//검수 전 프로젝트 리스트 들고오기
	public List<ProjectDTO> checkList(Map<String, Object> map){
		return sqlSession.selectList(NAMESPACE+"checkList",map);
	}
	
/*	
	public List<ProjectDTO>failList(ListInfo listInfo){
		return sqlSession.selectList(NAMESPACE+"failList",listInfo);
	}
		*/
	
	//입금대기중 리스트 불러오기
	public List<ProjectDTO>waitList(Map<String, Object> map){
		return sqlSession.selectList(NAMESPACE+"waitList",map);
	}
	
	public List<ProjectDTO>finishList(Map<String, Object> map){
		return sqlSession.selectList(NAMESPACE+"finishList",map);
	}

	
	
	
	
	public List<String> supportList(String memberName){
		return sqlSession.selectList(NAMESPACE+"supportList",memberName);
	}
	
	public int update(ProjectDTO projectDTO){
		return sqlSession.update(NAMESPACE+"update",projectDTO);
	}

	
	
	
}
