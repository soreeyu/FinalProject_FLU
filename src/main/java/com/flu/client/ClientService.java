package com.flu.client;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ClientService {

	@Inject
	private ClientDAO clientDAO;

	//클라이언트 회원가입
	public int clientInsert(ClientDTO clientDTO){
		return 0;
	}
	//??
	public List<ClientDTO> clientList(){
		return null;
	}

	//
	public ClientDTO clientView(){
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
