package com.flu.client;

import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.stereotype.Service;

import com.flu.member.MemberDTO;

@Service
public class ClientService{

	@Inject
	private ClientDAO clientDAO;

	
	
	//??
	public List<ClientDTO> clientList(){
		return null;
	}



	public int clientUpdate(){
		return 0;
	}

	public int clientDelete(){
		return 0;
	}

	//클라이언트 정보 추가등록(소개,홈페이지 Update)
	public int clientInsert2(ClientDTO clientDTO){

		return 0;
	}
	//클라이언트 정보 추가등록(프로젝트 Update)
	public int clientInsert3(ClientDTO clientDTO){

		return 0;
	}
	
}
