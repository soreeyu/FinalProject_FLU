package com.flu.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flu.client.ClientDTO;
import com.flu.client.ClientService;
import com.flu.freelancer.FreelancerService;
import com.flu.util.RowMaker;

/*@Controller
@RequestMapping(value="/member/**")*/
public class ClientController {

	@Inject
	private ClientService clientService;

	//클라이언트 회원 가입
	@RequestMapping(value="clientInsert" , method=RequestMethod.POST)
	public void clientInsert(ClientDTO clientDTO){

	}
	//클라이언트 리스트
	@RequestMapping(value="clientList" , method=RequestMethod.GET)
	public void clientList(RowMaker rowMaker){

	}
	//클라이언트 뷰
	@RequestMapping(value="clientView" , method=RequestMethod.GET)
	public void clientView(String email){

	}
	//클라이언트 정보수정
	@RequestMapping(value="clientUpdate" , method=RequestMethod.POST)
	public void clientUpdate(ClientDTO clientDTO){

	}
	//클라이언트 삭제
	@RequestMapping(value="clientDelete" , method=RequestMethod.GET)
	public void clientDelete(String email){

	}
	
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
