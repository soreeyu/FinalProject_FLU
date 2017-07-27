package com.flu.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.flu.member.MemberDTO;
import com.flu.reply.ReplyDTO;
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
	public List<ProjectDTO> projectList(ListInfo listInfo, ProjectDTO projectDTO, List<String> array){
		//System.out.println("checklist service"+checkList.get(0));
		System.out.println("projectService-projectList");
		List<ProjectDTO> list = projectDAO.projectList(listInfo, projectDTO, array);
		
		for(int i=0;i<list.size();i++){
			String[] parsing = list.get(i).getSkill().split(",");
			list.get(i).setSkills(parsing);
		
		}
		
		return list;
	}
	

	//project Count
	public int projectCount(ListInfo listInfo, ProjectDTO projectDTO){
		return projectDAO.projectCount(listInfo, projectDTO);
	}
	
	
	
	
	
	
	//Client가 mypage에서 확인하는 myprojectList
	public List<ProjectDTO> clientPjList(ListInfo listInfo, MemberDTO memberDTO, ProjectDTO projectDTO){

		
		List<ProjectDTO> ar =  projectDAO.clientPjList(listInfo, memberDTO, projectDTO);
		System.out.println("service의 ar=="+ar);
		
		for(int i=0;i<ar.size();i++){
			System.out.println(ar.get(i).getSkill());
			String[] parsing = ar.get(i).getSkill().split(",");
			System.out.println(parsing.length);
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
}
