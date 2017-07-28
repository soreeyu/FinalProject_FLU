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
import com.flu.profile.Evaluation;

@Service
public class ClientService{

	@Inject
	private ClientDAO clientDAO;

	//??
	public List<ClientDTO> clientList(){
		return null;
	}


	//클라이언트 정보 수정
	public int clientUpdate(ClientDTO clientDTO){
		return clientDAO.clientUpdate(clientDTO);
	}

	public int clientDelete(){
		return 0;
	}

	//클라이언트 정보 등록
	public int clientInsert(ClientDTO clientDTO){
		
		return clientDAO.clientInsert(clientDTO);
	}
	//클라이언트 정보 추가등록(프로젝트 Update)
	public int clientInsert3(ClientDTO clientDTO){

		return 0;
	}
	
	
	
	
	
	//대금관리에서 클라이언트 정보 조회
	public MemberDTO memberView(String email){
		return clientDAO.memberView(email);
	}
	
	public ClientDTO clientView(String email){
		return clientDAO.clientView(email);
	}
	
	public Evaluation evaluationView(String email){
		return clientDAO.evaluationView(email);
	}
	
	
	
}
