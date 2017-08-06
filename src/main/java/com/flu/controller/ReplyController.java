package com.flu.controller;

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
		
		return "redirect:/project/projectView?projectNum="+projectDTO.getProjectNum();
	}
	
	public String ReplyUpdate(ReplyDTO replyDTO){
		return "";
	}

	@RequestMapping(value="replyDelete", method=RequestMethod.GET)
	public String ReplyDelete(int num, RedirectAttributes rd){
		System.out.println("projectDelete");
		
		int result =replyService.replyDelete(num);
		
		String message="Delete fail";
		if(result==1){
			message="Delete success";
		}
		
		rd.addAttribute("message", message);
		
		return "redirect:/project/projectView?projectNum="+num;
	}
	
	@RequestMapping(value="replyList", method=RequestMethod.GET)
	public String ReplyList(ListInfo listInfo, ProjectDTO projectDTO, Model model){
		System.out.println("replyList");
		
		int totalCount = replyService.replyCount(listInfo, projectDTO);
		listInfo.makePage(totalCount);
		listInfo.makeRow();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listInfo", listInfo);
		map.put("project", projectDTO);
		List<ReplyDTO> ar = replyService.replyList(map);
		
		projectDTO = projectService.projectView(projectDTO.getProjectNum(), projectDTO);
		model.addAttribute("replyList", ar);
		model.addAttribute("listInfo", map.get("listInfo"));
		model.addAttribute("replycount", totalCount);

		model.addAttribute("project", map.get("project"));
		model.addAttribute("map", map);

		model.addAttribute("project", projectDTO);
		System.out.println("project Num="+projectDTO.getProjectNum());
		System.out.println("project-email = "+projectDTO.getEmail());

		System.out.println("ar=="+ar);
		System.out.println("map1="+map);
		System.out.println("map2="+map.size());
		System.out.println("map3="+map.get("project"));
		System.out.println("map3="+map.get("listInfo"));
		
		System.out.println("start="+listInfo.getStartRow());
		System.out.println("last="+listInfo.getLastRow());
		return "reply/replyList"; 
	}
	
	
	
	public int ReplyCount(ListInfo listInfo, ProjectDTO projectDTO){
		return replyService.replyCount(listInfo, projectDTO);
	}
	
}
