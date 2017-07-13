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
	
	public List<ProjectDTO> list(ListInfo listInfo){
		return sqlSession.selectList(NAMESPACE+"list",listInfo);
	}
	
	public int update(ProjectDTO projectDTO){
		return sqlSession.update(NAMESPACE+"update",projectDTO);
	}
	
}
