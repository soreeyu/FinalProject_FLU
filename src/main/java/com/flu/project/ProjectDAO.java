package com.flu.project;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flu.util.ListInfo;

@Repository
public class ProjectDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="ProjectMapper.";
	
	
		//project write
		public int projectWrite(ProjectDTO projectDTO){
			return sqlSession.insert(NAMESPACE+"write", projectDTO);
		}
		
		//project update
		public int projectUpdate(ProjectDTO projectDTO){
			return 0;
		}
		
		//project delete
		public int projectDelete(int num){
			return 0;
		}
		
		//project View
		public ProjectDTO projectView(int num){
			return null;
		}
		
		//project List
		public List<ProjectDTO> projectList(ListInfo listInfo){
			return null;
		}
		
		//project Count
		public int projectCount(ListInfo listInfo){
			return 0;
		}
		
		
}
