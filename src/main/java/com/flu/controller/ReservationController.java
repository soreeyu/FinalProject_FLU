package com.flu.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;
import com.flu.eachRoom.EachRoomDTO;
import com.flu.meetRoom.MeetRoomDTO;
import com.flu.member.MemberDTO;
import com.flu.reservation.ReservationDTO;
import com.flu.reservation.ReservationService;
import com.flu.util.ListInfo;



@Controller
@RequestMapping("/meetRoom/reservation/**")
public class ReservationController {

	@Inject
	private ReservationService reservaionService;

	@Inject
	private AlarmService alarmService;
	private AlarmDTO alarmDTO;

	@RequestMapping(value="reserveList")
	public void reserveList(ListInfo listInfo){
		
	}
	

	@RequestMapping(value="reserveInsert", method=RequestMethod.GET)
	public void reserveInsert(Model model, ReservationDTO reservationDTO) throws Exception{
		EachRoomDTO eachRoomDTO =  reservaionService.eachView(reservationDTO.getNum());//방 번호를 가지고 해당 방의 정보를 뿌려준다.
		
		MeetRoomDTO meetRoomDTO = reservaionService.accessTime(reservationDTO.getSnum());//업체 번호를 가지고 업체의 정보를 뿌려준다.(운영시간, 위치 등등)
		Calendar ca = Calendar.getInstance();
		Date da = new Date(ca.getTimeInMillis());
		reservationDTO.setReserve_date(da.toString());
		List<ReservationDTO> ar = reservaionService.reservedTime(reservationDTO);//방 이름과 업체 번호를 가지고와서 해당 업체의 선택한 방의 예약된 정보를 가져온다.
		
		
		System.out.println("업체 휴무일 : "+meetRoomDTO.getHoliday());
		//업체가 정한 휴무일을 받아와서 DATE 형식으로 변환
		
		
		String [] reserved_time = null;
		ArrayList<String> in = new ArrayList<String>();
		ArrayList<String> out = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		String [] access = meetRoomDTO.getTime().split(",");//해당 업체의 운영시간 파싱
		
		if(ar!=null){
			for(int i=0; i<ar.size();i++){
				reserved_time = ar.get(i).getTime().split(",");//예약되어있는 시간을 가져와서 파싱
				in.add(reserved_time[0]);
				out.add(reserved_time[1]);
			}
			map.put("in", in);
			map.put("out", out);
		}
		map.put("meetroom", meetRoomDTO);
		map.put("each", eachRoomDTO);
		map.put("reserved", ar);
		map.put("access", access);
	
	}
	
	@RequestMapping(value="reserveInsert",method=RequestMethod.POST)
	public void reserveInsert(ReservationDTO reserve){
		
	}
	

	
	@RequestMapping(value="reservationDel", method=RequestMethod.GET)
	public String reserveDel(Integer num, HttpSession session, RedirectAttributes ra) throws Exception{
		
		int result = reservaionService.reservationDel(num);
		if(result>0){
			alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(((MemberDTO)session.getAttribute("member")).getEmail());
			alarmDTO.setContents("예약을 취소하셨습니다. 관리자의 승인을 기다리세요");
			alarmService.alarmInsert(alarmDTO);
			ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
		}
		return "redirect:../../member/myMeetRoom";
	}
	
	@RequestMapping(value="reserveDelete")
	public String reserveDelete(Integer num, String email, RedirectAttributes ra) throws Exception{
		int result = reservaionService.delete(num);
		if(result>0){
			alarmDTO = new AlarmDTO();
			alarmDTO.setEmail(email);
			alarmDTO.setContents("예약이 성공적으로 취소되었습니다.");
			alarmService.alarmInsert(alarmDTO);
			ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
		}
		return "redirect:../../member/myMeetRoom";
		
	}
	
	@RequestMapping(value="reservePay", method=RequestMethod.POST)
	public String reservePay(ReservationDTO reservationDTO, Model model, RedirectAttributes ra) throws Exception{
		int result = reservaionService.insert(reservationDTO);
		alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(reservationDTO.getEmail());
		if(result>0){
			System.out.println("예약성공");
			alarmDTO.setContents("미팅룸 예약이 성공적으로 이루어졌습니다. 변경사항이 있거나 취소를 원할 경우 관리자에게 요청하세요");
		}else {
			System.out.println("예약실패");
			alarmDTO.setContents("예약에 실패하였습니다. 관리자에게 문의 하세요.");
		}
		alarmService.alarmInsert(alarmDTO);
		ra.addFlashAttribute("alarmCount", alarmService.alarmCount(alarmDTO));
		return "redirect:../../member/myMeetRoom";
	}
	
	@RequestMapping(value="accessTime", method=RequestMethod.POST)
	public void accessTime(Model model, ReservationDTO reservationDTO) throws Exception{
		System.out.println(reservationDTO.getSnum());
		MeetRoomDTO meetRoomDTO = reservaionService.accessTime(reservationDTO.getSnum());
		System.out.println(meetRoomDTO.getTime());
		String [] access = meetRoomDTO.getTime().split(",");
		model.addAttribute("access", access);
	}
	
	@RequestMapping(value="reservedTime", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reservedTime(Model model, ReservationDTO reservationDTO) throws Exception{
		System.out.println("날짜"+reservationDTO.getReserve_date());
		List<ReservationDTO> ar = reservaionService.reservedTime(reservationDTO);
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<String> in = new ArrayList<String>();
		ArrayList<String> out = new ArrayList<String>();
		String [] reserved = null;
		if(ar!=null){
			for(int i=0;i<ar.size();i++){
				reserved = ar.get(i).getTime().split(",");
				in.add(reserved[0]);
				out.add(reserved[1]);
			}
			map.put("reserve_count", in.size());
			map.put("reserve_in", in);
			map.put("reserve_out", out);
		}
		return map;
	}

}
