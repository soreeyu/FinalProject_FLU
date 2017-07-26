package com.flu.controller;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flu.client.ClientDTO;
import com.flu.client.ClientService;
import com.flu.member.MemberDTO;
import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.util.ListInfo;

@Controller
@RequestMapping(value="/member/**")
public class ClientController {

	@Inject
	private ClientService clientService;
	@Inject
	private ProjectService projectService;
	
	//클라이언트 정보 추가등록(소개,홈페이지 Update)
	@RequestMapping(value="clientInsert2" , method=RequestMethod.POST)
	public int clientInsert2(ClientDTO clientDTO){
		
		return 0;
	}
	//클라이언트 정보 추가등록(프로젝트 Update)
	@RequestMapping(value="clientInsert3" , method=RequestMethod.POST)
	public int clientInsert3(ClientDTO clientDTO){

		return 0;
	}
	
	
	
	//클라이언트 프로젝트 페이지
	@RequestMapping(value="clientproject")
	public String myproject(Model model, HttpSession session, ListInfo listInfo, ProjectDTO projectDTO){
		
		 MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		System.out.println("myProject의 email="+memberDTO.getEmail());
		
		
		/*int totalCount =  projectService.clientPjCount(memberDTO);
		System.out.println("client의 project count="+totalCount);
		
		listInfo.makePage(totalCount);
		listInfo.makeRow();
		
		List<ProjectDTO> ar = projectService.clientPjList(listInfo, memberDTO, projectDTO);
		System.out.println("arsize="+ar.size());
		
		for(int i=0;i<ar.size();i++){
			System.out.println(ar.get(i).getProjectNum());
		}*/
	/*
		model.addAttribute("list", ar);
		model.addAttribute("count", totalCount);*/
		model.addAttribute("member", memberDTO);
		model.addAttribute("listInfo", listInfo);
		model.addAttribute("active7", "a");
		
		
		return "/member/client/clientproject";
	}

	//project state에 따른 리스트 불러오는 부분
	@RequestMapping(value="projectCheck", method=RequestMethod.GET)
	public void projectCheck(Model model, ListInfo listInfo, HttpSession session, ProjectDTO projectDTO){
		System.out.println("projectCheck요");
		 MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			System.out.println("myProject의 email="+memberDTO.getEmail());
			
			
			System.out.println("controller에서 state="+projectDTO.getState());
			int totalCount =  projectService.clientPjCount(listInfo, memberDTO, projectDTO);
			System.out.println("client의 project count="+totalCount);
			
			listInfo.makePage(totalCount);
			listInfo.makeRow();
			
			List<ProjectDTO> ar = projectService.clientPjList(listInfo, memberDTO, projectDTO);
		
			
			
			model.addAttribute("list", ar);
			model.addAttribute("count", totalCount);
			model.addAttribute("member", memberDTO);
			model.addAttribute("listInfo", listInfo);
	}
	
		
	
	
}
