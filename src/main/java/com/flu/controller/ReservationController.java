package com.flu.controller;

import com.flu.util.ListInfo;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
		EachRoomDTO eachRoomDTO =  reservaionService.eachView(num);//방 번호를 가지고 해당방의 정보를 뿌려준다.
		MeetRoomDTO meetRoomDTO = reservaionService.accessTime(reservationDTO.getSnum());//업체 번호를 가지고 업체의 정보를 뿌려준다.(운영시간, 위치 등등)
		List<ReservationDTO> ar = reservaionService.reservedTime(reservationDTO);//방 이름과 업체 번호를 가지고와서 해당 업체의 선택한 방의 예약된 정보를 가져온다.
		String [] reserved_time = null;
		if(ar!=null){
			for(int i=0; i<ar.size();i++){
				reserved_time = ar.get(i).getTime().split(",");//예약되어있는 시간을 가져와서 파싱
			}
		}
		model.addAttribute("reserved", ar);//예약되어있는 정보
		model.addAttribute("reserved_time", reserved_time);//예약되어있는 시간
		model.addAttribute("each", eachRoomDTO);//방 정보
		String [] access = meetRoomDTO.getTime().split(",");//해당 업체의 운영시간 파싱
		model.addAttribute("access",access );//운영시간

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
	public void reservedTime(Model model, ReservationDTO reservationDTO) throws Exception{
		List<ReservationDTO> ar = reservaionService.reservedTime2(reservationDTO);
		MeetRoomDTO meetRoomDTO = reservaionService.accessTime(reservationDTO.getSnum());
		String [] access = meetRoomDTO.getTime().split(",");
		model.addAttribute("access", access);
		
		if(ar!=null){
			String [] result;
			ArrayList<String> start = new ArrayList<String>();
			ArrayList<String> last = new ArrayList<String>();
			
			for(int i=0;i<ar.size();i++){
				result = ar.get(i).getTime().split(",");
				
			}

			model.addAttribute("start", start);//예약된 시간들 중에서 입실시간들 ArrayList
			model.addAttribute("last", last);//예약된 시간들 중에서 퇴실시간들 ArrayList
		}

		
	}
}
