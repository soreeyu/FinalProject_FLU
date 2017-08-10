package com.flu.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flu.applicant.ApplicantDTO;
import com.flu.member.MemberDTO;
import com.flu.project.sell.PjSellDTO;
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
		System.out.println("projectView - service");
		System.out.println("num=="+projectDTO.getProjectNum());
		
		projectDTO = projectDAO.projectView(projectDTO.getProjectNum());
		System.out.println(projectDTO.getSkill());
		projectDTO.setSkills(projectDTO.getSkill().split(","));
				
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
	
	public List<ApplicantDTO> applicantList(ListInfo listInfo, MemberDTO memberDTO, ProjectDTO projectDTO){
			
		return projectDAO.applicantList(listInfo, memberDTO, projectDTO);
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
	public MemberDTO projectClient(ProjectDTO projectDTO){
		return projectDAO.projectClient(projectDTO);
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
	
	//pjsell update가 아닌 pjsell에 등록했을 때, project상태바꾸기
	public int updateProjectState(PjSellDTO pjSellDTO){
		return projectDAO.updateProjectState(pjSellDTO);
	}
	
	//pjsell update가 아닌 pjsell에서 취소했을 때, project상태 finish로 바꾸기
	public int cancleProjectState(PjSellDTO pjSellDTO){
		return projectDAO.cancleProjectState(pjSellDTO);
	}
	

	
	//지원자 선택 서비스
	public int applicantCheck(String paycheck, Integer projectNum){
		List<String> ar = projectDAO.applicantEmailList(projectNum);
		projectDAO.projectUpdateRecruit(projectNum);
		List<String> emailList = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		if(ar.size() > 0){
		for(int i=0; i<ar.size(); i++){
			System.out.println("이메일 목록 :"+ar.get(i));
			if(paycheck.contains(ar.get(i))){
				emailList.add(ar.get(i));
			}
		}
		}
		System.out.println("선택받은 놈수:"+emailList.size());
		map.put("emailList", emailList);
		map.put("projectNum", projectNum);
		return projectDAO.applicantUpdateMeet(map);
	}
	//계약 완료 서비스(모집완료에서 금액,시작일 입력)
	public int applicantMeet(String pay , ProjectDTO projectDTO){
		List<String> ar = projectDAO.meetList(projectDTO.getProjectNum());
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> payList2 = new ArrayList<String>();
		String [] payList = pay.split(",");
		int budget = 0;
		for(String pay1 : payList){
			System.out.println("페이 :"+pay1);
			payList2.add(pay1);
			budget = budget+Integer.parseInt(pay1);
		}
		projectDTO.setBudget(budget);
		projectDAO.projectUpdateIng(projectDTO);
		map.put("pay", payList2);
		map.put("emailList", ar);
		map.put("dto", projectDTO);
		
		
		return projectDAO.applicantUpdateIng(map);
	}
	

	//index에 뿌려질 등록된 프로젝트 금액
	public int totalBudget() throws Exception{
		return projectDAO.totalBudget();
	}
	//index에 뿌려질 등록된 프로젝트리스트( 높은 금액순)
	public List<ProjectDTO> indexProjectList () throws Exception{
		return projectDAO.indexProjectList();
	}

}
