package com.flu.controller;

import com.flu.util.ListInfo;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.flu.reservation.ReservationDTO;
import com.flu.room.RoomDTO;

/*@Controller
@RequestMapping("reservation/**")*/
public class ReservationController {

	@RequestMapping(value="reserveList")
	public void reserveList(ListInfo listInfo){
		
	}
	
	@RequestMapping(value="reserveInsert",method=RequestMethod.GET)
	public void reserveInsert(){
		
	}
	
	@RequestMapping(value="reserveInsert",method=RequestMethod.POST)
	public void reserveInsert(ReservationDTO reserve){
		
	}
	
	@RequestMapping(value="reserveUpdate",method=RequestMethod.GET)
	public void reserveUpdate(Integer num){
		
	}
	
	@RequestMapping(value="reserveUpdate",method=RequestMethod.POST)
	public void reserveUpdate(ReservationDTO reserve){
		
	}
	
	@RequestMapping(value="reserveDelete")
	public void reserveDelete(Integer num){
		
	}
	
	@RequestMapping(value="reserveView",method=RequestMethod.GET)
	public void reserveView(Integer num){
		
	}
	
}
