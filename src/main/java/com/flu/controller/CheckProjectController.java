package com.flu.controller;

import java.util.List;

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
	private ApplicantService applicantService;
	@Inject
	private ClientService clientService;
	@Inject
	private MemberService memberService;
	@Inject
	private AlarmService alarmService;
	private AlarmDTO alarmDTO;
	
	//검수전 프로젝트 들고오기
	@RequestMapping(value="checkProjectCheckList", method=RequestMethod.GET)
	public String checkProjectCheckList(ListInfo listInfo,Model model){
		System.out.println(listInfo.getCategory());
		System.out.println(listInfo.getDetailCategory());
		System.out.println(listInfo.getSearch());
		System.out.println(listInfo.getKind());
	
		String [] ar = {"check","done"};
		listInfo.setProject(ar);
		System.out.println(listInfo.getProject().length);
		
		List<ProjectDTO> list = checkProjectService.checkList(listInfo);
		
		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "check");
		return "checkProject/checkList";
	}
	
	//모집 실패한 프로젝트 들고오기
	@RequestMapping(value="checkProjectFailList", method=RequestMethod.GET)
	public String checkProjectFailList(ListInfo listInfo,Model model){
		System.out.println(listInfo.getCategory());
		System.out.println(listInfo.getDetailCategory());
		System.out.println(listInfo.getSearch());
		System.out.println(listInfo.getKind());
		
		String [] ar = {"fail"};
		listInfo.setProject(ar);

		List<ProjectDTO> list = checkProjectService.checkList(listInfo);

		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "fail");
		return "checkProject/checkList";
	}
	
	//입금대기중인 프로젝트 불러오기
	@RequestMapping(value="checkProjectWaitList", method=RequestMethod.GET)
	public String checkProjectWaitList(ListInfo listInfo,Model model){
		System.out.println(listInfo.getCategory());
		System.out.println(listInfo.getDetailCategory());
		System.out.println(listInfo.getSearch());
		System.out.println(listInfo.getKind());
		
		String [] ar = {"wait","ing"};
		listInfo.setProject(ar);

		List<ProjectDTO> list = checkProjectService.waitList(listInfo);

		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "wait");
		return "checkProject/checkList";
	}
	
	//완료된 프로젝트 불러오기 (프리랜서 급여주려고)
	@RequestMapping(value="checkProjectFinishList", method=RequestMethod.GET)
	public String checkProjectDoneList(ListInfo listInfo,Model model){
		System.out.println(listInfo.getCategory());
		System.out.println(listInfo.getDetailCategory());
		System.out.println(listInfo.getSearch());
		System.out.println(listInfo.getKind());
		
		String [] ar = {"finish"};
		listInfo.setProject(ar);

		List<ProjectDTO> list = checkProjectService.finishList(listInfo);

		model.addAttribute("list", list).addAttribute("listInfo", listInfo).addAttribute("board", "finish");
		return "checkProject/checkList";
	}
	
	
	//프로젝트 검수완료하기
	@RequestMapping(value="checkProjectUpdate",method=RequestMethod.GET)
	public String update(ProjectDTO projectDTO) throws Exception{
		
		int result = checkProjectService.update(projectDTO);
		if(result>0){
			alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(projectDTO.getEmail());
			alarmDTO.setContents("등록하신 프로젝트의 검수가 완료 되었습니다.");
			alarmService.alarmInsert(alarmDTO);
		}
		return "redirect:/project/projectView?projectNum="+projectDTO.getProjectNum();
	}
	
	
	
	
	
	//**************대금관리************************
	
	
	//대금관리 뷰페이지로 가는거
	@RequestMapping(value="checkCashView")
	public String viewCash(Integer projectNum,Model model){
		
		//지원자 리스트 들고오기
		model.addAttribute("applicant", applicantService.list(projectNum));
		//프로젝트 리스트 들고오기
		model.addAttribute("project",projectService.projectView(projectNum));
		
		return "checkProject/checkCashView";
	}
	
	//지원자의 상태 업데이트 (돈을 지급했다고 payFinish로 변경)
	@RequestMapping(value="checkApplicantUpdate")
	public String checkApplicantUpdate(String email,Integer projectNum){
		int result = applicantService.appUpdate(email);
		
		return "redirect:/checkProject/checkCashView?projectNum="+projectNum;
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
	
	//Ajax로 프리랜서 보여주기 member Table만 view 해오는 것
	@RequestMapping(value="checkMemberInfo",method=RequestMethod.GET)
	public void checkMemberInfo(String email,Integer pay,Model model){
		
		model.addAttribute("memberDTO", memberService.memberView(email));
		model.addAttribute("pay", pay*0.9);
	}
	

	
}
