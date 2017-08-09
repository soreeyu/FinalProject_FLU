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
		replyDTO.setWriter(memberDTO.getEmail());
		
		System.out.println("reply-controller");
		System.out.println(replyDTO.getRef());

		System.out.println("projectNum=="+replyDTO.getProjectNum());
		System.out.println("projectDTONum=="+projectDTO.getProjectNum());
		
		int result = replyService.replyInsert(replyDTO);
		if(result==1){
			System.out.println("replySuccess");
		}
		
		return "redirect:/project/projectView?projectNum="+projectDTO.getProjectNum();
	}
	
	
	//대댓글 작성하기 - 부모의 ref불러와
	@RequestMapping(value="checkReply")
	public void checkReply(ReplyDTO replyDTO){
		//답글 누를 때, 부모의 num을 가지고 ref 불러오기
		System.out.println("checkReply-controller");
		System.out.println("num="+replyDTO.getNum());
		
		
		replyDTO = replyService.checkReply(replyDTO);
		System.out.println("reply-num="+replyDTO.getNum());
		System.out.println("reply-ref="+replyDTO.getRef());
		System.out.println("reply-step="+replyDTO.getStep());
		System.out.println("reply-depth="+replyDTO.getDepth());
		
		/*int result = replyService.insertRef(replyDTO);
		System.out.println("result=="+result);*/
	}
	
	
	@RequestMapping(value="reReply")
	public void reReply(ReplyDTO replyDTO){
		System.out.println("reReply");
		
		System.out.println("writer="+replyDTO.getWriter());
		System.out.println("contents="+replyDTO.getContents());
		System.out.println("replyChk="+replyDTO.getReplyChk());

	}
	
	
	
	


	@RequestMapping(value="replyDelete", method=RequestMethod.GET)
	public String ReplyDelete(int num, RedirectAttributes rd){
		System.out.println("projectDelete");
		
		int result =replyService.replyDelete(num);
		System.out.println("삭제됫는가="+result);
		
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
		
		projectDTO = projectService.projectView(projectDTO);
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
