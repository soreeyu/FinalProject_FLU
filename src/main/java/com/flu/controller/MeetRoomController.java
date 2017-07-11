package com.flu.controller;

import com.flu.util.ListInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.flu.file.FileSaver;
import com.flu.meetRoom.MeetRoomDTO;
import com.flu.meetRoom.MeetRoomServiceImpl;
import com.flu.room.RoomDTO;

@Controller
@RequestMapping("/meetRoom/**")
public class MeetRoomController {

	@Autowired
	private MeetRoomServiceImpl meetRoomServiceImpl;
	
	@RequestMapping(value="meetList")
	public void meetList(Model model, ListInfo listInfo) throws Exception{
		List<RoomDTO> ar = meetRoomServiceImpl.list(listInfo);
		model.addAttribute("list", ar);
		model.addAttribute("listInfo", listInfo);
		
		
	}
	@RequestMapping(value="meetInsert", method=RequestMethod.GET)
	public void meetInsert(){
		//form
	}
	
	@RequestMapping(value="meetInsert", method=RequestMethod.POST )
	public void meetInsert(MeetRoomDTO meetRoomDTO, HttpSession session, MultipartHttpServletRequest request) throws Exception{
		System.out.println("meetInsert");
		FileSaver fileSaver = new FileSaver();
		MultipartFile mpf = request.getFile("file");
		String realPath = session.getServletContext().getRealPath("resources/upload");
		meetRoomDTO.setFname(fileSaver.fileSave(realPath, mpf));
		meetRoomDTO.setOname(mpf.getOriginalFilename());
		
		int result = meetRoomServiceImpl.insert(meetRoomDTO, mpf, realPath);
		if(result>0){
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
	}
	
	@RequestMapping(value="meetUpdate",method=RequestMethod.GET)
	public void meetUpdate(Integer num){
		//update form
		
	}
	
	@RequestMapping(value="meetUpdate",method=RequestMethod.POST)
	public void meetUpdate(MeetRoomDTO meetRoomDTO, MultipartHttpServletRequest request,HttpSession session){
		
	}
	
	@RequestMapping(value="meetDelete")
	public void meetDelete(Integer num) throws Exception{
		int result = meetRoomServiceImpl.delete(num);
		if(result>0){
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
	}
	
	@RequestMapping(value="meetView", method=RequestMethod.GET)
	public void meetView(Model model, Integer num) throws Exception{
		
		System.out.println(num);
		
		MeetRoomDTO meetRoomDTO = (MeetRoomDTO) meetRoomServiceImpl.view(num);
		
		model.addAttribute("dto", meetRoomDTO);
		
	}
	
	
}
