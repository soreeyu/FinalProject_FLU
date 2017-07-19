package com.flu.controller;

import com.flu.util.ListInfo;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.flu.eachRoom.EachRoomDTO;
import com.flu.meetRoom.MeetRoomDTO;
import com.flu.reservation.ReservationDTO;
import com.flu.reservation.ReservationService;
import com.flu.room.RoomDTO;

@Controller
@RequestMapping("/meetRoom/reservation/**")
public class ReservationController {
	
	@Autowired
	private ReservationService reservaionService;
	
	@RequestMapping(value="reserveList")
	public void reserveList(ListInfo listInfo){
		
	}
	
	@RequestMapping(value="reserveInsert", method=RequestMethod.GET)
	public void reserveInsert(Model model, int num, ReservationDTO reservationDTO) throws Exception{
		System.out.println(reservationDTO.getName());
		EachRoomDTO eachRoomDTO =  reservaionService.eachView(num);
		MeetRoomDTO meetRoomDTO = reservaionService.accessTime(reservationDTO.getSnum());
		List<ReservationDTO> ar = reservaionService.reservedTime(reservationDTO);
		String [] reserved_time = null;
		for(int i=0; i<ar.size();i++){
			reserved_time = ar.get(i).getTime().split(",");
		}
		model.addAttribute("reserved", ar);
		model.addAttribute("reserved_time", reserved_time);
		model.addAttribute("each", eachRoomDTO);
		String [] access = meetRoomDTO.getTime().split(",");
		model.addAttribute("access",access );

	}
	
	@RequestMapping(value="reserveInsert",method=RequestMethod.POST)
	public String reserveInsert(ReservationDTO reserve, Model model){
		model.addAttribute("reserveInfo", reserve);
		model.addAttribute("time", reserve.getTime().split(","));
		
		return "/meetRoom/reservation/reservePayment";
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
	@RequestMapping(value="reservePay", method=RequestMethod.POST)
	public void reservePay(ReservationDTO reservationDTO, Model model) throws Exception{
		int result = reservaionService.insert(reservationDTO);
		if(result>0){
			System.out.println("예약성공");
		}else {
			System.out.println("예약실패");
		}
		
	}
	
	@RequestMapping(value="reservedTime", method=RequestMethod.POST)
	public void reservedTime(Model model, String reserve_date, String name, int snum) throws Exception{
		ReservationDTO reservationDTO = new ReservationDTO();
		reservationDTO.setReserve_date(reserve_date);
		reservationDTO.setName(name);
		
		List<ReservationDTO> ar = reservaionService.reservedTime2(reservationDTO);
		MeetRoomDTO meetRoomDTO = reservaionService.accessTime(snum);
		String [] access = meetRoomDTO.getTime().split(",");
		model.addAttribute("access", access);
		if(ar!=null){
			String [] result = null;
			for(int i=0;i<ar.size();i++){
				result = ar.get(i).getTime().split(",");	
			}
			System.out.println(result);
			model.addAttribute("dto", result);
		}


	}
}
