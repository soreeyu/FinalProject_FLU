package com.flu.controller;

import com.flu.util.ListInfo;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.flu.room.RoomDTO;

/*@Controller
@RequestMapping("/meetRoom/**")*/
public class MeetRoomController {

	@RequestMapping(value="meetList")
	public void meetList(ListInfo listInfo){
		
	}
	
	@RequestMapping(value="meetInsert",method=RequestMethod.GET)
	public void meetInsert(){
		
	}
	
	@RequestMapping(value="meetInsert",method=RequestMethod.POST)
	public void meetInsert(RoomDTO room,MultipartHttpServletRequest request,HttpSession session){
		
	}
	
	@RequestMapping(value="meetUpdate",method=RequestMethod.GET)
	public void meetUpdate(Integer num){
		
	}
	
	@RequestMapping(value="meetUpdate",method=RequestMethod.POST)
	public void meetUpdate(RoomDTO room,MultipartHttpServletRequest request,HttpSession session){
		
	}
	
	@RequestMapping(value="meetDelete")
	public void meetDelete(Integer num){
		
	}
	
	@RequestMapping(value="meetView",method=RequestMethod.GET)
	public void meetView(Integer num){
		
	}
	
	
}