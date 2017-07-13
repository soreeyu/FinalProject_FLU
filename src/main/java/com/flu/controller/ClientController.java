package com.flu.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.flu.client.ClientDTO;
import com.flu.client.ClientService;
import com.flu.member.MemberDTO;
import com.flu.util.RowMaker;

@Controller
@RequestMapping(value="/member/**")
public class ClientController {

	@Inject
	private ClientService clientService;
	
	
	
	
	
	
	//클라이언트 정보 추가등록(소개,홈페이지 Update)
	@RequestMapping(value="clientInsert2" , method=RequestMethod.POST)
	public int clientInsert2(ClientDTO clientDTO){
		
		return 0;
	}
	//클라이언트 정보 추가등록(프로젝트 Update)
	@RequestMapping(value="clientInsert3" , method=RequestMethod.POST)
	public int clientInsert3(ClientDTO clientDTO){

		return 0;
	}
}
