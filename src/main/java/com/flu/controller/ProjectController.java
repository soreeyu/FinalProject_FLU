package com.flu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
	
		int totalCount = projectService.projectCount(listInfo);
		listInfo.makePage(totalCount);
		listInfo.makeRow();
		List<ProjectDTO> ar = projectService.projectList(listInfo);
		
		System.out.println("start="+listInfo.getStartRow());
		System.out.println("last="+listInfo.getLastRow());
		System.out.println("ar="+ar.get(0).getName());
		System.out.println("dd="+ar.get(0));
		
		System.out.println("name=="+ar.get(0).getName());
		System.out.println("name=="+ar.get(0).getSkill());
		System.out.println(ar.get(0).getSkill().length());
		Map<String, Object> m = new HashMap<String, Object>();
		/*System.out.println("length=="+ar.get(0).getSkill().length());
		System.out.println(",=="+ar.get(0).getSkill().split(","));*/
		/*for(int i=0;i;i++){
			
		}*/
		
		String[] sp = ar.get(0).getSkill().split(",");
		sp = ar.get(1).getSkill().split(",");
		
		System.out.println(sp);
		System.out.println(sp[0]);
		System.out.println(sp[2]);
		System.out.println(sp.length);
		
		model.addAttribute("skill", sp);
		model.addAttribute("list", ar);
		model.addAttribute("type", "list");
		model.addAttribute("pjcount", totalCount);
		model.addAttribute("listInfo", listInfo);
		
		
		return "project/projectList";

	}
	@RequestMapping(value="arrangeMoney", method=RequestMethod.GET)
	public void arrangeMoney(Model model, ListInfo listInfo){
		System.out.println("=====================");
		System.out.println("arrangeMoney");
		System.out.println(listInfo.getSearch());
		System.out.println(listInfo.getKind());
		System.out.println(listInfo.getArrange());
		System.out.println(listInfo.getCurPage());
		System.out.println("=====================");	
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
		System.out.println(projectDTO.getEmail());
		model.addAttribute("dto", projectDTO);
		
	}
	
	
	
	//projectInsert Form
	@RequestMapping(value="projectInsert", method=RequestMethod.GET)
	public String projectInsert(Model model, HttpSession session, MemberDTO memberDTO){
		System.out.println("projectInsertForm");
		model.addAttribute("type", "insert");
		
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
		return "project/projectInsert"; 
		
	}
	
	
	//project Insert
	@RequestMapping(value="projectInsert", method=RequestMethod.POST)
	public String projectInsert(ProjectDTO projectDTO, RedirectAttributes rd, MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session)throws Exception{
		
		System.out.println("projectInsert");
		

		
		//MultipartFile multi = multipartHttpServletRequest.getFile("fName");
		
		String realPath = session.getServletContext().getRealPath("resources/upload");
		
		FileSaver fileSaver = new FileSaver();
		String fname = fileSaver.fileSave(realPath, projectDTO.getFileName());
		
		projectDTO.setfName(fname);
		projectDTO.setoName(projectDTO.getFileName().getOriginalFilename());
	

		int result = projectService.projectInsert(projectDTO);
		
		String message = "fail";
		
		if(result==1){
			message = "success";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:/project/projectList";
	}
	
	
	//update form (insert form 공유)
	@RequestMapping(value="projectUpdate", method=RequestMethod.GET)
	public String projectUpdate(Model model, ProjectDTO projectDTO, MemberDTO memberDTO, HttpSession session){
		System.out.println("projectUpdateForm");

		memberDTO = (MemberDTO) session.getAttribute("member");
		System.out.println("email=="+memberDTO.getEmail());
		System.out.println(projectDTO.getEmail());
		if(memberDTO.getEmail()==projectDTO.getEmail()){
		
			System.out.println(memberDTO.getKind());	
			System.out.println("수정가능");
		}else{
			

			System.out.println(memberDTO.getKind());	
			System.out.println("수정 불가능");
		}
		
	
		
		model.addAttribute("type", "update");
		model.addAttribute("dto", projectDTO);
		
		return "project/projectInsert";
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
