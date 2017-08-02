package com.flu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.eachRoom.EachRoomDTO;
import com.flu.eachRoom.EachRoomServiceImpl;
import com.flu.file.FileSaver;
import com.flu.meetRoom.MeetRoomDTO;
import com.flu.room.RoomDTO;

@Controller
@RequestMapping("/meetRoom/eachRoom/**")
public class EachRoomController {

	@Autowired
	private EachRoomServiceImpl eachRoomServiceImpl;
	
	
	@RequestMapping(value="eachList")
	public void eachList(int num, Model model) throws Exception {
		List<RoomDTO> ar= eachRoomServiceImpl.list(num);
		model.addAttribute("each", ar);
	}
	
	@RequestMapping(value="eachInsert", method=RequestMethod.GET)
	public void eachInsert(int num, Model model) throws Exception{
		//세부공간 등록 폼
		model.addAttribute("num", num);
		MeetRoomDTO meetRoomDTO = eachRoomServiceImpl.time(num);
		String [] time = meetRoomDTO.getTime().split(",");
		model.addAttribute("time", time);
		
	}
	
	@RequestMapping(value="eachInsert",method=RequestMethod.POST)
	public String eachInsert(EachRoomDTO eachRoomDTO,MultipartHttpServletRequest request,HttpSession session, RedirectAttributes redirect) throws Exception{
		FileSaver fileSaver = new FileSaver();
		MultipartFile multi = request.getFile("files");
		String realPath = session.getServletContext().getRealPath("resources/upload");
		
		eachRoomDTO.setFname(fileSaver.fileSave(realPath, multi));
		eachRoomDTO.setOname(multi.getOriginalFilename());
		
		int result = eachRoomServiceImpl.insert(eachRoomDTO, multi, realPath);
		
		if(result>0){
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:/meetRoom/meetView?num="+eachRoomDTO.getSnum();
		
	}
	
	@RequestMapping(value="eachUpdate",method=RequestMethod.GET)
	public String eachUpdate(Integer num, Model model) throws Exception{
		//세부공간 정보 수정 폼
		EachRoomDTO eachRoomDTO = (EachRoomDTO)eachRoomServiceImpl.view(num);
		model.addAttribute("dto", eachRoomDTO);
		return "meetRoom/eachRoom/eachInsert";
	}
	
	@RequestMapping(value="eachUpdate",method=RequestMethod.POST)
	public String eachUpdate(EachRoomDTO eachRoomDTO,MultipartHttpServletRequest request,HttpSession session, RedirectAttributes redirect) throws Exception{
		FileSaver fileSaver = new FileSaver();
		
		MultipartFile multi = request.getFile("files");
		String realPath = session.getServletContext().getRealPath("resources/upload");
		
		eachRoomDTO.setFname(fileSaver.fileSave(realPath, multi));
		eachRoomDTO.setOname(multi.getOriginalFilename());
		
		int result = eachRoomServiceImpl.update(eachRoomDTO, multi, realPath);
		
		if(result>0){
			System.out.println("세부공간 정보 수정 성공");
		}else {
			System.out.println("세부공간 정보 수정 실패");
		}
		
		return "redirect:/meetRoom/meetView?num="+eachRoomDTO.getSnum();
	}
	
	@RequestMapping(value="eachDelete")
	public void eachDelete(Integer num, Model model) throws Exception{
		int result = eachRoomServiceImpl.delete(num);
		String message = "삭제 실패";
		if(result>0){
			message = "삭제 성공";
		}
		model.addAttribute("message", message);
		
		
	}
	
	@RequestMapping(value="eachView",method=RequestMethod.GET)
	public void eachView(Integer num, Model model) throws Exception{
		EachRoomDTO eachRoomDTO =(EachRoomDTO)eachRoomServiceImpl.view(num);
		model.addAttribute("dto", eachRoomDTO);
	}
	
	
}
