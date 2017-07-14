package com.flu.client;



import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ClientDAO{
	
	@Inject
	private SqlSession sqlsession;
	private final String NAMESPACE = "ClientMapper.";
	
	//클라이언트 정보 추가등록(소개,홈페이지 Update)
	public int clientInsert2(ClientDTO clientDTO){
	
		return 0;
	}
	//클라이언트 정보 추가등록(프로젝트 Update)
	public int clientInsert3(ClientDTO clientDTO){
		
		return 0;
	}
	
	public ClientDTO clientView(String email){
		return sqlsession.selectOne(NAMESPACE+"view",email);
	}

	
	
	
}
