package com.flu.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.flu.checkProject.CheckProjectService;
import com.flu.project.ProjectDTO;
import com.flu.util.ListInfo;

@Controller
@RequestMapping("/checkProject/**")
public class CheckProjectController {

	@Inject
	private CheckProjectService checkProjectService;
	
	
	//검수전, 진행전 프로젝트 리스트 불러오기
	@RequestMapping(value="checkProjectList")
	public String list(ListInfo listInfo,Model model){
		List<ProjectDTO> list = checkProjectService.list(listInfo);
		model.addAttribute("list", list);
		return "checkProject/checkProjectList";
	}
	
	@RequestMapping(value="checkProjectUpdate",method=RequestMethod.GET)
	public String update(ProjectDTO projectDTO){
		
			int result = checkProjectService.update(projectDTO);

		return "redirect:/project/projectView?projectNum="+projectDTO.getProjectNum();
	}
	
	
	
	
	
}
