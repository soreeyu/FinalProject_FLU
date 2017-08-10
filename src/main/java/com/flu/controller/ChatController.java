package com.flu.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.flu.chat.ChatDTO;
import com.flu.file.FileSaver;
import com.flu.member.MemberDTO;
import com.flu.tproject.EchoHandler;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	

	@Inject
	private EchoHandler echoHandler;



	
	@RequestMapping(value="chatDo")
	public ModelAndView chatDo(ModelAndView mv,HttpSession session,HttpServletRequest request,Integer projectNum){
		
		mv.setViewName("chat/chat");
		
		String clientIP = request.getRemoteAddr();
		String serverIP = request.getLocalAddr();
		String user = ((MemberDTO)(session.getAttribute("member"))).getName();
		//String ip = session에서 IP꺼내기
		
		echoHandler.applicantList(projectNum);
		echoHandler.setId(((MemberDTO)(session.getAttribute("member"))).getEmail());
		
		mv.addObject("user", user).addObject("clientIP",clientIP).addObject("serverIP",serverIP);
		mv.addObject("projectNum", projectNum);
		return mv;
	}
	
	@RequestMapping(value="chatFile", method=RequestMethod.POST)
	public ModelAndView chatFile(HttpServletRequest request,ModelAndView mv,MultipartHttpServletRequest multipartHttpServletRequest,HttpSession session) throws Exception{

		MultipartFile multi = multipartHttpServletRequest.getFile("file2");
		String realPath = session.getServletContext().getRealPath("resources/upload");
		
		FileSaver fileSaver = new FileSaver();
		ChatDTO chatDTO = new ChatDTO();
		

			String fileName = fileSaver.fileSave(realPath, multi);
			
			chatDTO.setWho(((MemberDTO)(session.getAttribute("member"))).getName());
			chatDTO.setFname(fileName);
			chatDTO.setOname(multi.getOriginalFilename());

		mv.setViewName("chat/fileInfo");
		mv.addObject("chatDTO",chatDTO);
		
		return mv;
	}
	
}
