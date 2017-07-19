package com.flu.controller;

import java.util.List;

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
	
	
	//검수전, 진행전 프로젝트 리스트 불러오기
	@RequestMapping(value="checkProjectList")
	public String listCheck(ListInfo listInfo,Model model){
		System.out.println(listInfo.getCategory());
		System.out.println(listInfo.getDetailCategory());
		System.out.println(listInfo.getSearch());
		System.out.println(listInfo.getKind());
		
		List<ProjectDTO> list = checkProjectService.listCheck(listInfo);
		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "project");
		return "checkProject/checkList";
	}
	
	@RequestMapping(value="checkProjectUpdate",method=RequestMethod.GET)
	public String update(ProjectDTO projectDTO){
		
			int result = checkProjectService.update(projectDTO);

		return "redirect:/project/projectView?projectNum="+projectDTO.getProjectNum();
	}
	
	//완료된 프로젝트 리스트 불러오기
	@RequestMapping(value="checkCashList")
	public String listCash(ListInfo listInfo,Model model){
		List<ProjectDTO> list = checkProjectService.listCash(listInfo);
		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "cash");
		return "checkProject/checkList";
	}
	
	@RequestMapping(value="checkCashView")
	public String viewCash(Integer projectNum,Model model){
		
		//지원자 리스트 들고오기
		model.addAttribute("applicant", applicantService.list(projectNum));
		//프로젝트 리스트 들고오기
		model.addAttribute("project",projectService.projectView(projectNum));
		
		return "checkProject/checkCashView";
	}

	//클라이언트 이름으로 3개의 테이블에서 정보 들고오기 window.open
	@RequestMapping(value="clientInfo")
	public void clientInfo(String email,Model model){
		
		ClientDTO client = clientService.clientView(email);
		Evaluation evaluation = clientService.evaluationView(email);
		MemberDTO member = clientService.memberView(email);
		
		model.addAttribute("client", client);
		model.addAttribute("evaluation", evaluation);
		model.addAttribute("member", member);
	
	}
	
	//Ajax로 프리랜서 보여주기 member Table만 view 해오는 것
	@RequestMapping(value="memberInfo",method=RequestMethod.GET)
	public void memberCash(String email,Integer pay,Model model){
		
		model.addAttribute("memberDTO", memberService.memberView(email));
		model.addAttribute("pay", pay*0.9);
	}
	
	//지원자의 상태 업데이트 (돈을 지급했다고 payFinish로 변경)
	@RequestMapping(value="appUpdate")
	public String appUpdate(String email,Integer projectNum){
		int result = applicantService.appUpdate(email);
		
		return "redirect:/checkProject/checkCashView?projectNum="+projectNum;
	}
	
}
