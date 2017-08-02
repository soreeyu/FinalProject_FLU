package com.flu.project;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		
		System.out.println("projectSkillparsing");
		
		List<ProjectDTO> list = projectDAO.projectList(listInfo);
		
		for(int i=0;i<list.size();i++){
			String[] parsing = list.get(i).getSkill().split(",");
			list.get(i).setSkills(parsing);
			/*System.out.println(parsing[i]);*/
		}
		
		
		//return projectDAO.projectList(listInfo);
		return list;
	}
	
	

	//project Count
	public int projectCount(ListInfo listInfo){
		return projectDAO.projectCount(listInfo);
	}
}
