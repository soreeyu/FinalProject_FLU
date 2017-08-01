package com.flu.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.member.MemberDTO;
import com.flu.project.ProjectDTO;
import com.flu.project.ProjectService;
import com.flu.reply.ReplyDTO;
import com.flu.reply.ReplyService;
import com.flu.util.ListInfo;

@RequestMapping(value="/reply/**")
@Controller
public class ReplyController {

	@Inject
	private ReplyService replyService;
	@Inject
	private ProjectService projectService;

	
	
	@RequestMapping(value="replyInsert", method=RequestMethod.POST)
	public String replyInsert(ReplyDTO replyDTO, HttpSession session, MemberDTO memberDTO, ProjectDTO projectDTO, RedirectAttributes rd){
		System.out.println("replyInsert");
		
		
		
		memberDTO = (MemberDTO) session.getAttribute("member");
		System.out.println(memberDTO.getEmail());
		replyDTO.setWriter(memberDTO.getEmail());

	

		System.out.println("projectNum=="+replyDTO.getProjectNum());
		System.out.println("projectDTONum=="+projectDTO.getProjectNum());
		
		int result = replyService.replyInsert(replyDTO);
		if(result==1){
			System.out.println("replySuccess");
		}
		
		System.out.println("email="+memberDTO.getEmail());
		System.out.println("projectNum="+projectDTO.getProjectNum());
		return "redirect:/project/projectView?projectNum="+projectDTO.getProjectNum();
	}
	
		
	@RequestMapping(value="replyDelete", method=RequestMethod.GET)
	public String ReplyDelete(int num, RedirectAttributes rd){
		System.out.println("replyDelete");
		
		int result =replyService.replyDelete(num);
		
		String message="Delete fail";
		if(result==1){
			message="Delete success";
		}
		
		rd.addAttribute("message", message);
		
		return "redirect:/project/projectView";
	}
	
	@RequestMapping(value="replyList", method=RequestMethod.GET)
	public String ReplyList(ListInfo listInfo, ProjectDTO projectDTO, Model model){
		System.out.println("replyList");
		
		int totalCount = replyService.replyCount(listInfo, projectDTO);
		listInfo.makePage(totalCount);
		listInfo.makeRow();

		List<ReplyDTO> ar = replyService.replyList(listInfo, projectDTO);
		
		projectDTO = projectService.projectView(projectDTO.getProjectNum());
		model.addAttribute("replyList", ar);
		model.addAttribute("listInfo", listInfo);
		model.addAttribute("replycount", totalCount);
		model.addAttribute("project", projectDTO);
		System.out.println("project Num="+projectDTO.getProjectNum());
		System.out.println("project-email = "+projectDTO.getEmail());

		for(int i=0;i<ar.size();i++){
			System.out.println(ar.get(i).getNum());
		}
		System.out.println("start="+listInfo.getStartRow());
		System.out.println("last="+listInfo.getLastRow());
		System.out.println("perPage="+listInfo.getPerPage());
		System.out.println("totalCount="+totalCount);
		return "reply/replyList"; 
	}
	
	
	
	public int ReplyCount(ListInfo listInfo, ProjectDTO projectDTO){
		return replyService.replyCount(listInfo, projectDTO);
	}
	
}
