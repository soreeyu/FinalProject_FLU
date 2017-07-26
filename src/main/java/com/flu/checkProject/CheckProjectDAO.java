package com.flu.checkProject;

import java.util.List;

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
	public List<ProjectDTO> checkList(ListInfo listInfo){
		return sqlSession.selectList(NAMESPACE+"checkList",listInfo);
	}
	
	
	public List<ProjectDTO>failList(ListInfo listInfo){
		return sqlSession.selectList(NAMESPACE+"failList",listInfo);
	}
	
	public List<ProjectDTO>waitList(ListInfo listInfo){
		return sqlSession.selectList(NAMESPACE+"waitList",listInfo);
	}
	
	public List<ProjectDTO>finishList(ListInfo listInfo){
		return sqlSession.selectList(NAMESPACE+"finishList",listInfo);
	}
	
	
	
	
	
	
	public int update(ProjectDTO projectDTO){
		return sqlSession.update(NAMESPACE+"update",projectDTO);
	}

	
	
	
}
