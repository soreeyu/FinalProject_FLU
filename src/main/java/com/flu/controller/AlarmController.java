package com.flu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flu.alarm.AlarmDTO;
import com.flu.alarm.AlarmService;
import com.flu.member.MemberDTO;

@Controller
@RequestMapping(value="alarm/**")
public class AlarmController {
	
	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping(value="alarmList", method=RequestMethod.GET)
	public void alarmList(Model model, HttpSession session) throws Exception {
		System.out.println("세션 이메일"+((MemberDTO)session.getAttribute("member")).getEmail());
		AlarmDTO alarmDTO = new AlarmDTO();
		alarmDTO.setEmail(((MemberDTO)session.getAttribute("member")).getEmail());
		alarmService.alarmCountUpdate(alarmDTO);
		
		List<AlarmDTO> ar =  alarmService.alarmList(alarmDTO);
		
		if(ar!=null){
			model.addAttribute("alarm", ar);
		}
		
		
	}

	
	@RequestMapping(value="alarmDelte", method=RequestMethod.GET)
	public String alarmDelete(Integer num) throws Exception{
		alarmService.alarmDelete(num);
		
		return "redirect:alarmList";
	}
	
	
	@RequestMapping(value="alarmCount", method= RequestMethod.POST)
	@ResponseBody
	public int alarmCount(HttpSession session) throws Exception{
		AlarmDTO alarmDTO = new AlarmDTO();
		int alarmCount = 0;
		if(session!=null){
			alarmDTO.setEmail(((MemberDTO)session.getAttribute("member")).getEmail());
			alarmCount = alarmService.alarmCount(alarmDTO);			
		}
		return alarmCount;
	}
	
}

