package com.flu.project;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.flu.member.MemberDTO;
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
		System.out.println("sevice-projectNum="+projectDTO.getProjectNum());
		System.out.println("sevice-project-name="+projectDTO.getName());
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
	public List<ProjectDTO> projectList(ListInfo listInfo, ProjectDTO projectDTO, List<String> array){
		
		System.out.println("projectSkillparsing");
		
		System.out.println("service-list-search==="+listInfo.getSearch());
		System.out.println("projectService-projectList");
		List<ProjectDTO> list = projectDAO.projectList(listInfo, projectDTO, array);

		
		for(int i=0;i<list.size();i++){
			String[] parsing = list.get(i).getSkill().split(",");
			list.get(i).setSkills(parsing);
			/*System.out.println(parsing[i]);*/
		}
		
		
		//return projectDAO.projectList(listInfo);
		return list;
	}
	
	

	//project Count
	public int projectCount(ListInfo listInfo, ProjectDTO projectDTO, List<String> array){
		System.out.println("service-count-search==="+listInfo.getSearch());
		return projectDAO.projectCount(listInfo, projectDTO, array);
	}

	
	//Client가 mypage에서 확인하는 myprojectList
	public List<ProjectDTO> clientPjList(ListInfo listInfo, MemberDTO memberDTO, ProjectDTO projectDTO){

		
		List<ProjectDTO> ar =  projectDAO.clientPjList(listInfo, memberDTO, projectDTO);
		System.out.println("service의 ar=="+ar);
		
		for(int i=0;i<ar.size();i++){
			System.out.println(ar.get(i).getSkill());
			String[] parsing = ar.get(i).getSkill().split(",");
			
			for(int j=0;j<parsing.length;j++){
				ar.get(i).setSkills(parsing);				
			}
			System.out.println(ar.get(i).getSkills());
		}
		
		System.out.println("dao-detailCategory="+ar.get(0).getDetailCategory());
	
		return ar;
	}
	
	//Client ProjectList의 Count
	public int clientPjCount(ListInfo listInfo, MemberDTO memberDTO, ProjectDTO projectDTO){
		System.out.println("service들어옴");
		
		int count = projectDAO.clientPjCount(listInfo, memberDTO, projectDTO);
		System.out.println("service부분="+count);
		return projectDAO.clientPjCount(listInfo, memberDTO, projectDTO);
	}
	
	
	public int contractCount(ProjectDTO projectDTO){
		System.out.println("contractCount Service 들어옴");
		
		return projectDAO.contractCount(projectDTO);
	}
	
	public int ingCount(ProjectDTO projectDTO){
		System.out.println("ingCount Service 들어옴");
		
		return projectDAO.ingCount(projectDTO);
	}
	
	public int finishCount(ProjectDTO projectDTO){
		System.out.println("finishCount Service 들어옴");
		
		return projectDAO.finishCount(projectDTO);
	}
	
	public int pjCount(ProjectDTO projectDTO){
		System.out.println("pjCount Service 들어옴");
		
		return projectDAO.pjCount(projectDTO);
	}
	
	public int sellCount(ProjectDTO projectDTO){
		System.out.println("sellCount service 들어옴");
		
		return projectDAO.sellCount(projectDTO);
	}
	
	public List<ProjectDTO> sellList(ProjectDTO projectDTO, ListInfo listInfo){
		System.out.println("sellList service 들어옴");
		
		return projectDAO.sellList(projectDTO, listInfo);
	}
	
}
