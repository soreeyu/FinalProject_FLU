package com.flu.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.applicant.ApplicantDAO;
import com.flu.applicant.ApplicantDTO;
import com.flu.applicant.ApplicantService;
import com.flu.checkProject.CheckProjectService;
import com.flu.client.ClientDTO;
import com.flu.client.ClientService;
import com.flu.member.MemberDTO;
import com.flu.member.MemberService;
import com.flu.profile.Evaluation;
import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.util.ListInfo;

@Controller
@RequestMapping("/checkProject/**")
public class CheckProjectController {

	@Inject
	private CheckProjectService checkProjectService;
	@Inject
	private ProjectService projectService;
	@Inject
	private ApplicantService applicantService;
	@Inject
	private ClientService clientService;
	@Inject
	private MemberService memberService;
	
	//검수전 프로젝트 들고오기
	@RequestMapping(value="checkProjectCheckList", method=RequestMethod.GET)
	public String checkProjectCheckList(ListInfo listInfo,ProjectDTO projectDTO,Model model) throws Exception{
		
		
		if(projectDTO.getCategory()==null){
			projectDTO.setCategory("");
		}
		if(projectDTO.getDetailCategory()==null){
			projectDTO.setDetailCategory("");
		}
		if(projectDTO.getPlanState()==null){
			projectDTO.setPlanState("");
		}
		if(projectDTO.getName()==null){
			projectDTO.setName("");
		}
		if(projectDTO.getEmail()==null){
			projectDTO.setEmail("");
		}
		if(projectDTO.getStartDate()==null){
			projectDTO.setStartDate("");
		}
		if(projectDTO.getFinishDate()==null){
			projectDTO.setFinishDate("");
		}
		if(projectDTO.getReg_date()==null){
			projectDTO.setReg_date("");
		}
		
		String [] ar = {"check","done"};
		listInfo.setProject(ar);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("projectDTO", projectDTO);
		
		List<ProjectDTO> list = checkProjectService.checkList(map);
		

		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "check").addAttribute("projectDTO", projectDTO);
		
		return "checkProject/checkList";
	}
/*
	//모집 실패한 프로젝트 들고오기
	@RequestMapping(value="checkProjectFailList", method=RequestMethod.GET)
	public String checkProjectFailList(ListInfo listInfo,Model model){

		System.out.println(listInfo.getSearch());
		System.out.println(listInfo.getKind());
		
		String [] ar = {"fail"};
		listInfo.setProject(ar);

		List<ProjectDTO> list = checkProjectService.failList(listInfo);

		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "fail");
		return "checkProject/checkList";
	}*/
	
	//입금대기중인 프로젝트 불러오기
	@RequestMapping(value="checkProjectWaitList", method=RequestMethod.GET)
	public String checkProjectWaitList(ProjectDTO projectDTO, ListInfo listInfo,Model model){

		if(projectDTO.getCategory()==null){
			projectDTO.setCategory("");
		}
		if(projectDTO.getDetailCategory()==null){
			projectDTO.setDetailCategory("");
		}
		if(projectDTO.getPlanState()==null){
			projectDTO.setPlanState("");
		}
		if(projectDTO.getName()==null){
			projectDTO.setName("");
		}
		if(projectDTO.getEmail()==null){
			projectDTO.setEmail("");
		}
		if(projectDTO.getStartDate()==null){
			projectDTO.setStartDate("");
		}
		if(projectDTO.getFinishDate()==null){
			projectDTO.setFinishDate("");
		}
		if(projectDTO.getReg_date()==null){
			projectDTO.setReg_date("");
		}
		
		
		
		String [] ar = {"wait","ing"};
		listInfo.setProject(ar);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("projectDTO", projectDTO);
		
		List<ProjectDTO> list = checkProjectService.waitList(map);

		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "wait");
		return "checkProject/checkList";
	}

	//완료된 프로젝트 불러오기 (프리랜서 급여주려고)
	@RequestMapping(value="checkProjectFinishList", method=RequestMethod.GET)
	public String checkProjectDoneList(ProjectDTO projectDTO,ListInfo listInfo,String memberName,Model model){

		if(projectDTO.getCategory()==null){
			projectDTO.setCategory("");
		}
		if(projectDTO.getDetailCategory()==null){
			projectDTO.setDetailCategory("");
		}
		if(projectDTO.getPlanState()==null){
			projectDTO.setPlanState("");
		}
		if(projectDTO.getName()==null){
			projectDTO.setName("");
		}
		if(projectDTO.getEmail()==null){
			projectDTO.setEmail("");
		}
		if(projectDTO.getStartDate()==null){
			projectDTO.setStartDate("");
		}
		if(projectDTO.getFinishDate()==null){
			projectDTO.setFinishDate("");
		}
		if(projectDTO.getReg_date()==null){
			projectDTO.setReg_date("");
		}
		if(memberName==null){
			memberName="";
		}
		
		List<String> projectNumList = checkProjectService.supportList(memberName);
		
		for(int i=0;i<projectNumList.size();i++){
			System.out.println(projectNumList.get(i));	
		}
		
		
		String [] ar = {"finish"};
		listInfo.setProject(ar);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("projectDTO", projectDTO);
		map.put("projectNumList", projectNumList);
		
		List<ProjectDTO> list = checkProjectService.finishList(map);

		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "finish");
		return "checkProject/checkList";
	}

	//입금대기중 프로젝트의 클라이언트 정보 AJAX로 불러오기
	@RequestMapping(value="checkWait")
	public String checkWait(ProjectDTO projectDTO,Model model){
		
		MemberDTO memberDTO = clientService.memberView(projectDTO.getEmail());
		ProjectDTO projectDTO2 = projectService.projectView(projectDTO.getProjectNum());
		
		model.addAttribute("client", memberDTO).addAttribute("projectNum", projectDTO.getProjectNum()).addAttribute("state",projectDTO.getState()).addAttribute("budget", projectDTO2.getBudget());
		
		
		return "checkProject/checkWait";
	}
	
	
	//프로젝트 검수완료 및 진행하기
	@RequestMapping(value="checkProjectUpdate",method=RequestMethod.GET)
	public String update(ProjectDTO projectDTO,Model model){
			
			int result = checkProjectService.update(projectDTO);
			MemberDTO memberDTO = clientService.memberView(projectDTO.getEmail());
			
			model.addAttribute("client", memberDTO).addAttribute("state", "ing");
			
		return "redirect:/checkProject/checkProjectWaitList";
	}
	

	//클라이언트 이름으로 3개의 테이블에서 정보 들고오기 window.open
	@RequestMapping(value="checkClientInfo")
	public void checkClientInfo(String email,Model model){
		
		ClientDTO client = clientService.clientView(email);
		Evaluation evaluation = clientService.evaluationView(email);
		MemberDTO member = clientService.memberView(email);
		
		model.addAttribute("client", client);
		model.addAttribute("evaluation", evaluation);
		model.addAttribute("member", member);
	
	}
	
/*	//Ajax로 프리랜서 보여주기 member Table만 view 해오는 것
	@RequestMapping(value="checkMemberInfo",method=RequestMethod.GET)
	public void checkMemberInfo(String email,Integer pay,Model model){
		
		model.addAttribute("memberDTO", memberService.memberView(email));
		model.addAttribute("pay", pay*0.9);
	}*/
	

	
}
