package com.flu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.util.ListInfo;

@Controller
@RequestMapping(value="/project/**")
public class ProjectController {
	
	@Inject
	private ProjectService projectService;
	
	
	//list
	@RequestMapping(value="projectList")
	public String projectList(Model model, ListInfo listInfo){
		
		List<ProjectDTO> ar = projectService.projectList(listInfo);
		
		model.addAttribute("list", ar);
		model.addAttribute("type", "list");
		
		return "project/projectList";
	}
	
	//view
	@RequestMapping(value="projectView", method=RequestMethod.GET)
	public void projectView(Integer projectNum, Model model){
		if(projectNum==null){
			projectNum=1;
		}
		
		ProjectDTO projectDTO = projectService.projectView(projectNum);
		System.out.println(projectDTO.getProjectNum());
		System.out.println(projectDTO.getName());
		System.out.println(projectDTO.getSkill());
		model.addAttribute("dto", projectDTO);
	}
	
	
	
	//projectInsert Form
	@RequestMapping(value="projectWrite", method=RequestMethod.GET)
	public String projectWrite(Model model){
		
		model.addAttribute("type", "write");
		
		return "project/projectWrite"; 
	}
	
	
	//project Write
	@RequestMapping(value="projectWrite", method=RequestMethod.POST)
	public String projectWrite(ProjectDTO projectDTO, RedirectAttributes rd){
		
		System.out.println("projectWrite");
		int result = projectService.projectWrite(projectDTO);
		
		String message = "fail";
		
		if(result==1){
			message = "success";
			
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:/project/projectList";
	}
	
	
	//update form (write form 공유)
	@RequestMapping(value="projectUpdate", method=RequestMethod.GET)
	public String projectUpdate(Model model, ProjectDTO projectDTO){
		
		model.addAttribute("type", "update");
		model.addAttribute("dto", projectDTO);
		
		return "project/projectWrite";
	}
	
	@RequestMapping(value="projectUpdate", method=RequestMethod.POST)
	public String projectUpdate(ProjectDTO projectDTO, RedirectAttributes rd){
		System.out.println("projectUpdate");
		
		int result = projectService.projectUpdate(projectDTO);
		System.out.println(result);
		String message = "fail";
		if(result==1){
			message = "success";
			System.out.println("update success");
		}
		rd.addAttribute("message", message);
		
		return "redirect:/project/projectList";
	}
	
	
	//delete
	@RequestMapping(value="projectDelete")
	public String projectDelete(int projectNum, RedirectAttributes rd){
		System.out.println("projectDelete");
		
		int result =projectService.projectDelete(projectNum);
		
		String message="Delete fail";
		if(result==1){
			message="Delete success";
		}
		
		rd.addAttribute("message", message);
		
		return "redirect:/project/projectList";
	}

	
}
