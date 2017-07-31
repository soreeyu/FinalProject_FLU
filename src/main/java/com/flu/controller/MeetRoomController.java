package com.flu.controller;

import com.flu.util.ListInfo;


import java.io.File;
import java.util.List;
import java.util.UUID;

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


import com.flu.eachRoom.EachRoomServiceImpl;
import com.flu.file.FileSaver;
import com.flu.file.FileService;
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
	public String meetInsert(Model model ,MeetRoomDTO meetRoomDTO, HttpSession session, MultipartHttpServletRequest request) throws Exception{
		System.out.println("meetInsert");
		FileSaver fileSaver = new FileSaver();
		MultipartFile mpf = request.getFile("file");
		String realPath = session.getServletContext().getRealPath("resources/upload");
		meetRoomDTO.setFname(fileSaver.fileSave(realPath, mpf));
		meetRoomDTO.setOname(mpf.getOriginalFilename());
		
		int result = meetRoomServiceImpl.insert(meetRoomDTO, mpf, realPath);
		String message = "실패";
		if(result>0){
			message = "성공";
		}
		
	
		model.addAttribute("message", message);
		model.addAttribute("path", "../meetRoom/meetList");
		
		return "/common/result";
	}
	
	@RequestMapping(value="meetUpdate",method=RequestMethod.GET)
	public String meetUpdate(Integer num, Model model) throws Exception{
		//update form
		MeetRoomDTO meetRoomDTO = (MeetRoomDTO)meetRoomServiceImpl.view(num);
		model.addAttribute("dto", meetRoomDTO);
		
		return "meetRoom/meetInsert";
	}
	
	@RequestMapping(value="meetUpdate",method=RequestMethod.POST)
	public String meetUpdate(MeetRoomDTO meetRoomDTO, MultipartHttpServletRequest request,HttpSession session) throws Exception{
		//update 처리
		FileSaver fileSaver = new FileSaver();
		
		MultipartFile multi=request.getFile("file");
		String realPath = session.getServletContext().getRealPath("resources/upload");
		meetRoomDTO.setFname(fileSaver.fileSave(realPath, multi));
		meetRoomDTO.setOname(multi.getOriginalFilename());
		int result = meetRoomServiceImpl.update(meetRoomDTO, multi, realPath);
		if(result>0){
			System.out.println("업데이트 성공");
		}else {
			System.out.println("업데이트 실패");
			System.out.println(meetRoomDTO.getNum());
		}
		
		return "redirect:/meetRoom/meetView?num="+meetRoomDTO.getNum();
	}
	
	@RequestMapping(value="meetDelete")
	public String meetDelete(Integer num, Model model) throws Exception{
		List<RoomDTO> ar = meetRoomServiceImpl.eachSelect(num);
		int result = meetRoomServiceImpl.delete(num);
		String message = "";
		if(result>0){
			//삭제하려는 업체가 세부공간을 등록하지 않았다면 delete2를 실행하지 않아야한다.
			if(ar!=null){
				int result2 = meetRoomServiceImpl.delete2(num);
				if(result2>0){
					message = "업제 및 세부공간 삭제 성공";
				}else {
					message = "업체삭제성공 , 등록된  세부공간이 없습니다.";
				}
			}
			
		}else {
			message = "업체 및 세부공간 삭제 실패";
		}
		
		
		model.addAttribute("message", message);
		model.addAttribute("path", "../meetRoom/meetList");
		
		return "/common/result";
	}
	
	@RequestMapping(value="meetView", method=RequestMethod.GET)
	public void meetView(Model model, Integer num) throws Exception{
		System.out.println(num+"널인거냐");
		
		MeetRoomDTO meetRoomDTO = (MeetRoomDTO) meetRoomServiceImpl.view(num);
		String [] time = meetRoomDTO.getTime().split(",");
		model.addAttribute("dto", meetRoomDTO);
		model.addAttribute("time", time);
		
	}
	
	
	
	
	
}
