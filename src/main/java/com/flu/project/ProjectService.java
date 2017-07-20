package com.flu.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.util.ListInfo;

@Service
public class ProjectService {

	@Inject
	private ProjectDAO projectDAO;
	
	//project insert
	public int projectInsert(ProjectDTO projectDTO){
		return projectDAO.projectInsert(projectDTO);
	}
	
	//project update
	public int projectUpdate(ProjectDTO projectDTO){
		return projectDAO.projectUpdate(projectDTO);
	}
	
	//project delete
	public int projectDelete(int num){
		return projectDAO.projectDelete(num);
	}
	
	//project View
	public ProjectDTO projectView(int num){
		return projectDAO.projectView(num);
	}
	
	//project List
	public List<ProjectDTO> projectList(ListInfo listInfo){
		return projectDAO.projectList(listInfo);
	}
	
	public List<ProjectDTO> projectListM(ListInfo listInfo){
		return projectDAO.projectListM(listInfo);
	}
	
	//project Count
	public int projectCount(ListInfo listInfo){
		return projectDAO.projectCount(listInfo);
	}
}
