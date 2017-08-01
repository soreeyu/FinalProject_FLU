package com.flu.controller;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;
import com.flu.applicant.ApplicantDTO;
import com.flu.applicant.ApplicantService;
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
	@Inject
	private ApplicantService applicantService;
	@Inject
	private AlarmService alarmService;
	private AlarmDTO alarmDTO;
	
	private String getEmail(HttpSession session){
		
		return ((MemberDTO)session.getAttribute("member")).getEmail();
	}
	
	//클라이언트 정보 등록 폼
	@RequestMapping(value="clientInsert" , method=RequestMethod.GET)
	public String clientInsert(Model model){
		
		model.addAttribute("active1", "a");
		model.addAttribute("path", "clientInsert");
		
		return "/member/client/mypageform";
	}
	//클라이언트 정보 등록
	@RequestMapping(value="clientInsert" , method=RequestMethod.POST)
	public String clientInsert(ClientDTO clientDTO, RedirectAttributes ra) throws Exception{
		
		System.out.println("이메일 : "+clientDTO.getEmail());
		System.out.println("인트로 : "+clientDTO.getIntro());
		System.out.println("홈페이지: "+clientDTO.getHomepage());
		
		int result = clientService.clientInsert(clientDTO);
		if(result>0){
			alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(clientDTO.getEmail());
			alarmDTO.setContents("필요한 정보를 등록하였습니다.");
			alarmService.alarmInsert(alarmDTO);
			ra.addFlashAttribute("alramCount", alarmService.alarmCount(alarmDTO));
		}
		
		return "redirect:/member/client/mypage";
	}
	//클라이언트 정보 수정 폼
	@RequestMapping(value="clientUpdate", method=RequestMethod.GET)
	public String clientUpdate(Model model, HttpSession session){
		
		model.addAttribute("active1", "a");
		model.addAttribute("path", "clientUpdate");
		model.addAttribute("dto", clientService.clientView(this.getEmail(session)));
		
		return "/member/client/mypageform";
	}
	//클라이언트 정보 수정
		@RequestMapping(value="clientUpdate", method=RequestMethod.POST)
		public String clientUpdate(ClientDTO clientDTO) throws Exception{
			
			int result=clientService.clientUpdate(clientDTO);
			if(result>0){
				alarmDTO = new AlarmDTO();
				alarmDTO.setEmail(clientDTO.getEmail());
				alarmDTO.setContents("필요한 정보를 수정하였습니다.");
				alarmService.alarmInsert(alarmDTO);
				
			}
			
			return "redirect:/member/client/mypage";
		}
	
	//클라이언트 정보 뷰
	@RequestMapping(value="client/mypage")
	public String mypage(Model model, HttpSession session) throws Exception{
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(this.getEmail(session));
		
		model.addAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
		model.addAttribute("active1", "a");
		model.addAttribute("dto",clientService.clientView(this.getEmail(session)));
		
		return "/member/client/mypage";
	}
	
	//클라이언트 프로젝트 히스토리
	@RequestMapping(value="history")
	public String history(Model model){
		model.addAttribute("active2", "a");
		return "/member/client/history";
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
			
			
			System.out.println("clientController의 ar="+ar);

			model.addAttribute("list", ar);
			model.addAttribute("count", totalCount);
			model.addAttribute("member", memberDTO);
			model.addAttribute("listInfo", listInfo);
	}
	
	
	
	
}
