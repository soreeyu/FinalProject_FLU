package com.flu.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.file.FileSaver;
import com.flu.member.MemberDTO;
import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.util.ListInfo;

@Controller
@RequestMapping(value="/project/**")
public class ProjectController {
	
	@Inject
	private ProjectService projectService;
	
	
	//list
	
	@RequestMapping(value="projectList", method=RequestMethod.GET)
	public String projectList(Model model, ListInfo listInfo){
		
	
		List<ProjectDTO> ar = projectService.projectList(listInfo);
		
		int totalCount = projectService.projectCount(listInfo);
		listInfo.makePage(totalCount);
		int pjcount = projectService.projectCount(listInfo);
		
	
		
		model.addAttribute("list", ar);
		model.addAttribute("type", "list");
		model.addAttribute("pjcount", pjcount);
		model.addAttribute("listInfo", listInfo);
		
		
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
	
	
	
	//projectWrite Form
	@RequestMapping(value="projectWrite", method=RequestMethod.GET)
	public String projectWrite(Model model, HttpSession session, MemberDTO memberDTO){
		System.out.println("projectWriteForm");
		model.addAttribute("type", "write");
		
		memberDTO = (MemberDTO) session.getAttribute("member");
		System.out.println("email=="+memberDTO.getEmail());
		
		System.out.println(memberDTO.getKind());	
		/*if(memberDTO.getKind().equals("client")){
			System.out.println("client다");
		}else if(memberDTO.equals(null)){
			System.out.println("null");
			return "index";
		}else{
			
		}*/
		return "project/projectWrite"; 
		
	}
	
	
	//project Write
	@RequestMapping(value="projectWrite", method=RequestMethod.POST)
	public String projectWrite(ProjectDTO projectDTO, RedirectAttributes rd, MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session)throws Exception{
		
		System.out.println("projectWrite");
		

		
		//MultipartFile multi = multipartHttpServletRequest.getFile("fName");
		
		String realPath = session.getServletContext().getRealPath("resources/upload");
		
		FileSaver fileSaver = new FileSaver();
		String fname = fileSaver.fileSave(realPath, projectDTO.getFileName());
		
		projectDTO.setfName(fname);
		projectDTO.setoName(projectDTO.getFileName().getOriginalFilename());
	

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
	
	//update
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
