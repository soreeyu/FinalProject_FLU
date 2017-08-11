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
	
	
	public List<ProjectDTO>failList(Map<String, Object> map){
		return sqlSession.selectList(NAMESPACE+"failList",map);
	}
		
	
	//입금대기중 리스트 불러오기
	public List<ProjectDTO>waitList(Map<String, Object> map){
		return sqlSession.selectList(NAMESPACE+"waitList",map);
	}
	
	public List<ProjectDTO>finishList(Map<String, Object> map){
		return sqlSession.selectList(NAMESPACE+"finishList",map);
	}

	public List<ProjectDTO>cancelList(Map<String, Object> map){
		return sqlSession.selectList(NAMESPACE+"cancelList",map);
	}
	
	
	
	
	public List<String> supportList(ListInfo listInfo){
		return sqlSession.selectList(NAMESPACE+"supportList",listInfo);
	}

	public int update(ProjectDTO projectDTO){
		return sqlSession.update(NAMESPACE+"update",projectDTO);
	}

	public int checkCount(Map<String, Object> map){
		return sqlSession.selectOne(NAMESPACE+"checkCount",map);
	}

	public int makeFail(String finishDate){
		return sqlSession.update(NAMESPACE+"makeFail",finishDate);
	}

}
