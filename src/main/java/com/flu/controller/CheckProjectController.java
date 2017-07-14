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
import com.flu.client.ClientService;
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
	
	
	//검수전, 진행전 프로젝트 리스트 불러오기
	@RequestMapping(value="checkProjectList")
	public String listCheck(ListInfo listInfo,Model model){
		List<ProjectDTO> list = checkProjectService.listCheck(listInfo);
		model.addAttribute("list", list);
		return "checkProject/checkProjectList";
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
		model.addAttribute("list", list);
		return "checkProject/checkProjectList";
	}
	
	@RequestMapping(value="checkCashView")
	public String viewCash(Integer projectNum,Model model){
		
		System.out.println("여기 들어왔니?");
		//지원자 리스트 들고오기
		model.addAttribute("applicant", applicantService.list(projectNum));
		//프로젝트 리스트 들고오기
		model.addAttribute("project",projectService.projectView(projectNum));
		
		return "checkProject/checkCashView";
	}

	
}
