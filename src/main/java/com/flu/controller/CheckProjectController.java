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

import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;
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
	private ClientService clientService;

	@Inject
	private MemberService memberService;
	@Inject
	private AlarmService alarmService;
	private AlarmDTO alarmDTO;

	
	//검수전 프로젝트 들고오기
	@RequestMapping(value="checkProjectCheckList", method=RequestMethod.GET)
	public String checkProjectCheckList(ListInfo listInfo,ProjectDTO projectDTO,String searchDate,Model model) throws Exception{
		

		String [] ar = {"check","done"};
		listInfo.setProject(ar);
		
		List<ProjectDTO> list = checkProjectService.checkList(projectDTO,listInfo,searchDate);
		
		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "Check").addAttribute("searchDate", searchDate);
		
		return "checkProject/checkList";
	}

	//모집 실패한 프로젝트 들고오기
	@RequestMapping(value="checkProjectFailList", method=RequestMethod.GET)
	public String checkProjectFailList(ProjectDTO projectDTO, ListInfo listInfo,String searchDate,Model model){
		
		String [] ar = {"fail"};
		listInfo.setProject(ar);
		
		List<ProjectDTO> list = checkProjectService.failList(projectDTO,listInfo,searchDate);

		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "Fail").addAttribute("searchDate", searchDate);
		return "checkProject/checkList";
	}
	
	//입금대기중인 프로젝트 불러오기
	@RequestMapping(value="checkProjectWaitList", method=RequestMethod.GET)
	public String checkProjectWaitList(ProjectDTO projectDTO, ListInfo listInfo,Model model,String searchDate){

		String [] ar = {"wait","ing"};
		listInfo.setProject(ar);
	
		List<ProjectDTO> list = checkProjectService.waitList(projectDTO,listInfo,searchDate);

		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "Wait").addAttribute("searchDate", searchDate);
		return "checkProject/checkList";
	}

	//완료된 프로젝트 불러오기 (프리랜서 급여주려고)
	@RequestMapping(value="checkProjectFinishList", method=RequestMethod.GET)
	public String checkProjectDoneList(ProjectDTO projectDTO, ListInfo listInfo,Model model,String searchDate){
		
		if(listInfo.getMemberName()==null){
			listInfo.setMemberName("");
		}
		if(listInfo.getType()==null){
			listInfo.setType("");
		}
		
		System.out.println("컨트롤러-------------------------------------------");
		System.out.println("카테고리:"+projectDTO.getCategory());
		System.out.println("디테일카테고리:"+projectDTO.getDetailCategory());
		System.out.println("프로젝트명:"+projectDTO.getName());
		System.out.println("프리랜서명:"+listInfo.getMemberName());
		System.out.println("프리랜서 종류:"+listInfo.getType());
		System.out.println("기간: "+searchDate);
		
		List<String> projectList = checkProjectService.supportList(listInfo);
		
		String [] ar = {"finish"};
		listInfo.setProject(ar);
		
		List<ProjectDTO> list = checkProjectService.finishList(projectDTO,listInfo,searchDate,projectList);
		
		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "Finish").addAttribute("searchDate", searchDate);
		return "checkProject/checkList";
	}

	//중단요청 프로젝트들고오기
	@RequestMapping(value="checkProjectCancelList", method=RequestMethod.GET)
	public String checkProjectCancelList(ProjectDTO projectDTO, ListInfo listInfo,Model model,String searchDate){

		String [] ar = {"recruit","ing","wait","cancel"};
		
		listInfo.setProject(ar);
	
		List<ProjectDTO> list = checkProjectService.cancelList(projectDTO,listInfo,searchDate);

		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "Cancel").addAttribute("searchDate", searchDate);
		return "checkProject/checkList";
	}
	
	
	
	//입금대기중 프로젝트의 클라이언트 정보 AJAX로 불러오기
	@RequestMapping(value="checkWait")
	public String checkWait(ProjectDTO projectDTO,Model model){
		
		MemberDTO memberDTO = clientService.memberView(projectDTO.getEmail());
		ProjectDTO projectDTO2 = projectService.projectView(projectDTO);
		
		model.addAttribute("client", memberDTO).addAttribute("projectNum", projectDTO.getProjectNum()).addAttribute("state",projectDTO.getState()).addAttribute("budget", projectDTO2.getBudget());
		
		
		return "checkProject/checkWait";
	}
	
	
	//프로젝트 검수완료 및 진행하기
	@RequestMapping(value="checkProjectUpdate",method=RequestMethod.GET)
	public String update(ProjectDTO projectDTO, RedirectAttributes ra) throws Exception{
		
		int result = checkProjectService.update(projectDTO);
		
		String path = "redirect:/project/projectView?projectNum="+projectDTO.getProjectNum();
		
		if(projectDTO.getState().equals("cancel")){
			path = "redirect:/checkProject/checkProjectCancelList";
		}
		
		if(result>0){
			alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(projectDTO.getEmail());
			alarmDTO.setContents("등록하신 프로젝트의 검수가 완료 되었습니다.");
			alarmService.alarmInsert(alarmDTO);
			ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
		}

		return path;
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
	
	

	
	

}
