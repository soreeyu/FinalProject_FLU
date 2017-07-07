package com.flu.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.util.ListInfo;

@Service
public class ProjectService {

	@Inject
	private ProjectDAO projectDAO;
	
	//project write
	public int projectWrite(ProjectDTO projectDTO){
		return projectDAO.projectWrite(projectDTO);
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
