package com.flu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flu.member.MemberDTO;

@Controller
@RequestMapping("/chat/*")
public class ChatController {

	@RequestMapping(value="chatView")
	public String chatView(){
		
		return "chat/chat";
	}
	
	
	@RequestMapping(value="chatDo")
	public ModelAndView chatDo(ModelAndView mv,HttpSession session){
		
		mv.setViewName("chat/chat");
		
		String user = ((MemberDTO)(session.getAttribute("member"))).getEmail();
		System.out.println("유저아이디:"+user);
		
		mv.addObject("userID", user);
		
		return mv;
	}
	
	
	
}
