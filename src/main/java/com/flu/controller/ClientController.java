package com.flu.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flu.client.ClientDTO;
import com.flu.client.ClientServiceImpl;
import com.flu.member.MemberDTO;
import com.flu.util.RowMaker;

@Controller
@RequestMapping(value="/member/**")
public class ClientController {

	@Inject
	private ClientServiceImpl clientService;
	
	//사이트 회원 가입폼 이동
	@RequestMapping(value="MemberJoin", method=RequestMethod.GET)
	public String MemberJoin(){
		return "member/memberJoinForm";
	}
	//사이트 회원 가입
	@RequestMapping(value="MemberJoin", method=RequestMethod.POST)
	public String MemberJoin(MemberDTO memberDTO){
		
		int result =clientService.clientInsert(memberDTO);
		if(result > 0){
			this.EmailAccess(memberDTO.getEmail());
		}
		return "emailCK";
	}
	
	//이메일 중복 확인
	@RequestMapping(value="jungbokCK", method=RequestMethod.POST)
	@ResponseBody
	public String jungbokCK(String email){
		
		return clientService.jungbok(email);
	}
	
	
	//Email 인증
	private void EmailAccess(String email){
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i<= 6; i++){
			int n = (int) (Math.random()*10);
			buffer.append(n);
		}
		clientService.EmailAccess(email, buffer.toString());
		
		
		
	}
	
	//Email 인증 확인
	@RequestMapping(value="EmailAccessCk")
	public String EmailAccessCk(String num, String email){
		
		System.out.println(clientService.clientView(email).getEmail());
		System.out.println(clientService.clientView(email).getEmailcheck());
		
		if(num.equals(clientService.clientView(email).getEmailcheck()) && email.equals(clientService.clientView(email).getEmail())){
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setEmail(email);
			memberDTO.setEmailcheck("1");
			if(!num.equals("1")){
			clientService.emailck(memberDTO);
			}
			return "redirect:/";
		}else{
			return "redirect:/member/memberJoinForm";
		}
		
	}
	
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
