package com.flu.controller;

import com.flu.util.ListInfo;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.flu.room.RoomDTO;

/*@Controller
@RequestMapping("/eachRoom/**")*/
public class EachRoomController {

	@RequestMapping(value="eachList")
	public void eachList(ListInfo listInfo){
		
	}
	
	@RequestMapping(value="eachInsert",method=RequestMethod.GET)
	public void eachInsert(){
		
	}
	
	@RequestMapping(value="eachInsert",method=RequestMethod.POST)
	public void eachInsert(RoomDTO room,MultipartHttpServletRequest request,HttpSession session){
		
	}
	
	@RequestMapping(value="eachUpdate",method=RequestMethod.GET)
	public void eachUpdate(Integer num){
		
	}
	
	@RequestMapping(value="eachUpdate",method=RequestMethod.POST)
	public void eachUpdate(RoomDTO room,MultipartHttpServletRequest request,HttpSession session){
		
	}
	
	@RequestMapping(value="eachDelete")
	public void eachDelete(Integer num){
		
	}
	
	@RequestMapping(value="eachView",method=RequestMethod.GET)
	public void eachView(Integer num){
		
	}
	
	
}
