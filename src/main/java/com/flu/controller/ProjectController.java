package com.flu.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;

@Controller
@RequestMapping(value="/project/**")
public class ProjectController {
	
	@Inject
	private ProjectService projectService;
	
	
	//list
	@RequestMapping(value="projectList")
	public void projectList(){
		
	}
	
	//view
	@RequestMapping(value="projectView")
	public void projectView(int num){
		
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
			System.out.println("success");
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:/project/projectList";
	}
	
	
	//update form (write form 공유)
	@RequestMapping(value="projectUpdate", method=RequestMethod.GET)
	public String projectUpdate(Model model){
		
		model.addAttribute("type", "update");
		
		return "project/projectWrite";
	}
	
	@RequestMapping(value="projectUpdate", method=RequestMethod.POST)
	public String projectUpdate(){
		System.out.println("projectUpdate");
		return "";
	}
	
	
	//delete
	//@RequestMapping(value="projectDelete")
	/*public String projectDelete(int num, RedirectAttributes rd){
		System.out.println("projectDelete");
		
		int result =projectService.projectDelete(num);
		
		String message="Delete fail";
		if(result==1){
			message="Delete success";
		}
		
		rd.addAttribute("message", message);
		
		return "redirect:/project/projectList";
	}*/

	
}
