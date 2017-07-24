package com.flu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="alram/**")
public class AlarmController {
	
	@RequestMapping(value="alramList", method=RequestMethod.GET)
	public void alramList() {
		System.out.println("알람리스트입니다.");
	}
}
