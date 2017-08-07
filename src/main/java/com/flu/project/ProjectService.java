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
	public ProjectDTO projectView(ProjectDTO projectDTO){
		System.out.println("projectView에서 skill파싱하기");
		System.out.println("num=="+projectDTO.getProjectNum());
		
		projectDTO = projectDAO.projectView(projectDTO.getProjectNum());
		System.out.println("projectnum=="+projectDTO.getProjectNum());
		/*System.out.println(projectDTO.getSkill());*/
		
		/*System.out.println("parr=="+projectDTO.getSkill().split(","))*/;
		
		projectDTO.setSkills(projectDTO.getSkill().split(","));
		
		/*System.out.println("skill[]=="+projectDTO.getSkills().length);*/
		
		
		return projectDTO;
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
			
		}
		
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
		
		
	
		return ar;
	}
	
	//Client ProjectList의 Count
	public int clientPjCount(ListInfo listInfo, MemberDTO memberDTO, ProjectDTO projectDTO){
		System.out.println("service들어옴");
		
		int count = projectDAO.clientPjCount(listInfo, memberDTO, projectDTO);
		System.out.println("service부분="+count);
		return projectDAO.clientPjCount(listInfo, memberDTO, projectDTO);
	}
	
	
	public int sellingCount(ProjectDTO projectDTO){
		System.out.println("contractCount Service 들어옴");
		
		return projectDAO.sellingCount(projectDTO);
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
	

	//View에서 해당프로젝트에서 뿌려주는 프로젝트등록자 img
	public MemberDTO projectImg(ProjectDTO projectDTO){
		return projectDAO.projectImg(projectDTO);
	}
	
	
	//프로젝트 리스트에서 뿌려주는 recruit상태의 프로젝트 갯수
	public int projectListcount(ProjectDTO projectDTO){
		return projectDAO.projectListcount(projectDTO);
	}
	
	
	//프로젝트 리스트에서 뿌려주는 급구리스트
	public List<ProjectDTO> quickList(ProjectDTO projectDTO, ListInfo listInfo){
		
		List<ProjectDTO> ar =  projectDAO.quickList(projectDTO, listInfo);
		System.out.println("service의 quick-ar=="+ar);
		
		for(int i=0;i<ar.size();i++){
			System.out.println(ar.get(i).getSkill());
			String[] parsing = ar.get(i).getSkill().split(",");
			
			for(int j=0;j<parsing.length;j++){
				ar.get(i).setSkills(parsing);				
			}
			System.out.println(ar.get(i).getSkills());
		}
		return ar;
	}
	
	
	//프로젝트 리스트에서 뿌려주는 급구리스트 카운트
	public int quickCount(ProjectDTO projectDTO){
		System.out.println("quickCount-service");
		return projectDAO.quickCount(projectDTO);
	}
}
