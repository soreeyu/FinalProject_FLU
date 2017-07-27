package com.flu.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.flu.client.ClientDTO;
import com.flu.client.ClientService;
import com.flu.member.MemberDTO;
import com.flu.util.RowMaker;

@Controller
@RequestMapping(value="/member/**")
public class ClientController {

	@Inject
	private ClientService clientService;
	
	
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
	public String clientInsert(ClientDTO clientDTO){
		
		System.out.println("이메일 : "+clientDTO.getEmail());
		System.out.println("인트로 : "+clientDTO.getIntro());
		System.out.println("홈페이지: "+clientDTO.getHomepage());
		
		clientService.clientInsert(clientDTO);
		
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
		public String clientUpdate(ClientDTO clientDTO){
			
			clientService.clientUpdate(clientDTO);
			
			
			return "redirect:/member/client/mypage";
		}
	
	//클라이언트 정보 뷰
	@RequestMapping(value="client/mypage")
	public String mypage(Model model, HttpSession session){
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
	

	
	
	
	
	
}
